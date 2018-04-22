#include <stdio.h>
#include <dirent.h>
#include <time.h>
#include <sys/time.h>
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

void app_main()
{
    gpio_pad_select_gpio(BLINK);
    gpio_set_direction(BLINK, GPIO_MODE_OUTPUT);
    gpio_set_level(BLINK, 1);
    
    SetupExpander();
    
    BsetExpander(GPS_ENABLE, 0);  // Turn on GPS
    vTaskDelay(10/portTICK_PERIOD_MS);
    
    BsetExpander(VA_3_3_ENABLE, 1);  // Enable analog board voltage regulator
    vTaskDelay(10/portTICK_PERIOD_MS);
    
    BsetExpander(SD_ENABLE, 0);      // Turn on SD card
    vTaskDelay(500/portTICK_PERIOD_MS);  // may need 500 ms to start SD - don't know if this is handled by mount

    if(!MountSD())
    {
        ESP_LOGE(TAG, "failed to mount SD");
    }
    
    xTaskCreate(PowerTask, "Power", 4096, NULL, 5, NULL);
    xTaskCreate(ServerTask, "Webserver", 32768, NULL, 6, NULL);
    xTaskCreate(GpsTask, "GPS", 4096, NULL, 7, NULL);
    xTaskCreate(ADTask, "AD", 4096, NULL, 10, NULL);
    ADStartAcquire();

    struct timeval tv = { 1524273992 , 0};
    settimeofday(&tv, NULL);
    setenv("TZ", "America/New_York", 1);
    tzset();
    struct timeval tv1;
    vTaskDelay(200);
    gettimeofday(&tv1, NULL);
    ESP_LOGI(TAG, "tv: %ld", tv1.tv_sec);
    
}

