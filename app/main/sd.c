#include <stdio.h>
#include <string.h>
#include <sys/unistd.h>
#include <sys/stat.h>
#include "esp_err.h"
#include "esp_log.h"
#include "esp_vfs_fat.h"
#include "driver/sdmmc_host.h"
#include "driver/sdspi_host.h"
#include "sdmmc_cmd.h"
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
//#include "freertos/projdefs.h"
#include "expander.h"

#include "sd.h"

#define min(x, y) ({                \
    typeof(x) _min1 = (x);          \
    typeof(y) _min2 = (y);          \
    (void) (&_min1 == &_min2);      \
    _min1 < _min2 ? _min1 : _min2; })

static const char *TAG = "sd";

#define LED_WRITE 0
#define LED_FILE_OPEN 3
#define LED_SD_UNMOUNTED 2

// Pin mapping when using SPI mode.

#define PIN_NUM_MISO 19
#define PIN_NUM_MOSI 23
#define PIN_NUM_CLK  18
#define PIN_NUM_CS   5

FILE *acqfile = 0;
bool sd_mounted = false;

#define ACQWRITE_BUFFER_LEN 4096
static char acqwrite_buffer[ACQWRITE_BUFFER_LEN] = "";
static int acqwrite_index_in = 0;   // index into acqwrite_buffer -- next character to be filled when written to 
static int acqwrite_index_out = 0;  // index into acqwrite_buffer -- next character to be written out -- 
                                    //== index_in when all characters have been written to SD
SemaphoreHandle_t acq_file_mutex = 0;
static int close_acq_file = false;

// used by other tasks to store info to the buffer
int acqQueue(const char* buf, int length)
{
    for(int i = 0; i < length; i++)
    {
        acqwrite_buffer[(acqwrite_index_in + i) % ACQWRITE_BUFFER_LEN] = buf[i];
    }

    if(xSemaphoreTake(acq_file_mutex, (TickType_t) 200) == pdTRUE)
    {
        acqwrite_index_in = (acqwrite_index_in + length) % ACQWRITE_BUFFER_LEN;
    }
    else
    {
        ESP_LOGE(TAG, "Mutex lock timed out in acqWrite()");
        return false;
    }
    xSemaphoreGive(acq_file_mutex);
    return true;
}

void sdAcqWriteTask(void *pvParameter)
{
    while(1)
    {
       int ret = xSemaphoreTake(acq_file_mutex, (TickType_t) 200);
        if(ret != pdTRUE)
        {
            ESP_LOGI(TAG, "Mutex lock timed out in sdTask");
            assert(0);
        }
        int in = acqwrite_index_in;
        xSemaphoreGive(acq_file_mutex);

        int backlog = in - acqwrite_index_out;

        if(acqfile)
        {
            if(backlog)
            {
                char *write_start = acqwrite_buffer + acqwrite_index_out;
//                ESP_LOGI(TAG, "backlog: %d acqwrite_index_in: %d, acqwrite_index_out %d", backlog, acqwrite_index_in, acqwrite_index_out);
                if(backlog > 0)
                {
                    //ESP_LOGI(TAG, "backlog: %12d buffer: %12x, acqwrite_index_out %12d", backlog, (uint32_t) (write_start), acqwrite_index_out);
                    BsetExpander(LED_WRITE,1);
                    fwrite(write_start, 1, backlog, acqfile);
                    BsetExpander(LED_WRITE,0);
                }
                else // write buffer wrapped around
                {
                    int write_bytes_to_end = ACQWRITE_BUFFER_LEN - acqwrite_index_out;
                    //ESP_LOGI(TAG, "BUFLEN: %d, acqwrite_index_out: %d, write_bytes_to_end: %d", ACQWRITE_BUFFER_LEN, acqwrite_index_out, write_bytes_to_end);
                    // write bytes from current buffer out index through end of buffer
//                    ESP_LOGI(TAG, "backlog: %12d buffer: %12x, acqwrite_index_out %12d, write_bytes_to_end %12d", backlog, (uint32_t) (write_start), acqwrite_index_out, write_bytes_to_end);
                    BsetExpander(LED_WRITE,1);
                    fwrite(write_start, 1, write_bytes_to_end, acqfile);
                    BsetExpander(LED_WRITE,0);
                    // write remaining bytes from beginning of buffer
                    backlog += ACQWRITE_BUFFER_LEN;
//                    ESP_LOGI(TAG, "backlog: %12d buffer: %12x, acqwrite_index_out %12d, write_bytes_to_end %12d", backlog, (uint32_t) (acqwrite_buffer), acqwrite_index_out, write_bytes_to_end);
                    BsetExpander(LED_WRITE,1);
                    fwrite(acqwrite_buffer, 1, backlog - write_bytes_to_end, acqfile);
                    BsetExpander(LED_WRITE,0);
                }
                acqwrite_index_out = acqwrite_index_in;
            }
            if(close_acq_file)
            {
                ESP_LOGI(TAG, "closing acq file");
                int ret = xSemaphoreTake(acq_file_mutex, (TickType_t) 2);
                if(ret != pdTRUE)
                {
                    ESP_LOGI(TAG, "Mutex lock timed out closing file in sdTask");
                    assert(0);
                }
                ESP_LOGI(TAG, "Closing file");
                fclose(acqfile);
                BsetExpander(LED_FILE_OPEN,0);
                acqfile = 0;
                acqwrite_index_in = 0;
                acqwrite_index_out = 0;
                close_acq_file = false;
                xSemaphoreGive(acq_file_mutex);
            }
        }
        vTaskDelay(1);
    }
}


