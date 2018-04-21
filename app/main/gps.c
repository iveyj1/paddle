#include <stdio.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/uart.h"
#include "esp_log.h"
#include "gps.h"

static const char* TAG = "gps.c";
static const char* GPS_CMD_HOT_START = "$PMTK101*32\r\n";
static const char* GPS_CMD_RMS = "$PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29\r\n";
static const char* GPS_CMD_100MS = "$PMTK220,100*2F\r\n"; // 100ms position solutions
static const char* GPS_CMD_SBAS = "$PMTK313,1*2E\r\n"; // enable SBAS
static const char* GPS_CMD_FACTORY_RESET = "$PMTK104*37\r\n";

#define ECHO_TEST_TXD  (GPIO_NUM_17)
#define ECHO_TEST_RXD  (GPIO_NUM_16)
#define ECHO_TEST_RTS  (UART_PIN_NO_CHANGE)
#define ECHO_TEST_CTS  (UART_PIN_NO_CHANGE)

SemaphoreHandle_t nmea_buffer_mutex;
uint8_t *nmea_buffer[2] = {0, 0};
int nmea_buffer_num = 0;
int nmea_available = false;


// Copy last complete new NMEA message to buffer
// if no new buffer, returns false and doesn't copy

int GetLastNMEAMessage(char* buffer, size_t bufsize)
{
    int ret = xSemaphoreTake(nmea_buffer_mutex, (TickType_t) 1);
    if(ret != pdTRUE)
    {
        ESP_LOGI(TAG, "Mutex lock timed out in GetLastNMEAMessage");
        return ret;
    }
    else
    {
        if(nmea_available)
        {
            strncpy(buffer, (char *)nmea_buffer[1 - nmea_buffer_num], bufsize);
            buffer[bufsize - 1] = 0;

            nmea_available = false;
            xSemaphoreGive(nmea_buffer_mutex);
            return true;
        }
        else
        {
            xSemaphoreGive(nmea_buffer_mutex);
            return false;
        }
    }
}

void GpsTask(void *pvParameter)
{
    nmea_buffer_mutex =  xSemaphoreCreateMutex();
    uint8_t data_byte = 0;
    size_t nmea_buffer_index = 0;
    nmea_buffer_num = 0;
    int len = 0;
    if( nmea_buffer_mutex == NULL )
    {
        ESP_LOGE(TAG, "NMEA mutex not created");
    }
    xSemaphoreTake(nmea_buffer_mutex, portMAX_DELAY);
    // Configure a temporary buffer for the incoming data
    nmea_buffer[0] = (uint8_t *) malloc(NMEA_BUF_LEN);
    nmea_buffer[0][0] = '\0';
    nmea_buffer[1] = (uint8_t *) malloc(NMEA_BUF_LEN);
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
    uart_driver_install(UART_NUM_1, NMEA_BUF_LEN * 2, 0, 0, NULL, 0);

    do
    {
        len = uart_read_bytes(UART_NUM_1, &data_byte, 1, 200 / portTICK_RATE_MS);
        //ESP_LOGI(TAG, "len %d byte %d", len, data_byte);
    } while(len == 0 || data_byte != '$');
    uart_write_bytes(UART_NUM_1, GPS_CMD_HOT_START, strlen(GPS_CMD_HOT_START));
    vTaskDelay(1000/portTICK_PERIOD_MS);
    uart_write_bytes(UART_NUM_1, GPS_CMD_RMS, strlen(GPS_CMD_RMS));
    vTaskDelay(100/portTICK_PERIOD_MS);
    uart_write_bytes(UART_NUM_1, GPS_CMD_100MS, strlen(GPS_CMD_100MS));
    vTaskDelay(100/portTICK_PERIOD_MS);
    uart_write_bytes(UART_NUM_1, GPS_CMD_SBAS, strlen(GPS_CMD_SBAS));
    vTaskDelay(100/portTICK_PERIOD_MS);

    //esp_err_t starttime = esp_timer_get_time();
    while (1) {
        // Read data from the UART
        len = uart_read_bytes(UART_NUM_1, &data_byte, 1, 200 / portTICK_RATE_MS);
        if (len>0)
        {
            xSemaphoreTake(nmea_buffer_mutex, portMAX_DELAY);
            if (data_byte == '\r')
            {
                nmea_buffer[nmea_buffer_num][nmea_buffer_index] = 0;
                //ESP_LOGI(TAG, "NMEA: %s", nmea_buffer[nmea_buffer_num]);
                //ESP_LOGI(TAG, "Previous NMEA: %s", nmea_buffer[1-nmea_buffer_num]);
                //ESP_LOGI(TAG, "%lld", esp_timer_get_time());
                //ESP_LOGI(TAG, "Stack high-water: %d", uxTaskGetStackHighWaterMark(NULL));
                nmea_buffer_index = 0;
                nmea_buffer_num = 1 - nmea_buffer_num;
                nmea_available = true;
            } else if (data_byte == '\n')
            {
                ;
            }
                else
            {
                nmea_buffer[nmea_buffer_num][nmea_buffer_index] = data_byte;
                nmea_buffer_index = (nmea_buffer_index < NMEA_BUF_LEN - 1) ? nmea_buffer_index + 1 : nmea_buffer_index;
            }
            xSemaphoreGive(nmea_buffer_mutex);
        }
    }
}
