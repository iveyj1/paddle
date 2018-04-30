#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "expander.h"
#include "sd.h"
#include "ad.h"

#include "esp_log.h"
#include "power.h"

#define PORT_ACQ_SW  15

//#define BUTTON_SW // uncomment to support pushbutton power switch rather than a toggle switch

static const char TAG[]="Power";

void CheckPowerSwitch()
{

    if(gpio_get_level(POWER_SW) == 0)
    {
        vTaskDelay(20/portTICK_PERIOD_MS);
        if(gpio_get_level(POWER_SW) == 0)
        {
            vTaskDelay(20/portTICK_PERIOD_MS);
            ESP_LOGI(TAG, "Powering off");
            ADStopAcquire();
            vTaskDelay(50/portTICK_PERIOD_MS);
            UnmountSD();
            vTaskDelay(50/portTICK_PERIOD_MS);
            gpio_set_level(KEEPALIVE, 0);
            gpio_set_level(13,0);
            ESP_LOGI(TAG, "Max stack: %d", uxTaskGetStackHighWaterMark(NULL));
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
    //ESP_LOGI(TAG, "acquire switch state: %d", gpio_get_level(PORT_ACQ_SW));
    if(ADAcquireInProgress())
    {
        if(gpio_get_level(PORT_ACQ_SW) == 0)
        {
            vTaskDelay(1);
            if(gpio_get_level(PORT_ACQ_SW) == 0)
            {
                ADStopAcquire(); 
                ESP_LOGI(TAG, "acq stopped");
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
                ESP_LOGI(TAG, "acq started");
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
        vTaskDelay(1);
    }
}
