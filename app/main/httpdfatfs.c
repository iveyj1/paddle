/*
Connector to let httpd use the fat filesystem on eg an SD-card to serve the files in it.
*/

/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * Jeroen Domburg <jeroen@spritesmods.com> wrote this file. As long as you retain 
 * this notice you can do whatever you want with this stuff. If we meet some day, 
 * and you think this stuff is worth it, you can buy me a beer in return. 
 * ----------------------------------------------------------------------------
 */



#include <stdio.h>
#include <string.h>
#include <sys/unistd.h>
#include <sys/stat.h>
#include "esp_err.h"
#include "esp_log.h"
#include "esp_vfs_fat.h"
#include "driver/sdmmc_host.h"

#include "httpdfatfs.h"
#include "esp_err.h"
#include "esp_log.h"

#include <sys/types.h>
#include <dirent.h>
#include <string.h>

#define P_PATHBUFSIZE 256
#include "sd.h"

static const char *TAG = "httpdfatfs";

//static const char *sd_prefix = "/sdcard";

CgiStatus ICACHE_FLASH_ATTR cgiFatFsDirHook(HttpdConnData *connData) {
    DIR *dp = connData->cgiData;
    struct dirent *ep;
    char buff[512];
    char path[P_PATHBUFSIZE];
    int needSlash;
    ESP_LOGI(TAG, "In cgiFatFsDirHook");
    ESP_LOGI(TAG, "Max stack: %d", uxTaskGetStackHighWaterMark(NULL));

    if (connData->isConnectionClosed) {
        //Connection aborted. Clean up.
        ESP_LOGE(TAG, "connection aborted")

        if (dp != NULL) {
            closedir(dp);
            free(dp);
        }
        return HTTPD_CGI_DONE;
    }

    if (connData->url[strlen(connData->url)-1]=='/') needSlash=0; else needSlash=1;
    
    if (dp == NULL) {
        //First call to this cgi. Open the dir so we can read it.
        int prefixlen = strlen(SD_PREFIX);
        ESP_LOGI(TAG, "SD_PREFIX: %s, length: %d", SD_PREFIX, prefixlen);
        int urllen = strlen(connData->url);
        ESP_LOGI(TAG, "url: %s urllen:%d", connData->url, urllen);
        if((prefixlen + urllen + 1) > P_PATHBUFSIZE) return HTTPD_CGI_NOTFOUND;
        memcpy(path, SD_PREFIX, prefixlen);
        memcpy(path + prefixlen, connData->url, urllen);
        path[prefixlen + urllen] = '\0';
        ESP_LOGI(TAG, "opening %s, buffer used %d", path, prefixlen + urllen + 1);
        
        dp = opendir(path);
        if (!dp) {
            ESP_LOGI(TAG, "Can't open %s", connData->url);
            return HTTPD_CGI_NOTFOUND;
        } 
        connData->cgiData = dp;  // store directory info for next round
        httpdStartResponse(connData, 200);
        httpdHeader(connData, "Content-Type", httpdGetMimetype(connData->url));
        httpdHeader(connData, "Cache-Control", "max-age=3600, must-revalidate");
        httpdEndHeaders(connData);
        sprintf(buff, "<html><head><title>Index of %s</title></head><body><h2>Index of %s</h2><ul>\n", connData->url, connData->url);
        httpdSend(connData, buff, -1);
        return HTTPD_CGI_MORE;
    }
    else
    {
        ep = readdir(dp);
        if (ep && ep->d_name[0] != 0) {
            sprintf(buff, "<li><a href=\"%s%s%s\">%s</a></li>\n", connData->url, needSlash?"/":"", ep->d_name, ep->d_name);
            //sprintf(buff, "next\n");
            httpdSend(connData, buff, -1);
            
            //Ok, till next time.
            return HTTPD_CGI_MORE;
            } else {
            //We're done.
            closedir(dp);
            sprintf(buff, "</ul></body></html>");
            httpdSend(connData, buff, -1);
        }
    }
    return HTTPD_CGI_DONE;
}

//This is a catch-all cgi function. It takes the url passed to it, looks up the corresponding
//path in the filesystem and if it exists, passes the file through. This simulates what a normal
//webserver would do with static files.
CgiStatus ICACHE_FLASH_ATTR cgiFatFsHook(HttpdConnData *connData) {
    FILE *fp = connData->cgiData;
    unsigned int len;
    char path[P_PATHBUFSIZE];
    char buff[1024*2];
    size_t fr;
    
    ESP_LOGI(TAG, "In cgiFatFsHook");
    ESP_LOGI(TAG, "Max stack: %d", uxTaskGetStackHighWaterMark(NULL));

    if (connData->isConnectionClosed) {
        //Connection aborted. Clean up.
        if (fp != NULL) {
            fclose(fp);
            //free(fp);
        }
        return HTTPD_CGI_DONE;
    }

    if (fp == NULL) {
        //First call to this cgi. Open the file so we can read it.

        int prefixlen = strlen(SD_PREFIX);
        ESP_LOGI(TAG, "SD_PREFIX: %s, length: %d", SD_PREFIX, prefixlen);
        int urllen = strlen(connData->url);
        ESP_LOGI(TAG, "url: %s urllen:%d", connData->url, urllen);
        if((prefixlen + urllen + 1) > P_PATHBUFSIZE) return HTTPD_CGI_NOTFOUND;
        gpio_set_level(13,0);
        memcpy(path, SD_PREFIX, prefixlen);
        memcpy(path + prefixlen, connData->url, urllen);
        gpio_set_level(13,0);
        path[prefixlen + urllen] = '\0';
        ESP_LOGI(TAG, "opening %s, buffer used %d", path, prefixlen + urllen + 1);
        
        ESP_LOGI(TAG, "Max stack before fopen: %d", uxTaskGetStackHighWaterMark(NULL));
        fp = fopen(path, "r");
        ESP_LOGI(TAG, "Max stack after fopen: %d", uxTaskGetStackHighWaterMark(NULL));
        if (!fp) {
            return HTTPD_CGI_NOTFOUND;
        }
        connData->cgiData=fp;
        httpdStartResponse(connData, 200);
        httpdHeader(connData, "Content-Type", httpdGetMimetype(connData->url));
        ESP_LOGI(TAG, "Content-Type: %s", httpdGetMimetype(connData->url));
//      httpdHeader(connData, "Cache-Control", "max-age=3600, must-revalidate");
        httpdEndHeaders(connData);
        return HTTPD_CGI_MORE;
    }

    len = fread(buff, 1, sizeof(buff), fp);
    ESP_LOGI(TAG, "Read %d bytes for %s\n", len, connData->url);
    buff[1024*2 - 1] = 0; 
    ESP_LOGI(TAG, "buffer: %s\n", buff);

    if (len > 0) httpdSend(connData, (char *)buff, len);
    if (len != sizeof(buff)) {
        //We're done.
        ESP_LOGI(TAG, "Finished file read");
        fclose(fp);
        //free(fp);
        return HTTPD_CGI_DONE;
    } else {
        //Ok, till next time.
        ESP_LOGI(TAG, "Next chunk");
        return HTTPD_CGI_MORE;
    }
}
 
