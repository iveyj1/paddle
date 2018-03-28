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

static const char *TAG = "ad.c";

#define PIN_NUM_MISO 14
#define PIN_NUM_MOSI 27
#define PIN_NUM_CLK  12
#define PIN_NUM_CS   26

void ad_cmd(spi_device_handle_t spi, const uint8_t cmd)
{
    esp_err_t ret;
    spi_transaction_t t;
    memset(&t, 0, sizeof(t));       //Zero out the transaction
    t.length=8;                     //Command is 8 bits
    t.tx_buffer=&cmd;               //The data is the cmd itself
    t.user=(void*)0;                //D/C needs to be set to 0
    ret=spi_device_transmit(spi, &t);  //Transmit!
    assert(ret==ESP_OK);            //Should have had no issues.
}

//Send data to the AD. Uses spi_device_transmit, which waits until the transfer is complete.
void ad_data(spi_device_handle_t spi, uint8_t *data, int len)
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

void ADTask(void *pvParameter)
{
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

    while(1)
    {
        ad_cmd(spi, 0x08);
        vTaskDelay(200/portTICK_PERIOD_MS);
        ad_data(spi, data, sizeof(data));
        ESP_LOGI(TAG, "data: %0x %0x %0x %0x", data[0], data[1], data[2], data[3])

    }
}
