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
#include "expander.h"

static const char *TAG = "ad";
static int acquire = 0;

#define PORT_AD_MISO 14
#define PORT_AD_MOSI 27
#define PORT_AD_CLK  12
#define PORT_AD_CS0  26
#define PORT_AD_CS1  25
#define PORT_AD_CS2  33
#define PORT_AD_CS3  32
#define PORT_AD_BUSY 35
#define NUM_AD 4
#define AD_MSG_LEN 4
#define LOOPTIME 20  // loop time in ms, minimum 10 (== tick time)
const static int ad_cs_table[NUM_AD] = { PORT_AD_CS0, PORT_AD_CS1, PORT_AD_CS2, PORT_AD_CS3 };  // IO pins for a/d channel 0-3
static int ad_current = 0;

#define WRITE_BUF_LEN 2048

#include "checkstack.h"

//Send data to the AD. Uses spi_device_transmit, which waits until the transfer is complete.
void ADSetup(spi_device_handle_t spi)
{
    esp_err_t ret;
    spi_transaction_t t;

    gpio_pad_select_gpio(PORT_AD_BUSY);
    gpio_set_direction(PORT_AD_BUSY, GPIO_MODE_INPUT);
    
    
    for(ad_current = 0; ad_current < NUM_AD; ad_current++)
    {
        memset(&t, 0, sizeof(t));               //Zero out the transaction
        t.flags = SPI_TRANS_USE_RXDATA | SPI_TRANS_USE_TXDATA; // use local data storage, not allocated
        t.length = 16;                          //Transaction length is in bits.

        t.tx_data[0] = 0x40;                    // Write one byte to register 0
        t.tx_data[1] = 0x34;                    // convert AIN1 - AIN2, gain 4, PGA off (gain 1-4 ok without PGA)
        ret = spi_device_transmit(spi, &t);
        assert(ret == ESP_OK);                    
 
        t.tx_data[0] = 0x44;                    // Write one byte to register 1
        t.tx_data[1] = 0x40;                    // Data rate 90 SPS, normal mode, single shot, temp sensor off, burnout current off
        ret = spi_device_transmit(spi, &t);
        assert(ret == ESP_OK);                 

        t.tx_data[0] = 0x48;                    // Write one byte to register 2
        t.tx_data[1] = 0x40;                    // VREF=REFP0, REFN0, low side switch open, idac off
        ret = spi_device_transmit(spi, &t);
        assert(ret == ESP_OK);                    
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
    if (len < AD_MSG_LEN) return;                    //Not enough room to receive
    memset(&t, 0, sizeof(t));               //Zero out the transaction
    t.flags = SPI_TRANS_USE_RXDATA | SPI_TRANS_USE_TXDATA; // use local data storage, not allocated
    t.length = 32;                         //Transaction length is in bits.
    memcpy(t.tx_data, (uint8_t[]){0x10, 0x00, 0x00, 0x00}, AD_MSG_LEN) ;  //RDATA command followed by dummy bytes
    ret=spi_device_transmit(spi, &t);       //Transmit
    assert(ret == ESP_OK);                    //Should have had no issues.
    memcpy(data, t.rx_data, AD_MSG_LEN);
}

void ADStartAcquire()
{
    acquire = true;
}

void ADStopAcquire()
{
    acquire = false;
}

int ADAcquireInProgress()
{
    return acquire;
}

void PreSPICallback(spi_transaction_t *config)
{
    gpio_set_level(ad_cs_table[ad_current], 0);
}

void PostSPICallback(spi_transaction_t *config)
{
    gpio_set_level(ad_cs_table[ad_current], 1);
}

char nmeabuf[NMEA_BUF_LEN];
char writebuf[WRITE_BUF_LEN];

void ADTask(void *pvParameter)
{
    TickType_t previous_wake_time;

    esp_err_t ret;
    spi_device_handle_t spi;

    spi_bus_config_t buscfg={
        .miso_io_num=PORT_AD_MISO,
        .mosi_io_num=PORT_AD_MOSI,
        .sclk_io_num=PORT_AD_CLK,
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
    for (i = 0; i < NUM_AD; i++)
    {
        gpio_pad_select_gpio(ad_cs_table[i]);
        gpio_set_direction(ad_cs_table[i], GPIO_MODE_OUTPUT);
        gpio_set_level(ad_cs_table[i], 1);
    }
    
    //Initialize the SPI bus
    ret=spi_bus_initialize(VSPI_HOST, &buscfg, 0); // HSPI is used by SD
    assert(ret==ESP_OK);
    ret=spi_bus_add_device(VSPI_HOST, &devcfg, &spi);
    assert(ret==ESP_OK);
    ESP_LOGI(TAG, "attached to VSPI for AD");

    ADSetup(spi);
    
    uint8_t ad_temp[AD_MSG_LEN];
    int32_t val;
    int print_nmea = false;
    int acq_in_progress = 0;
    int32_t adval[NUM_AD];
    float filtval = 0.0f;
    float offset = 0;
    int sample_count = 0;
    float filt_coef = 0.05;
    uint32_t blown_looptime = 0;
    previous_wake_time = xTaskGetTickCount();
    int64_t toptime, toptime_last, looptime;
    toptime_last = esp_timer_get_time();
    
    while(1)
    {
        vTaskDelayUntil(&previous_wake_time, LOOPTIME / portTICK_PERIOD_MS );
        toptime = esp_timer_get_time();
        looptime = toptime - toptime_last;
        toptime_last = toptime;
        if(acquire)
        {
            if(acq_in_progress)
            {
                ESP_LOGD(TAG, "toptime: %lld", toptime);
                if(looptime >= 20200 || looptime <= 19800)
                {
                    blown_looptime++;
                    ESP_LOGI(TAG, "****************** Looptime out of range: %lld", looptime);
                }
                for(ad_current = 0; ad_current < NUM_AD; ad_current++)
                {
                    ADCmd(spi, 0x08);  // start conversion
                }
                for(ad_current = 0; ad_current < NUM_AD; ad_current++)
                {
                    ADData(spi, ad_temp, sizeof(ad_temp));
                    val = (int32_t)((ad_temp[1]<<24) + (ad_temp[2]<<16) + (ad_temp[3]<<8));  // assemble at left side of int so sign bit is correct
                    // first byte is empty
                    val >>= 8;  // right shift to get scale correct - sign will be extended
                    adval[ad_current] = val - offset;
                }
                print_nmea = GetLastNMEAMessage(nmeabuf, NMEA_BUF_LEN, false);
                
                filtval = filtval * (1-filt_coef) + (float)(adval[0] - adval[1]) * filt_coef;
                int64_t timenow =  esp_timer_get_time()/1000;
                if(acqfile)
                {
                    int n = snprintf(writebuf, WRITE_BUF_LEN, "%10lld,%12d,%12d,%12d,%12d,%lld,%2d,", timenow, adval[0], adval[1], adval[2], adval[3], looptime, blown_looptime);
                    if(print_nmea)
                    {
                        n += snprintf(writebuf + n, WRITE_BUF_LEN - n, "%s", nmeabuf);
                    }
                    n += snprintf(writebuf + n, WRITE_BUF_LEN - n, "\r\n");
                    acqQueue(writebuf, n);
                }
                //ESP_LOGI(TAG, "%10lld,%12.0d,%12.0d,%12.0d,%12.0d,%12.0f", timenow, adval[0], adval[1], adval[2], adval[3], filtval - offset);
                if(sample_count++ == 100)
                {
                   // offset = filtval;
                    filt_coef *= 10;
                }
            }
            else
            {
                ESP_LOGI(TAG, "starting acq");
                if(OpenNextAcqFile())
                {
                    blown_looptime = 0;
                    previous_wake_time = xTaskGetTickCount();
                    acq_in_progress = true;
                    sample_count = 0;
                }
                else
                {
                    ESP_LOGE(TAG, "failed to open acq file");
                }
            }
        }
        else
        {
            if(acq_in_progress)
            {
                ESP_LOGI(TAG, "stopping acq");
                CloseAcqFile();
                acq_in_progress = false;
            }
        }
        checkStack();
        //ESP_LOGI(TAG, "duration %lld", esp_timer_get_time() - starttime);

    }
}


