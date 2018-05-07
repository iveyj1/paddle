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
#include "sd.h"

static const char *TAG = "sd";

// Pin mapping when using SPI mode.

#define PIN_NUM_MISO 19
#define PIN_NUM_MOSI 23
#define PIN_NUM_CLK  18
#define PIN_NUM_CS   5

FILE *acqfile = 0;
bool sd_mounted = false;

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
        ESP_LOGI(TAG, "Unmounting card");
        esp_vfs_fat_sdmmc_unmount();
        sd_mounted = false;
        ESP_LOGI(TAG, "Card unmounted");
    }
    return true;
}


//#define ACQ_FILE_DIGITS 3

int OpenNextAcqFile(void)
{
    char path[64] = "/sdcard/data/data000.csv";
    char temp[4] = "";
    struct stat st;
    int i;

    if(MountSD())
    {
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
                break;
            }
        }
        return(true);
    }
    else
    {
        ESP_LOGE(TAG, "SD not mounted trying to open acq file")
        return(false);
    }
}

void CloseAcqFile(void)
{
    if(acqfile)
    {
        ESP_LOGI(TAG, "Closing file");
        fclose(acqfile);
        acqfile = 0;
    }
}

