#include "driver/gpio.h"
#include "driver/adc.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"
#include "esp_heap_caps.h"
#include "expander.h"
#include "sd.h"
#include "ad.h"

#include "esp_log.h"
#include "power.h"

#define PORT_ACQ_SW  15

static const char TAG[]="Power";

#include "checkstack.h"

static char tasklist_buf[1024];

static int lowv = 0;

void CheckPowerSwitch()
{

	int val = adc1_get_raw(ADC1_CHANNEL_3);
	float volts = 4.0;//val * ESP_AD_V_CONST;
    //ESP_LOGI(TAG, "counts: %d; voltage: %f", val, volts);
	lowv = (volts < MIN_BATV) ? lowv + 1 : 0;
    if(gpio_get_level(POWER_SW) == 0 || lowv > 10)
    {
        ESP_LOGI(TAG, "switch: %d, voltage: %f", gpio_get_level(POWER_SW), volts);
        vTaskDelay(20/portTICK_PERIOD_MS);
        if(gpio_get_level(POWER_SW) == 0 || lowv > 10)
        {
            ESP_LOGI(TAG, "switch: %d", gpio_get_level(POWER_SW));
            vTaskDelay(1);
            //vTaskList(tasklist_buf);
            //ESP_LOGI(TAG, "Tasks\n%s", tasklist_buf);
            ESP_LOGI(TAG, "xPortGetFreeHeapSize: %u", xPortGetFreeHeapSize());
            ESP_LOGI(TAG, "heap_caps_get_largest_free_block: %u", heap_caps_get_largest_free_block(MALLOC_CAP_8BIT));
            if(acqfile)
            {
                ADStopAcquire();
            }
            while(acqfile)
            {
                vTaskDelay(1);
            }
            ESP_LOGI(TAG, "xPortGetFreeHeapSize: %u", xPortGetFreeHeapSize());
            ESP_LOGI(TAG, "heap_caps_get_largest_free_block: %u", heap_caps_get_largest_free_block(MALLOC_CAP_8BIT));
            ESP_LOGI(TAG, "xPortGetFreeHeapSize: %u", xPortGetFreeHeapSize());
            UnmountSD();
            vTaskDelay(500/portTICK_PERIOD_MS);
            gpio_set_level(KEEPALIVE, 0);
            //ESP_LOGI(TAG, "Max stack: %d", uxTaskGetStackHighWaterMark(NULL));
            //heap_caps_dump_all();
            ESP_LOGI(TAG, "xPortGetFreeHeapSize: %u", xPortGetFreeHeapSize());
            ESP_LOGI(TAG, "heap_caps_get_largest_free_block: %u", heap_caps_get_largest_free_block(MALLOC_CAP_8BIT));
            vTaskList(tasklist_buf);
            ESP_LOGI(TAG, "Tasks:\n%s", tasklist_buf);

            while(1)
            {
                vTaskDelay(10);
                gpio_set_level(BLINK, 0);
                vTaskDelay(10);
                gpio_set_level(BLINK, 1);

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
    unsigned int minheap = 99999999;
    unsigned int minheapblk = 99999999;

    gpio_pad_select_gpio(KEEPALIVE);
    gpio_set_direction(KEEPALIVE, GPIO_MODE_OUTPUT);
    gpio_set_level(KEEPALIVE, 0);  // Not using hold-on anymore, relies on RC of 1 sec or so

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
        if(xPortGetFreeHeapSize() < minheap)
        {
            minheap = xPortGetFreeHeapSize();
            ESP_LOGW(TAG, "Min heap size: %u", minheap);
        }
        if(heap_caps_get_largest_free_block(MALLOC_CAP_8BIT) < minheapblk)
        {
            minheapblk = heap_caps_get_largest_free_block(MALLOC_CAP_8BIT);
            ESP_LOGW(TAG, "Min heap contiguous block size: %u", minheapblk);
        }
        vTaskDelay(1);
    }
}
