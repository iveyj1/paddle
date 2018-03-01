#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "sdkconfig.h"

#include "driver/i2c.h"
#include "expander.h"
#include "power.h"
#include "gps.h"
#include "esp_log.h"
#include "string.h"
#include "sd.h"

#define BLINK 13
static const char* TAG = "paddle";

void blink_task(void *pvParameter)
{
    gpio_pad_select_gpio(BLINK);
    /* Set the GPIO as a push/pull output */
    gpio_set_direction(BLINK, GPIO_MODE_OUTPUT);

    SetupExpander();
    while(1) {
        /* Blink off (output low) */
        gpio_set_level(BLINK, 0);
        BsetExpander(LED0,1);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
        /* Blink on (output high) */
        gpio_set_level(BLINK, 1);
        BsetExpander(LED0,0);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}

void TestTask(void *pvParameter)
{
    while(1)
    {
        ;
    }
}

int CheckNMEAMessage(char* buffer, size_t bufsize)
{
    int ret = xSemaphoreTake(nmea_buffer_mutex, (TickType_t) 1);
    if(ret != pdTRUE)
    {
        ESP_LOGI(TAG, "Mutex locked in AcqTask");
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
    xSemaphoreGive(nmea_buffer_mutex);
    return(ret);
}


TickType_t previous_wake_time;

void AcqTask(void *pvParameter)
{
    int ret;
    char buf[1024];
    buf[0] = 0;
    //esp_err_t starttime = esp_timer_get_time();

    while(1)
    {
        vTaskDelayUntil(&previous_wake_time, (TickType_t) 5);
        if(CheckNMEAMessage(buf, 1024))
        {
            ESP_LOGI(TAG, "%s", buf);
        }
    }
}

void app_main()
{
    SetupPower();
    xTaskCreate(&blink_task, "blink_task", configMINIMAL_STACK_SIZE, NULL, 5, NULL);
    xTaskCreate(&PowerTask, "power_task", configMINIMAL_STACK_SIZE, NULL, 5, NULL);
    xTaskCreate(GpsTask, "GPS task", 2048, NULL, 10, NULL);
    xTaskCreate(AcqTask, "Acq task", 4096, NULL, 10, NULL);
    OpenLog();
}
