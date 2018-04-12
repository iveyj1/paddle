#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "driver/spi_master.h"
#include "soc/gpio_struct.h"
#include "driver/gpio.h"
#include "esp_log.h"
#include "esp_err.h"
#include "sd.h"
#include "gps.h"

static const char *TAG = "ad";

static int acquire = 0;

#define PIN_NUM_AD_MISO 14
#define PIN_NUM_AD_MOSI 27
#define PIN_NUM_AD_CLK  12
#define PIN_NUM_AD_CS   26

const static int ad_cs_table[4] = { 26, 25, 33, 32 };  // IO pins for a/d channel 0-3
static int ad_current = 0;

//Send data to the AD. Uses spi_device_transmit, which waits until the transfer is complete.
void ADSetup(spi_device_handle_t spi)
{
    esp_err_t ret;
    spi_transaction_t t;
    int i;
    for(ad_current = 0; ad_current < 4; ad_current++)
    {
        memset(&t, 0, sizeof(t));               //Zero out the transaction
        t.flags = SPI_TRANS_USE_RXDATA | SPI_TRANS_USE_TXDATA; // use local data storage, not allocated
        t.length = 16;                          //Transaction length is in bits.
        t.tx_data[0] = 0x44;                    // Write one byte to register 1
        t.tx_data[1] = 0x40;                    // Data rate 90 SPS normal mode, single shot, temp sensor off, burnout current off
        ret = spi_device_transmit(spi, &t);
        assert(ret == ESP_OK);                    //Should have had no issues.
    }
}


void ADCmd(spi_device_handle_t spi, const uint8_t cmd)
{
    esp_err_t ret;
    spi_transaction_t t;
    memset(&t, 0, sizeof(t));       //Zero out the transaction
    t.length=8;                     //Command is 8 bits
    t.tx_buffer=&cmd;               //The data is the cmd itself
    ret=spi_device_transmit(spi, &t);
    assert(ret == ESP_OK);            //Should have had no issues.
}

//Send data to the AD. Uses spi_device_transmit, which waits until the transfer is complete.
void ADData(spi_device_handle_t spi, uint8_t *data, int len)
{
    esp_err_t ret;
    spi_transaction_t t;
    if (len < 4) return;                    //Not enough room to receive
    memset(&t, 0, sizeof(t));               //Zero out the transaction
    t.flags = SPI_TRANS_USE_RXDATA | SPI_TRANS_USE_TXDATA; // use local data storage, not allocated
    t.length = 32;                         //Transaction length is in bits.
    memcpy(t.tx_data, (uint8_t[]){0x10, 0x00, 0x00, 0x00}, 4) ;  //RDATA command followed by dummy bytes
    ret=spi_device_transmit(spi, &t);       //Transmit
    assert(ret == ESP_OK);                    //Should have had no issues.
    memcpy(data, t.rx_data, 4);
}

void ADStartAcquire()
{
    acquire = true;
}

void ADStopAcquire()
{
    acquire = false;
}

void PreSPICallback(spi_transaction_t *config)
{
    gpio_set_level(ad_cs_table[ad_current], 0);
}

void PostSPICallback(spi_transaction_t *config)
{
    gpio_set_level(ad_cs_table[ad_current], 1);
}

TickType_t previous_wake_time;
char nmeabuf[NMEA_BUF_LEN];

void ADTask(void *pvParameter)
{

    TickType_t previous_wake_time;

    esp_err_t ret;
    spi_device_handle_t spi;

    spi_bus_config_t buscfg={
        .miso_io_num=PIN_NUM_AD_MISO,
        .mosi_io_num=PIN_NUM_AD_MOSI,
        .sclk_io_num=PIN_NUM_AD_CLK,
        .quadwp_io_num=-1,
        .quadhd_io_num=-1
    };

    spi_device_interface_config_t devcfg={
        .mode=1,                                //SPI mode 1
        .clock_speed_hz=1*1000*1000,           //Clock out at 10 MHz
        .spics_io_num = -1,               //CS pin
        .queue_size=1,                          //We want to be able to queue 7 transactions at a time
        .pre_cb = PreSPICallback,                              //no pre-transfer callback
        .post_cb = PostSPICallback
    };

    int i;
    for (i = 0; i < 4; i++)
    {
        gpio_pad_select_gpio(ad_cs_table[i]);
        gpio_set_direction(ad_cs_table[i], GPIO_MODE_OUTPUT);
        gpio_set_level(ad_cs_table[i], 1);
    }
    
    //Initialize the SPI bus

    ret=spi_bus_initialize(VSPI_HOST, &buscfg, 0); // HSPI is used by SD
    assert(ret==ESP_OK);
    //Attach the LCD to the SPI bus
    ret=spi_bus_add_device(VSPI_HOST, &devcfg, &spi);
    assert(ret==ESP_OK);
    ESP_LOGI(TAG, "attached to VSPI for AD");

    uint8_t data[4];

    ADSetup(spi);
    int32_t val;
    int print_nmea;
    int acq_in_progress = 0;
    int32_t adval[4];
    while(1)
    {
        if(acquire)
        {
            if(acq_in_progress)
            {
                for(ad_current = 0; ad_current < 4; ad_current++)
                {
                    ADCmd(spi, 0x08);  // start conversion
                }
                
                vTaskDelayUntil(&previous_wake_time, 20 / portTICK_PERIOD_MS );
                
                for(ad_current = 0; ad_current < 4; ad_current++)
                {
                    ADData(spi, data, sizeof(data));
                    val = (int32_t)((data[1]<<24) + (data[2]<<16) + (data[3]<<8));
                    val >>= 8;
                    adval[ad_current] = val;
                }
                
                print_nmea = GetLastNMEAMessage(nmeabuf, NMEA_BUF_LEN);
                if(print_nmea)
                {
                    //ESP_LOGI(TAG, "%s", nmeabuf);
                }
                int64_t timenow =  esp_timer_get_time()/1000;
                if(acqfile)
                {
                    fprintf(acqfile,"%10lld,%12.0d,%12.0d,%12.0d,%12.0d,", timenow, adval[0], adval[1], adval[2], adval[3]);
                    if(print_nmea)
                    {
                        fprintf(acqfile, "%s", nmeabuf);
                    }
                    fprintf(acqfile,"\r\n");
                }
                ESP_LOGI(TAG, "%10lld,%12.0d,%12.0d,%12.0d,%12.0d,", timenow, adval[0], adval[1], adval[2], adval[3]);
            }
            else  // is this logic working?
            {
                if(!OpenNextAcqFile())
                {
                    ESP_LOGE(TAG, "failed to open acq file");
                }
                acq_in_progress = true;
            }
        }
        else
        {
            if(acq_in_progress)
            {
                CloseAcqFile();
                acq_in_progress = false;
            }
            vTaskDelayUntil(&previous_wake_time, 25 / portTICK_PERIOD_MS );
        }
    }
}

#if 0
        if(print_nmea)
        {
            ESP_LOGI(TAG, "%10lld,%12.0d,0,0,0,%s", timenow, val, nmeabuf);
        } else
        {
            ESP_LOGI(TAG, "%10lld,%12.0d,0,0,0,", timenow, val);
        }
#endif

