#include <stdio.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "sdkconfig.h"
#include "freertos/semphr.h"

#include "expander.h"
#include "power.h"
#include "gps.h"
#include "esp_log.h"
#include "string.h"
#include "sd.h"
#include "ad.h"
#include "esp_timer.h"
#include "httpd_paddle.h"

#define BLINK 13
static const char* TAG = "paddle";

#include "checkstack.h"

static char tasklist_buf[1024];


void app_main()
{
    gpio_pad_select_gpio(BLINK);
    gpio_set_direction(BLINK, GPIO_MODE_OUTPUT);
    
    SetupExpander();
    
    BsetExpander(GPS_ENABLE, 0);  // Turn on GPS
    vTaskDelay(10/portTICK_PERIOD_MS);
    
    BsetExpander(VA_3_3_ENABLE, 1);  // Enable analog board voltage regulator
    vTaskDelay(10/portTICK_PERIOD_MS);
    
    BsetExpander(SD_ENABLE, 0);      // Turn on SD card
    vTaskDelay(500/portTICK_PERIOD_MS);  // may need 500 ms to start SD - don't know if this is handled by mount

    acq_file_mutex = xSemaphoreCreateMutex();
    nmea_buffer_mutex = xSemaphoreCreateMutex();

    if(!MountSD())
    {
        ESP_LOGE(TAG, "failed to mount SD");
    }
    
    xTaskCreate(PowerTask, "Power", 4096, NULL, 5, NULL);
    //xTaskCreate(ServerTask, "Webserver", 32768, NULL, 6, NULL);
    xTaskCreate(GpsTask, "GPS", 4096, NULL, 7, NULL);
    xTaskCreate(sdAcqWriteTask, "acqwrite", 16384, NULL, 8, NULL);
    xTaskCreate(ADTask, "AD", 8192, NULL, 10, NULL);
    //ADStartAcquire();
    checkStack();
    //acqQueue("0123456789abcdefgh", 18);
    //acqQueue("0123456789abcdefgh", 18);
    while(1)
    {
        //vTaskList(tasklist_buf);
        //ESP_LOGI(TAG, "Tasks: %s\n", tasklist_buf);
        vTaskDelay(50);
    }
}

