#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/gpio.h"
#include "driver/adc.h"
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
static const char* TAG = "paddle";
#include "checkstack.h"


// blink out an error code
void flashError(uint8_t errno) {
    while(1)
    {
        uint8_t i;
        for (i=0; i<errno; i++)
        {
            gpio_set_level(BLINK, 1);
            vTaskDelay(50/portTICK_PERIOD_MS);;
            gpio_set_level(BLINK, 0);
            vTaskDelay(450/portTICK_PERIOD_MS);;
        }
        vTaskDelay(2000/portTICK_PERIOD_MS);;
    }
}

void testFile()
{
    const char* testpath = "/sdcard/data/testfile";
    struct stat sb;
    FILE *fp;

    if(stat("/sdcard/data", &sb) == -1)
    {
        if(mkdir("/sdcard/data", 0777) == -1)
        {
            ESP_LOGE(TAG, "can't create /data");
            UnmountSD();
            flashError(2);
        }
    }
    stat("/sdcard/data", &sb);
    if(!S_ISDIR(sb.st_mode))
    {
        ESP_LOGE(TAG, "can't create /data");
        UnmountSD();
        flashError(3);
    }
    if(stat(testpath, &sb) == 0)
    {
        if(remove(testpath) == -1)
        {
            ESP_LOGE(TAG, "can't remove %s", testpath);
            UnmountSD();
            flashError(4);
        }
    }

    if((fp = fopen(testpath, "w")) == 0)
    {
        ESP_LOGE(TAG, "can't create %s", testpath);
        UnmountSD();
        flashError(5);
    }

    if(fwrite("t", 1, 1, fp) != 1)
    {
        ESP_LOGE(TAG, "can't write to %s", testpath);
        fclose(fp);
        UnmountSD();
        flashError(6);
    }

    fclose(fp);

    if(stat(testpath, &sb) == -1)
    {
        ESP_LOGE(TAG, "%s doesn't exist", testpath);
        UnmountSD();
        flashError(7);
    }

    if((fp = fopen(testpath, "r")) == 0)
    {
        ESP_LOGE(TAG, "can't open %s", testpath);
        UnmountSD();
        flashError(8);
    }
    char testchar;
    if(fread(&testchar, 1, 1, fp) != 1)
    {
        ESP_LOGE(TAG, "can't read %s", testpath);
        fclose(fp);
        UnmountSD();
        flashError(9);
    }
    if(testchar != 't')
    {
        ESP_LOGE(TAG, "can't read %s", testpath);
        fclose(fp);
        flashError(10);
    }

    fclose(fp);

    if(stat(testpath, &sb) == 0)
    {
        if(remove(testpath) == -1)
        {
            UnmountSD();
            ESP_LOGE(TAG, "can't read %s", testpath);
            flashError(11);
        }
    }
}

void app_main()
{
    uart_set_baudrate(UART_NUM_0, 115200);
    gpio_pad_select_gpio(BLINK);
    gpio_set_direction(BLINK, GPIO_MODE_OUTPUT);
    gpio_set_level(BLINK, 1);  // power light on
    
    adc1_config_width(ADC_WIDTH_12Bit); // set up battery monitoring
    adc1_config_channel_atten(ADC1_CHANNEL_3,ADC_ATTEN_11db);


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
        flashError(1);
    }
    else
    {
        testFile();
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

