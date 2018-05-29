#include <stdio.h>
#include <errno.h>
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

        
#include <time.h>
#define MAXPATH 256

#define P_PATHBUFSIZE 256
#include "sd.h"

// Note: opendir() wants _no_ slash at the end of the path

static const char *TAG = "httpdfatfs";

int str_append(char *buff, size_t buffsize, const char *in)
{
    int buff_str_len = strnlen(buff, buffsize);
    int in_str_len = strlen(in);
    if((buff_str_len + in_str_len + 1) > buffsize) 
    {
        return -1;
    }
    memcpy(buff + buff_str_len, in, in_str_len);
    buff[buff_str_len + in_str_len] = '\0';
    return(buff_str_len + in_str_len);
}

CgiStatus ICACHE_FLASH_ATTR cgiFatFsDirJSONHook(HttpdConnData *connData) {
    DIR *dp = connData->cgiData;
    struct dirent *ep;
    char buff[512];
    char path[P_PATHBUFSIZE];
    //int needSlash;
    ESP_LOGI(TAG, "In cgiFatFsDirJSONHook");
    ESP_LOGV(TAG, "Max stack: %d", uxTaskGetStackHighWaterMark(NULL));
    static char sep[4] = "";

    if (connData->isConnectionClosed) 
    {
        //Connection aborted. Clean up.
        ESP_LOGE(TAG, "connection aborted");
        if (dp) 
        {
            closedir(dp);
            connData->cgiData = NULL;
        }
        return HTTPD_CGI_DONE;
    }

    path[0] = 0;
    str_append(path, sizeof(path), SD_PREFIX);
    int len = httpdFindArg(connData->getArgs, "path", buff, sizeof(buff));
    ESP_LOGI(TAG, "connData->getArgs %s, buff: %s, len: %d", connData->getArgs, buff, len);
    str_append(path, sizeof(path), buff);
    int strlen_path = strlen(path);
    if (path[strlen_path-1]=='/') 
    {
        path[strlen_path -1] = '\0';         // need to check buffer length here
    }
    ESP_LOGI(TAG, "dirurl %s, length: %d", path, strlen(path));
    
    //First call to this cgi. Open the dir so we can read it.
    if (dp == NULL) 
    {     
        ESP_LOGI(TAG, "Opening directory %s", path);
        dp = opendir(path);
        if (!dp) 
        {
            int err = errno;
            ESP_LOGE(TAG, "error: %d %s", err, strerror(err));
            ESP_LOGI(TAG, "Can't open %s", path);
            return HTTPD_CGI_NOTFOUND;
        }

        connData->cgiData = dp;  // store directory info for next round
        httpdStartResponse(connData, 200);
        httpdHeader(connData, "Content-Type", httpdGetMimetype(connData->url));
        httpdHeader(connData, "Cache-Control", "max-age=3600, must-revalidate");
        httpdEndHeaders(connData);
        sprintf(buff, "{ \"path\":\"%s\",\n    \"entries\":[\n", connData->url);
        httpdSend(connData, buff, -1);
        sep[0] = 0;
        return HTTPD_CGI_MORE;
    }
    else
    {
        ep = readdir(dp);

        if (ep && ep->d_name[0] != 0)  // there is another directory entry
        {
            char filepath[MAXPATH] = "";
            str_append(filepath, sizeof(filepath), path);
            str_append(filepath, sizeof(filepath), "/");
            str_append(filepath, sizeof(filepath), ep->d_name);   
            ESP_LOGI(TAG, "reading dir entry path: %s name: %s filepath: %s", path, ep->d_name, filepath);
            
            struct stat     statbuf;
            struct tm      *tm;
            char            datestring[256];   
            if (stat(filepath, &statbuf) != -1)
            {
                ESP_LOGI(TAG, "Size: %9jd", (intmax_t)statbuf.st_size);
                tm = localtime(&statbuf.st_mtime);
                ESP_LOGI(TAG, "strftime returns: %d", strftime(datestring, sizeof(datestring), "%Y-%m-%d_%H:%M:%S", tm));
                ESP_LOGI(TAG, "date: %s\n", datestring);
                int namelen = strlen(ep->d_name);
                ESP_LOGI(TAG, "namelen: %d dname:%s", namelen, ep->d_name);
                char entrytype[10] = "";
                if(S_ISREG(statbuf.st_mode))
                {
                    str_append(entrytype, 10, "file");
                }
                else if(S_ISDIR(statbuf.st_mode))
                {
                    str_append(entrytype, 10, "dir");
                }
                
                sprintf(buff, "%s        {\"name\":\"%s\", \"type\":\"%s\", \"size\":\"%lld\", \"date\":\"%s\"}", sep, ep->d_name, entrytype, (intmax_t)statbuf.st_size, datestring);  
                ESP_LOGI(TAG, "url:%s", buff);
                httpdSend(connData, buff, -1);
                sep[0] = '\0';
                str_append(sep, 5, ",\n");
            }
            else
            {
                ESP_LOGI("TAG", "skipping %s", filepath);
            }
            return HTTPD_CGI_MORE;
        } else {
            closedir(dp);
            sprintf(buff, "\n    ]\n}");
            httpdSend(connData, buff, -1);
        }
    }
    return HTTPD_CGI_DONE;
}


