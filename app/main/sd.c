/*
 * sd.c
 *
 *  Created on: Feb 27, 2018
 *      Author: osboxes
 */
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

static const char *TAG = "sd.c";

// Pin mapping when using SPI mode.

#define PIN_NUM_MISO 19
#define PIN_NUM_MOSI 23
#define PIN_NUM_CLK  18
#define PIN_NUM_CS   5

FILE *acqfile = 0;

int OpenNextAcqFile(void)
{
    ESP_LOGI(TAG, "Initializing SD card");
    ESP_LOGI(TAG, "Using SPI peripheral");

    sdmmc_host_t host = SDSPI_HOST_DEFAULT();
    sdspi_slot_config_t slot_config = SDSPI_SLOT_CONFIG_DEFAULT();
    slot_config.gpio_miso = PIN_NUM_MISO;
    slot_config.gpio_mosi = PIN_NUM_MOSI;
    slot_config.gpio_sck  = PIN_NUM_CLK;
    slot_config.gpio_cs   = PIN_NUM_CS;
    // This initializes the slot without card detect (CD) and write protect (WP) signals.
    // Modify slot_config.gpio_cd and slot_config.gpio_wp if your board has these signals.

    // Options for mounting the filesystem.
    // If format_if_mount_failed is set to true, SD card will be partitioned and
    // formatted in case when mounting fails.
    esp_vfs_fat_sdmmc_mount_config_t mount_config = {
        .format_if_mount_failed = false,
        .max_files = 5,
        .allocation_unit_size = 16 * 1024
    };

    // Use settings defined above to initialize SD card and mount FAT filesystem.
    // Note: esp_vfs_fat_sdmmc_mount is an all-in-one convenience function.
    // Please check its source code and implement error recovery when developing
    // production applications.
    sdmmc_card_t* card;
    esp_err_t ret = esp_vfs_fat_sdmmc_mount("/sdcard", &host, &slot_config, &mount_config, &card);

    if (ret != ESP_OK)
    {
        if (ret == ESP_FAIL) {
            ESP_LOGE(TAG, "Failed to mount filesystem");
        } else {
            ESP_LOGE(TAG, "Failed to initialize the card (%d)", ret);
        }
        return(false);
    }

    // Card has been initialized, print its properties
    sdmmc_card_print_info(stdout, card);


#define ACQ_FILE_DIGITS 3
    char path[64] = "/sdcard/DATA000.CSV";
    char temp[ACQ_FILE_DIGITS + 1] = "";
    struct stat st;
    int i;
    for(i = 0; i < 1000; i++)
    {
        snprintf(temp, ACQ_FILE_DIGITS + 1, "%03d", i);
        //ESP_LOGV(TAG, "Filename index: %s", temp);
        path[12] = temp[0];
        path[13] = temp[1];
        path[14] = temp[2];
        //ESP_LOGV(TAG, "Path: %s", path);
        if (stat(path, &st) != 0) // if file not found
        {
            ESP_LOGI(TAG, "Opening file");
            acqfile = fopen(path, "w");
            if (!acqfile)
            {
                ESP_LOGE(TAG, "Failed to open file for writing");
                esp_vfs_fat_sdmmc_unmount();
                ESP_LOGI(TAG, "Card unmounted");
                return(false);
            }
            ESP_LOGI(TAG, "file opened for writing");
            break;
        }
    }
    return(true);
}

void CloseAcqFile(void)
{
    //return;
    if(acqfile)
    {
        ESP_LOGI(TAG, "Closing file");
        fclose(acqfile);
        // All done, unmount partition and disable SDMMC or SPI peripheral
        ESP_LOGI(TAG, "Unmounting card");
        esp_vfs_fat_sdmmc_unmount();
        ESP_LOGI(TAG, "Card unmounted");
        acqfile = 0;
    }
}

