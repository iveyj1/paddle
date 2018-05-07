#ifndef _CHECKSTACK_H
#define _CHECKSTACK_H
#include <stddef.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_log.h"
inline static void checkStack()
{
    static size_t max_stack_prev = 0;
    if(uxTaskGetStackHighWaterMark(NULL) != max_stack_prev)
    {
        max_stack_prev = uxTaskGetStackHighWaterMark(NULL);
        ESP_LOGI(TAG, "Stack remaining: %d", max_stack_prev);
    }
}
#endif