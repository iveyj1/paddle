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

#define BLINK 13
static const char* TAG = "paddle";


void app_main()
{
    gpio_pad_select_gpio(BLINK);
    /* Set the GPIO as a push/pull output */
    gpio_set_direction(BLINK, GPIO_MODE_OUTPUT);
    SetupExpander();
    BSetExpander(GPS_ENABLE, 0);
    vTaskDelay(20/portTICK_PERIOD_MS);
    BSetExpander(SD_ENABLE, 0);
    vTaskDelay(50/portTICK_PERIOD_MS);  // may need 500 ms to start SD - don't know if this is handled by mount

    if(!MountSD())
    {
        ESP_LOGE(TAG, "failed to mount SD");
    }

    xTaskCreate(&PowerTask, "power_task", 4096, NULL, 5, NULL);
    xTaskCreate(GpsTask, "GPS task", 4096, NULL, 7, NULL);
    xTaskCreate(ADTask, "AD task", 4096, NULL, 10, NULL);
    ADStartAcquire();
}

