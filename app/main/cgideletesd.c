#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/semphr.h"

#include "cgi.h"
#include "cgideletesd.h"
#include "libesphttpd/httpd.h"
#include "esp_log.h"
#include <stdlib.h>
#include <unistd.h>

#include "sd.h"
#include <sys/stat.h>


static const char TAG[] = "cgideletesd.c";
   
#define MAXPATH 512

extern int str_append(char *buff, size_t buffsize, const char *in);


CgiStatus ICACHE_FLASH_ATTR cgiDeleteSdFile(HttpdConnData *connData) {
    char buff[MAXPATH];
    char path[MAXPATH];
    ESP_LOGD(TAG, "In cgiDeleteSdFile");
    ESP_LOGD(TAG, "Max stack: %d", uxTaskGetStackHighWaterMark(NULL));

    if (connData->isConnectionClosed) 
    {
        //Connection aborted. Clean up.
        ESP_LOGE(TAG, "connection aborted");
        return HTTPD_CGI_DONE;
    }

    path[0] = 0;
    str_append(path, sizeof(path), SD_PREFIX);
    int len = httpdFindArg(connData->getArgs, "path", buff, sizeof(buff));
    //ESP_LOGI(TAG, "connData->getArgs %s, buff: %s, len: %d", connData->getArgs, buff, len);
    str_append(path, sizeof(path), buff);
    ESP_LOGD(TAG, "delete %s, length: %d", path, strlen(path));
    
    httpdStartResponse(connData, 200);
    httpdHeader(connData, "Content-Type", httpdGetMimetype(connData->url));
    httpdHeader(connData, "Cache-Control", "no-cache, no-store, must-revalidate");
    httpdHeader(connData, "Pragma", "no-cache");
    httpdHeader(connData, "Expires", "0");    
    httpdEndHeaders(connData);

    struct stat     statbuf;
    if (stat(path, &statbuf) != -1 && S_ISREG(statbuf.st_mode))
    {
        if(unlink(path) == 0)
        {
            ESP_LOGI(TAG, "%s deleted", path);
            return HTTPD_CGI_DONE;
        }
    }
    ESP_LOGI("TAG", "Couldn't delete %s", path);
    return HTTPD_CGI_NOTFOUND;
}
