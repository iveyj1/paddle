/*
 * expander.c
 *
 *  Created on: Feb 24, 2018
 *      Author: osboxes
 */
#include <stdio.h>
#include "driver/i2c.h"
#include "freertos/FreeRTOS.h"
#include "expander.h"
#include "esp_log.h"


#define EXPANDER_ADDR 0x38

#define EXPANDER_MASTER_SCL_IO          22               /*!< gpio number for I2C master clock */
#define EXPANDER_MASTER_SDA_IO          21               /*!< gpio number for I2C master data  */
#define EXPANDER_MASTER_NUM             I2C_NUM_1        /*!< I2C port number for master dev */
#define EXPANDER_MASTER_TX_BUF_DISABLE  0                /*!< I2C master do not need buffer */
#define EXPANDER_MASTER_RX_BUF_DISABLE  0                /*!< I2C master do not need buffer */
#define EXPANDER_MASTER_FREQ_HZ         100000           /*!< I2C master clock frequency */


#define WRITE_BIT                          I2C_MASTER_WRITE /*!< I2C master write */
#define READ_BIT                           I2C_MASTER_READ  /*!< I2C master read */
#define ACK_CHECK_EN                       0x1              /*!< I2C master will check ack from slave*/
#define ACK_CHECK_DIS                      0x0              /*!< I2C master will not check ack from slave */
#define ACK_VAL                            0x0              /*!< I2C ack value */
#define NACK_VAL                           0x1              /*!< I2C nack value */

// Expander bits

#define BMASK(mask) (1 << (mask))

#define TCA9534_IN_PORT 0x00
#define TCA9534_OUT_PORT 0x01
#define TCA9534_POL_PORT 0x02
#define TCA9534_DIR_PORT 0x03


static const char *TAG = "expander";
static int tca9534_device = 0; // use esp32 i2c device number zero for expander

//uint8_t TestWire(uint8_t address);

/**
 * @brief test code to write esp-i2c-slave
 *
 * Writes two bytes (port plus data) to I2C slave
 * _________________________________________________________________
 * | start | slave_addr + wr_bit + ack | write 1 byte + ack  | stop |
 * --------|---------------------------|---------------------|------| */
static SemaphoreHandle_t expander_mutex = 0;

static esp_err_t Write2I2c(i2c_port_t i2c_num, uint8_t addr, uint8_t port, uint8_t data)
{
    int ret = ESP_FAIL;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, addr << 1 | WRITE_BIT, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, port, ACK_CHECK_EN);
    i2c_master_write_byte(cmd, data, ACK_CHECK_EN);
    i2c_master_stop(cmd);
    ret = i2c_master_cmd_begin(i2c_num, cmd, 1000 / portTICK_RATE_MS);
    i2c_cmd_link_delete(cmd);
    return ret;
}

/* Writes one byte and reads buflen bytes from I2C slave
 * ______________________________________________________________________________________
 * | start | slave_addr + rd_bit + ack | read buflen-1 byte + ack  | read 1 byte + nack | stop |
 * --------|---------------------------|--------------------|--------------------|------|
 */

static esp_err_t WriteReadI2c(i2c_port_t i2c_num, uint8_t addr, uint8_t port, uint8_t* data, size_t buflen)
{
    int ret = ESP_FAIL;
    int bufptr = 0;
    i2c_cmd_handle_t cmd = i2c_cmd_link_create();
    i2c_master_start(cmd);
    i2c_master_write_byte(cmd, addr << 1 | READ_BIT, ACK_CHECK_EN);
    if(buflen > 0 && data != 0)
    {
        for(; bufptr+1 < buflen; bufptr++)
        {
            i2c_master_read_byte(cmd, data+bufptr, ACK_VAL);
        }
        i2c_master_read_byte(cmd, data+bufptr, NACK_VAL);

        i2c_master_stop(cmd);
        ret = i2c_master_cmd_begin(i2c_num, cmd, 1000 / portTICK_RATE_MS);
        i2c_cmd_link_delete(cmd);
    }
    return ret;
}

void SetupExpander()
{
    if(!expander_mutex)
    {
        expander_mutex = xSemaphoreCreateMutex();
    }
    int ret = xSemaphoreTake(expander_mutex, (TickType_t) 2);
    if(ret != pdTRUE)
    {
        ESP_LOGI(TAG, "Mutex lock timed out in SetupExpander");
        assert(0);
    }
    int i2c_master_port = 0;
    i2c_config_t conf;
    conf.mode = I2C_MODE_MASTER;
    conf.sda_io_num = EXPANDER_MASTER_SDA_IO;
    conf.sda_pullup_en = GPIO_PULLUP_ENABLE;
    conf.scl_io_num = EXPANDER_MASTER_SCL_IO;
    conf.scl_pullup_en = GPIO_PULLUP_ENABLE;
    conf.master.clk_speed = EXPANDER_MASTER_FREQ_HZ;
    i2c_param_config(i2c_master_port, &conf);
    i2c_driver_install(i2c_master_port, conf.mode,
                       EXPANDER_MASTER_RX_BUF_DISABLE,
                       EXPANDER_MASTER_TX_BUF_DISABLE, 0);

    Write2I2c(tca9534_device, EXPANDER_ADDR, TCA9534_OUT_PORT, EXPANDER_INIT_STATE );
    Write2I2c(tca9534_device, EXPANDER_ADDR, TCA9534_POL_PORT, EXPANDER_INIT_POL );
    Write2I2c(tca9534_device, EXPANDER_ADDR, TCA9534_DIR_PORT, EXPANDER_INIT_DIR );
    xSemaphoreGive(expander_mutex);
}

int BsetExpander(uint8_t bit, uint8_t val)
{
    uint8_t temp;

    int ret = xSemaphoreTake(expander_mutex, (TickType_t) 2);
    if(ret != pdTRUE)
    {
        ESP_LOGI(TAG, "Mutex lock timed out in BsetExpander");
        assert(0);
    }
    
    if (WriteReadI2c(tca9534_device, EXPANDER_ADDR, TCA9534_OUT_PORT, &temp, 1 ) != ESP_OK)
    {
        xSemaphoreGive(expander_mutex);
        return(ESP_FAIL);
    }

    temp = (temp & ~BMASK(bit)) | (-((int8_t)val) & bmask(bit));  // sets or clears bit indexed by "bit" depending on val
//    ESP_LOGI("expander", "bit: %d, val: %d, temp: %x", bit, val, temp);
    ret = Write2I2c(tca9534_device, EXPANDER_ADDR, TCA9534_OUT_PORT, temp);
    xSemaphoreGive(expander_mutex);
    return(ret);
}

int SetExpander(uint8_t val)
{
    int ret = xSemaphoreTake(expander_mutex, (TickType_t) 2);
    if(ret != pdTRUE)
    {
        ESP_LOGI(TAG, "Mutex lock timed out in SetExpander");
        return ret;
    }
    ret = Write2I2c(tca9534_device, EXPANDER_ADDR, TCA9534_OUT_PORT, val);
    xSemaphoreGive(expander_mutex);
    return(ret);
}
