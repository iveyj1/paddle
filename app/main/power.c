#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "expander.h"
#include "sd.h"
#include "ad.h"

#include "esp_log.h"
#include "power.h"

#define PORT_ACQ_SW  15

static const char TAG[]="Power";

#include "checkstack.h"

static char tasklist_buf[1024];

void CheckPowerSwitch()
{

    if(gpio_get_level(POWER_SW) == 0)
    {
        vTaskDelay(20/portTICK_PERIOD_MS);
        if(gpio_get_level(POWER_SW) == 0)
        {
            vTaskDelay(20/portTICK_PERIOD_MS);
            vTaskList(tasklist_buf);
            ESP_LOGI(TAG, "Tasks\n%s", tasklist_buf);
            ESP_LOGI(TAG, "power switch off");
            ADStopAcquire();
            while(acqfile)
            {
                vTaskDelay(1);
            }
            UnmountSD();
            vTaskDelay(500/portTICK_PERIOD_MS);
            gpio_set_level(KEEPALIVE, 0);
            ESP_LOGI(TAG, "Max stack: %d", uxTaskGetStackHighWaterMark(NULL));
            vTaskList(tasklist_buf);
            ESP_LOGI(TAG, "Tasks: %s\n", tasklist_buf);

            while(1)
            {
                vTaskDelay(1);
            }
            // why is power.c stack sensitive to SD not being in place?
            // 3472 bytes vs 2528 when SD in?
        }
    }
}

void CheckAcqSwitch()
{
    if(ADAcquireInProgress())
    {
        if(gpio_get_level(PORT_ACQ_SW) == 0)
        {
            vTaskDelay(1);
            if(gpio_get_level(PORT_ACQ_SW) == 0)
            {
                ADStopAcquire(); 
                ESP_LOGI(TAG, "acq switch on");
            }
        }
    }   
    else
    {
        if(gpio_get_level(PORT_ACQ_SW) == 1)
        {
            vTaskDelay(1);
            if(gpio_get_level(PORT_ACQ_SW) == 1)
            {
                ADStartAcquire(); 
                ESP_LOGI(TAG, "acq switch off");
            }
        }
    }   
}

void PowerTask(void *pvParameter)
{
    gpio_pad_select_gpio(KEEPALIVE);
    gpio_set_direction(KEEPALIVE, GPIO_MODE_OUTPUT);
    gpio_set_level(KEEPALIVE, 1);

    gpio_pad_select_gpio(POWER_SW);
    gpio_set_direction(POWER_SW, GPIO_MODE_INPUT);

    gpio_pad_select_gpio(PORT_ACQ_SW);
    gpio_set_direction(PORT_ACQ_SW, GPIO_MODE_INPUT);
    gpio_pullup_en(PORT_ACQ_SW);
    
    while(1)
    {
        CheckPowerSwitch();
        CheckAcqSwitch();
        checkStack();
        vTaskDelay(1);
    }
}