int MountSD()
{
    if(!sd_mounted)
    {
        ESP_LOGI(TAG, "Initializing SD card using SPI");

        sdmmc_host_t host = SDSPI_HOST_DEFAULT();
        sdspi_slot_config_t slot_config = SDSPI_SLOT_CONFIG_DEFAULT();
        slot_config.gpio_miso = PIN_NUM_MISO;
        slot_config.gpio_mosi = PIN_NUM_MOSI;
        slot_config.gpio_sck  = PIN_NUM_CLK;
        slot_config.gpio_cs   = PIN_NUM_CS;
        // initialize the slot without card detect (CD) and write protect (WP) signals.

        esp_vfs_fat_sdmmc_mount_config_t mount_config = {
            .format_if_mount_failed = false,
            .max_files = 5,
            .allocation_unit_size = 16 * 1024
        };

        sdmmc_card_t* card;
        esp_err_t ret = esp_vfs_fat_sdmmc_mount(SD_PREFIX, &host, &slot_config, &mount_config, &card);

        if (ret == ESP_OK)
        {
            sd_mounted = true;
            sdmmc_card_print_info(stdout, card);
            BsetExpander(LED_SD_UNMOUNTED,0);
            return (true);
        }
        else
        {
            if (ret == ESP_FAIL) {
                ESP_LOGE(TAG, "Failed to mount filesystem");
            } else {
                ESP_LOGE(TAG, "Failed to initialize SD card (%d)", ret);
            }
            sd_mounted = false;
            return(false);
        }
    }
    else
    {
        return true;
    }
}

int UnmountSD()
{
    if(sd_mounted)
    {
        ESP_LOGI(TAG, "Unmounting SD card");
        esp_vfs_fat_sdmmc_unmount();
        sd_mounted = false;
        ESP_LOGI(TAG, "SD card unmounted");
        BsetExpander(LED_SD_UNMOUNTED,1);
    }
    return true;
}


int OpenNextAcqFile(void)
{
    char path[64] = "/sdcard/data/data000.csv";
    char temp[4] = "";
    struct stat st;
    int i;

    if(MountSD())
    {
        int ret = xSemaphoreTake(acq_file_mutex, (TickType_t) 2);
        if(ret != pdTRUE)
        {
            ESP_LOGI(TAG, "Mutex lock timed out in openNextAcqFile");
            return ret;
        }

        if(close_acq_file)
        {
            vTaskDelay(1);
            if(close_acq_file)
            {
                ESP_LOGE(TAG, "acq file still open in OpenNextAcqFile");
                xSemaphoreGive(acq_file_mutex);
               return false;
            }
        }
        xSemaphoreGive(acq_file_mutex);

        if(stat("/sdcard/data", &st) == 0)
        {
            if(!S_ISDIR(st.st_mode))
            {
                ESP_LOGE(TAG, "/sdcard/data is not a directory");
                return false;
            }
        }
        else
        {
            if(mkdir("/sdcard/data", 0777) != 0)
            {
                ESP_LOGE(TAG, "/sdcard/data could not be created");
                return false;
            }
        }

        for(i = 0; i < 1000; i++)
        {
            int pathlen = strlen(path);
            snprintf(temp, 4, "%03d", i);
            ESP_LOGV(TAG, "Filename index: %s", temp);
            path[pathlen - 7] = temp[0];
            path[pathlen - 6] = temp[1];
            path[pathlen - 5] = temp[2];
            ESP_LOGV(TAG, "Path: %s", path);
            if (stat(path, &st) != 0) // if file not found
            {
                acqfile = fopen(path, "w");
                if (!acqfile)
                {
                    ESP_LOGE(TAG, "Failed to open %s for writing", path);
                    return false;
                }
                ESP_LOGI(TAG, "file %s opened for writing", path);
                BsetExpander(LED_FILE_OPEN,1);
                break;
            }
        }
        return(true);
    }
    else
    {
        ESP_LOGE(TAG, "SD not mounted trying to open acq file");
        return(false);
    }
}

void CloseAcqFile(void)
{
    close_acq_file = true;
}

