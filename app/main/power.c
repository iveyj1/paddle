#include "driver/gpio.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "expander.h"

// IO ports
#define KEEPALIVE 4
#define POWER_SW 35

void SetupPower()
{
    gpio_pad_select_gpio(KEEPALIVE);
    gpio_set_direction(KEEPALIVE, GPIO_MODE_OUTPUT);
    gpio_set_level(KEEPALIVE, 1);
    gpio_pad_select_gpio(POWER_SW);
    gpio_set_direction(POWER_SW, GPIO_MODE_INPUT);
}

void checkPowerSwitch()
{
    if(gpio_get_level(POWER_SW) == 0)
    {
        vTaskDelay(2000/portTICK_PERIOD_MS);
        gpio_set_level(KEEPALIVE, 0);
#if 0
        int i;
        logfile.close();
        delay(50);
        for(i=0; i<10; i++)
        {
            delay(100);
            digitalWrite(BLINK, HIGH);
            delay(100);
            digitalWrite(BLINK, LOW);
        }
        digitalWrite(KEEPALIVE, LOW);
#endif
    }
}

void PowerTask(void *pvParameter)
{
    while(1)
    {
        checkPowerSwitch();
        vTaskDelay(200/portTICK_PERIOD_MS);
    }
}
