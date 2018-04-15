#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "expander.h"
#include "sd.h"
#include "ad.h"

#include "esp_log.h"
#include "power.h"

//#define BUTTON_SW

static const char TAG[]="Power";

void CheckPowerButton()
{
    //int msg_sent = 0;
    while(gpio_get_level(POWER_SW) == 1)
    {
        vTaskDelay(20/portTICK_PERIOD_MS);
    }

#ifdef BUTTON_SW
    while(gpio_get_level(POWER_SW) == 0)
    {
        vTaskDelay(20/portTICK_PERIOD_MS);
    }
    vTaskDelay(20/portTICK_PERIOD_MS);
    if(gpio_get_level(POWER_SW) == 1)
#else
    vTaskDelay(20/portTICK_PERIOD_MS);
    if(gpio_get_level(POWER_SW) == 0)
#endif
    {
        ESP_LOGI(TAG, "Powering off");
        CloseAcqFile();
        vTaskDelay(100/portTICK_PERIOD_MS);
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
    ESP_LOGI(TAG, "Power button released");

}

void CheckAcqButton()
{

}

void PowerTask(void *pvParameter)
{
    gpio_pad_select_gpio(KEEPALIVE);
    gpio_set_direction(KEEPALIVE, GPIO_MODE_OUTPUT);
    gpio_set_level(KEEPALIVE, 1);
    gpio_pad_select_gpio(POWER_SW);
    gpio_set_direction(POWER_SW, GPIO_MODE_INPUT);
    
    while(1)
    {
        CheckPowerButton();
        vTaskDelay(1);
    }
}
