#include <stdio.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/uart.h"
#include "esp_log.h"

static const char* TAG = "GPS";
static const char* GPS_CMD_RMS = "$PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29\r\n";
static const char* GPS_CMD_100MS = "$PMTK220,100*2F\r\n"; // 100ms position solutions
static const char* GPS_CMD_SBAS = "$PMTK313,1*2E\r\n"; // enable SBAS
//static const char* GPS_CMD_FACTORY_RESET = "$PMTK104*37\r\n";
static const char* GPS_CMD_HOT_START = "$PMTK101*32\r\n";

#define ECHO_TEST_TXD  (GPIO_NUM_17)
#define ECHO_TEST_RXD  (GPIO_NUM_16)
#define ECHO_TEST_RTS  (UART_PIN_NO_CHANGE)
#define ECHO_TEST_CTS  (UART_PIN_NO_CHANGE)

#define BUF_SIZE (1024)

SemaphoreHandle_t nmea_buffer_mutex;
uint8_t *nmea_buffer[2] = {0, 0};
int nmea_buffer_num = 0;
int nmea_available = false;

void GpsTask()
{
    nmea_buffer_mutex =  xSemaphoreCreateMutex();
    uint8_t data_byte = 0;
    size_t nmea_buffer_index = 0;
    nmea_buffer_num = 0;
    if( nmea_buffer_mutex == NULL )
    {
        ESP_LOGE(TAG, "NMEA mutex not created");
    }
    xSemaphoreTake(nmea_buffer_mutex, portMAX_DELAY);
    // Configure a temporary buffer for the incoming data
    nmea_buffer[0] = (uint8_t *) malloc(BUF_SIZE);
    nmea_buffer[0][0] = '\0';
    nmea_buffer[1] = (uint8_t *) malloc(BUF_SIZE);
    nmea_buffer[1][0] = '\0';
    xSemaphoreGive(nmea_buffer_mutex);
    /* Configure parameters of an UART driver,
     * communication pins and install the driver */
    uart_config_t uart_config = {
        .baud_rate = 9600,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE
    };
    uart_param_config(UART_NUM_1, &uart_config);
    uart_set_pin(UART_NUM_1, ECHO_TEST_TXD, ECHO_TEST_RXD, ECHO_TEST_RTS, ECHO_TEST_CTS);
    uart_driver_install(UART_NUM_1, BUF_SIZE * 2, 0, 0, NULL, 0);

    uart_write_bytes(UART_NUM_1, GPS_CMD_HOT_START, strlen(GPS_CMD_HOT_START));
    vTaskDelay(1000/portTICK_PERIOD_MS);
    uart_write_bytes(UART_NUM_1, GPS_CMD_RMS, strlen(GPS_CMD_RMS));
    uart_write_bytes(UART_NUM_1, GPS_CMD_100MS, strlen(GPS_CMD_100MS));
    uart_write_bytes(UART_NUM_1, GPS_CMD_SBAS, strlen(GPS_CMD_SBAS));

    esp_err_t starttime = esp_timer_get_time();
    while (1) {
        // Read data from the UART
        int len = uart_read_bytes(UART_NUM_1, &data_byte, 1, 200 / portTICK_RATE_MS);
        if (len>0)
        {
            xSemaphoreTake(nmea_buffer_mutex, portMAX_DELAY);
            if (data_byte == '\n')
            {
                nmea_buffer[nmea_buffer_num][nmea_buffer_index] = 0;
                //ESP_LOGI(TAG, "Current: %s", nmea_buffer[nmea_buffer_num]);
                //ESP_LOGI(TAG, "Previous: %s", nmea_buffer[1-nmea_buffer_num]);
                //ESP_LOGI(TAG, "%lld", esp_timer_get_time());
                //ESP_LOGI(TAG, "Stack high-water: %d", uxTaskGetStackHighWaterMark(NULL));
                nmea_buffer_index = 0;
                nmea_buffer_num = 1 - nmea_buffer_num;
                nmea_available = true;
            } else
            {
                nmea_buffer[nmea_buffer_num][nmea_buffer_index] = data_byte;
                nmea_buffer_index = (nmea_buffer_index < BUF_SIZE - 1) ? nmea_buffer_index + 1 : nmea_buffer_index;
            }
            xSemaphoreGive(nmea_buffer_mutex);
        }
    }
}