CgiStatus ICACHE_FLASH_ATTR cgiFatFsDirHook(HttpdConnData *connData) {
    DIR *dp = connData->cgiData;
    struct dirent *ep;
    char buff[512];
    char path[P_PATHBUFSIZE];
    int needSlash;
    ESP_LOGV(TAG, "In cgiFatFsDirHook");
    ESP_LOGV(TAG, "Max stack: %d", uxTaskGetStackHighWaterMark(NULL));

    if (connData->isConnectionClosed) 
    {
        //Connection aborted. Clean up.
        ESP_LOGE(TAG, "connection aborted");
        if (dp) 
        {
            closedir(dp);
            connData->cgiData = NULL;
        }
        return HTTPD_CGI_DONE;
    }

    if (connData->url[strlen(connData->url)-1]=='/') needSlash=0; else needSlash=1;

    path[0] = 0;
    str_append(path, sizeof(path), SD_PREFIX);
    str_append(path, sizeof(path), connData->url);  
    
    //First call to this cgi. Open the dir so we can read it.
    if (dp == NULL) 
    {     
        ESP_LOGI(TAG, "Opening directory %s", path);
        dp = opendir(path);
        if (!dp) 
        {
            ESP_LOGI(TAG, "Can't open %s", path);
            return HTTPD_CGI_NOTFOUND;
        }

        connData->cgiData = dp;  // store directory info for next round
        httpdStartResponse(connData, 200);
        httpdHeader(connData, "Content-Type", httpdGetMimetype(connData->url));
        httpdHeader(connData, "Cache-Control", "max-age=3600, must-revalidate");
        httpdEndHeaders(connData);
        sprintf(buff, "<html><head><title>Index of %s</title><link rel=\"stylesheet\" type=\"text/css\" href=\"/html/style.css\"></head><body><h2>Index of %s</h2>\n", connData->url, connData->url);
        httpdSend(connData, buff, -1);
        sprintf(buff, "<table> <tr> <th>Filename</th> <th>Size</th> <th>Date</th></tr>\n");
        httpdSend(connData, buff, -1);
        return HTTPD_CGI_MORE;
    }
    else
    {
        ep = readdir(dp);

        if (ep && ep->d_name[0] != 0)  // there is another directory entry
        {
            char filepath[MAXPATH] = "";
            str_append(filepath, sizeof(filepath), path);
            str_append(filepath, sizeof(filepath), "/");
            str_append(filepath, sizeof(filepath), ep->d_name);   
            
            ESP_LOGI(TAG, "reading dir entry path: %s name: %s filepath: %s", path, ep->d_name, filepath);
            
            struct stat     statbuf;
            struct tm      *tm;
            char            datestring[256];         
            if (stat(filepath, &statbuf) != -1)
            {
                ESP_LOGI(TAG, "Size: %9jd", (intmax_t)statbuf.st_size);
                tm = localtime(&statbuf.st_mtime);
                ESP_LOGI(TAG, "strftime returns: %d", strftime(datestring, sizeof(datestring), "%Y-%m-%d_%H:%M:%S", tm));
                ESP_LOGI(TAG, "date: %s\n", datestring);
                int namelen = strlen(ep->d_name);
                ESP_LOGI(TAG, "namelen: %d dname:%s", namelen, ep->d_name);
                ESP_LOGI(TAG, "csv:%s", ep->d_name + namelen - 4);
                if(strcasecmp(ep->d_name + namelen - 4, ".csv") == 0) // plot .csv files
                {
                    sprintf(buff, "<tr><td><a href=\"/html/plot.html?url=%s%s%s\">%s</a></td><td>%lld</td><td>%s</td></tr>\n", connData->url, needSlash?"/":"", ep->d_name, ep->d_name, (intmax_t)statbuf.st_size, datestring);
                }
                else // just link to everything else
                {
                    sprintf(buff, "<tr><td><a href=\"%s%s%s\">%s</a></td><td>%lld</td><td>%s</td></tr>\n", connData->url, needSlash?"/":"", ep->d_name, ep->d_name, (intmax_t)statbuf.st_size, datestring);  
                } 
                ESP_LOGI(TAG, "url:%s", buff);
                httpdSend(connData, buff, -1);
            }
            else
            {
                ESP_LOGI("TAG", "skipping %s", filepath);
            }
            return HTTPD_CGI_MORE;
        } else {
            closedir(dp);
            sprintf(buff, "</table></body></html>");
            httpdSend(connData, buff, -1);
        }
    }
    return HTTPD_CGI_DONE;
}

