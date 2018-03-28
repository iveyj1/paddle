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
#include "ad.h"
#include "esp_timer.h"

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
        BsetExpander(LED0,1);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
        /* Blink on (output high) */
        BsetExpander(LED0,0);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
}

void TimerCallback(void *arg)
{
    static int phase = 0;
    if(phase)
    {
        gpio_set_level(BLINK, 0);
    }
    else
    {
        gpio_set_level(BLINK, 1);
    }
    phase = 1-phase;
}


TickType_t previous_wake_time;

#define NEMA_BUF_LEN 256
//#define ACQ_BUF_LEN 512
#define ACQ_PERIOD 50 //ms

char nmeabuf[NEMA_BUF_LEN] = "";
//char outbuf[ACQ_BUF_LEN] = "";
static const char msg[] = "0,0,0,0,";

void AcqTask(void *pvParameter)
{
    //esp_err_t starttime = esp_timer_get_time();

    while(1)
    {
        vTaskDelayUntil(&previous_wake_time, ACQ_PERIOD / portTICK_PERIOD_MS );
        if(acqfile)
        {
            fprintf(acqfile,"%10lld,0,0,0,0,",esp_timer_get_time());
            if(GetLastNMEAMessage(nmeabuf, NEMA_BUF_LEN))
            {
                fprintf(acqfile, "%s", nmeabuf);
            }
            fprintf(acqfile,"\r\n");
        }
    }
}

esp_timer_handle_t acq_timer_handle;

void app_main()
{
    SetupPower();
    xTaskCreate(&blink_task, "blink_task", configMINIMAL_STACK_SIZE, NULL, 5, NULL);
    //xTaskCreate(&PowerTask, "power_task", 4096, NULL, 5, NULL);
    xTaskCreate(GpsTask, "GPS task", 4096, NULL, 10, NULL);
    xTaskCreate(AcqTask, "Acq task", 4096, NULL, 10, NULL);
    xTaskCreate(ADTask, "AD task", 4096, NULL, 10, NULL);
    if(!OpenNextAcqFile())
    {
        ESP_LOGE(TAG, "failed to open acq file");
    }
    esp_timer_create_args_t t_arg = { .callback = &TimerCallback, .arg = NULL, .dispatch_method = ESP_TIMER_TASK, .name = "AcqTimer" };
    esp_timer_create(&t_arg, &acq_timer_handle);
    esp_timer_start_periodic(acq_timer_handle, 1000);
}
