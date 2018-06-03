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
#include "driver/uart.h"
#define BLINK 13
static const char* TAG = "paddle";
#include "checkstack.h"

void app_main()
{
    uart_set_baudrate(UART_NUM_0, 460800);
    gpio_pad_select_gpio(BLINK);
    gpio_set_direction(BLINK, GPIO_MODE_OUTPUT);
    
    SetupExpander();
    BsetExpander(2,1); // indicate SD not mounted yet
    
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
    
    xTaskCreatePinnedToCore(PowerTask, "Power", 4096, NULL, 5, NULL,0);
    xTaskCreatePinnedToCore(ServerTask, "Webserver", 32768, NULL, 6, NULL,0);
    xTaskCreatePinnedToCore(GpsTask, "GPS", 4096, NULL, 7, NULL,0);
    xTaskCreatePinnedToCore(sdAcqWriteTask, "acqwrite", 8192, NULL, 8, NULL,0);
    xTaskCreatePinnedToCore(ADTask, "AD", 8192, NULL, 24, NULL,1);
    checkStack();

    while(1)
    {
        //vTaskList(tasklist_buf);
        //ESP_LOGI(TAG, "Tasks: %s\n", tasklist_buf);
        vTaskDelay(50);
    }
}