CgiStatus ICACHE_FLASH_ATTR cgiFatFsHook(HttpdConnData *connData) 
{
    FILE *fp = connData->cgiData;
    char buff[512];
    char path[P_PATHBUFSIZE];
    size_t ret;

    if (connData->isConnectionClosed) 
    {
        ESP_LOGE(TAG, "connection aborted");
        if (fp != NULL) {
            fclose(fp);
        }
        return HTTPD_CGI_DONE;
    }

    if (connData->cgiData == NULL) 
    {
        int prefixlen = strlen(SD_PREFIX);
        int urllen = strlen(connData->url);
        if((prefixlen + urllen + 1) > P_PATHBUFSIZE) 
        {
            ESP_LOGE(TAG, "file not found");
            return HTTPD_CGI_NOTFOUND;
        }
        memcpy(path, SD_PREFIX, prefixlen);
        memcpy(path + prefixlen, connData->url, urllen);
        path[prefixlen + urllen] = '\0';

        ESP_LOGI(TAG, "opening %s,", path);
        fp = fopen(path, "r");
        if (!fp) 
        {
            ESP_LOGE(TAG, "Can't open %s", path);
            return HTTPD_CGI_NOTFOUND;
        } 
        connData->cgiData = fp;  // store directory info for next round
        httpdStartResponse(connData, 200);
        httpdHeader(connData, "Content-Type", httpdGetMimetype(connData->url));
        httpdHeader(connData, "Cache-Control", "no-store");
        httpdEndHeaders(connData);
        return HTTPD_CGI_MORE;
    }
    else 
    {
        ret = fread(buff, 1, sizeof(buff), fp);
        if(ret)
        {
            httpdSend(connData, buff, ret);
        }

        if(ret == sizeof(buff))
        {
            return HTTPD_CGI_MORE;
        } 
        else 
        {
            if (fp) 
            {
                fclose(fp);
            } 
            return HTTPD_CGI_DONE;
        }
    }
    return HTTPD_CGI_DONE;
}

