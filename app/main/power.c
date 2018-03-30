#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "expander.h"
#include "sd.h"
#include "ad.h"

#include "esp_log.h"


// IO ports
#define KEEPALIVE 4
#define POWER_SW 35

static const char TAG[]="Power";



void checkPowerSwitch()
{
    if(gpio_get_level(POWER_SW) == 0)
    {
        CloseAcqFile();
        vTaskDelay(2000/portTICK_PERIOD_MS);
        gpio_set_level(KEEPALIVE, 0);
        ESP_LOGI(TAG, "Max stack: %d", uxTaskGetStackHighWaterMark(NULL));
        // why is power.c stack sensitive to SD not being in place?
        // 3472 bytes vs 2528 when SD in?
    }
}

void checkAcqButton()
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
        checkPowerSwitch();
        checkAcqButton();
        vTaskDelay(200/portTICK_PERIOD_MS);
    }
}
