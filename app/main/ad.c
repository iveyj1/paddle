/*
 * ad.c
 *
 *  Created on: Mar 22, 2018
 *      Author: osboxes
 */
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

#define PIN_NUM_MISO 14
#define PIN_NUM_MOSI 27
#define PIN_NUM_CLK  12
#define PIN_NUM_CS   26

//Send data to the AD. Uses spi_device_transmit, which waits until the transfer is complete.
void ADSetup(spi_device_handle_t spi)
{
    esp_err_t ret;
    spi_transaction_t t;
    memset(&t, 0, sizeof(t));               //Zero out the transaction
    t.flags = SPI_TRANS_USE_RXDATA | SPI_TRANS_USE_TXDATA; // use local data storage, not allocated
    t.length = 16;                          //Transaction length is in bits.
    t.tx_data[0] = 0x44;                    // Write one byte to register 1
    t.tx_data[1] = 0x40;                    // Data rate 90 SPS normal mode, single shot, temp sensor off, burnout current off
    ret=spi_device_transmit(spi, &t);
    assert(ret==ESP_OK);                    //Should have had no issues.
}


void ADCmd(spi_device_handle_t spi, const uint8_t cmd)
{
    esp_err_t ret;
    spi_transaction_t t;
    memset(&t, 0, sizeof(t));       //Zero out the transaction
    t.length=8;                     //Command is 8 bits
    t.tx_buffer=&cmd;               //The data is the cmd itself
    ret=spi_device_transmit(spi, &t);
    assert(ret==ESP_OK);            //Should have had no issues.
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
    ret=spi_device_transmit(spi, &t);       //Transmit!
    assert(ret==ESP_OK);                    //Should have had no issues.
    memcpy(data, t.rx_data, 4);
}


TickType_t previous_wake_time;
char nmeabuf[NMEA_BUF_LEN];

void ADTask(void *pvParameter)
{
    TickType_t previous_wake_time;

    esp_err_t ret;
    spi_device_handle_t spi;

    spi_bus_config_t buscfg={
        .miso_io_num=PIN_NUM_MISO,
        .mosi_io_num=PIN_NUM_MOSI,
        .sclk_io_num=PIN_NUM_CLK,
        .quadwp_io_num=-1,
        .quadhd_io_num=-1
    };

    spi_device_interface_config_t devcfg={
        .mode=1,                                //SPI mode 1
        .clock_speed_hz=10*1000*1000,           //Clock out at 10 MHz
        .spics_io_num=PIN_NUM_CS,               //CS pin
        .queue_size=7,                          //We want to be able to queue 7 transactions at a time
        .pre_cb=0,                              //no pre-transfer callback
    };

    //Initialize the SPI bus

    ret=spi_bus_initialize(VSPI_HOST, &buscfg, 0); // HSPI used by SD in SPI mode
    assert(ret==ESP_OK);
    //Attach the LCD to the SPI bus
    ret=spi_bus_add_device(VSPI_HOST, &devcfg, &spi);
    assert(ret==ESP_OK);
    ESP_LOGI(TAG, "attached to VSPI for AD");

    uint8_t data[4];

    ADSetup(spi);
    int32_t val;
    int print_nmea;
    while(1)
    {
        ADCmd(spi, 0x08);  // start conversion
        vTaskDelayUntil(&previous_wake_time, 20 / portTICK_PERIOD_MS );
        ADData(spi, data, sizeof(data));
        val = (int32_t)((data[1]<<24) + (data[2]<<16) + (data[3]<<8));
        val >>= 8;
        print_nmea = GetLastNMEAMessage(nmeabuf, NMEA_BUF_LEN);
        //ESP_LOGI(TAG, "print_nmea: %d", print_nmea);

        if(acqfile)
        {
            fprintf(acqfile,"%10lld,%12.0d,0,0,0,", esp_timer_get_time(), val);
            if(print_nmea)
            {
                fprintf(acqfile, "%s", nmeabuf);
            }
            fprintf(acqfile,"\r\n");
        }

        if(print_nmea)
        {
            ESP_LOGI(TAG, "%10lld,%12.0d,0,0,0,%s", esp_timer_get_time(), val, nmeabuf);
        } else
        {
            ESP_LOGI(TAG, "%10lld,%12.0d,0,0,0,", esp_timer_get_time(), val);
        }
    }
}
