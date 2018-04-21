#include "cgi.h"
#include "cgiuploadsd.h"
#include "libesphttpd/httpd.h"
#include "esp_log.h"
#include <stdlib.h>
//#include <unistd.h> access() appears not to be implemented for ESP32 attm

const char TAG[] = "cgiuploadsd.c";

#define min(x, y) ({                \
    typeof(x) _min1 = (x);          \
    typeof(y) _min2 = (y);          \
    (void) (&_min1 == &_min2);      \
    _min1 < _min2 ? _min1 : _min2; })
    
#define MAXPATH 128

FILE *openWithBackup(const char *path)
{
    int done = false;
    int i;
    char backup_path[MAXPATH] = "";
    FILE *fptemp;
    if(strlen(path) < MAXPATH - 4)
    {
        for(i = 0; i < 1000 && !done; i++)
        {
            snprintf(backup_path, MAXPATH, "%s.%03d", path, i);
            if((fptemp = fopen(backup_path, "r")))
            {
                fclose(fptemp);
            }
            else
            {
                done = true;
                break;
            }
        }
        ESP_LOGI(TAG, "backup path:%s", backup_path);
        if(done) 
        {
            rename(path, backup_path);
        }
        else
        {
            ESP_LOGE(TAG, "Couldn't make backup - overwriting");
        }
    }
    return fopen(path, "w");
}

CgiStatus ICACHE_FLASH_ATTR cgiUploadSdFile(HttpdConnData *connData)
{
    FILE *fs = (FILE *)connData->cgiData;
    char *root = (char*) connData->cgiArg;
    char path[MAXPATH] = "";
    char name[MAXPATH] = "";
    if (connData->isConnectionClosed) 
    {
        //Connection aborted. Clean up.
        if (fs)   
        {
            fclose(fs);
        }
        return HTTPD_CGI_DONE;
    }
    if (!fs) // first time through 
    {
        if(httpdGetHeader(connData, "X-FileName", name, sizeof(name)))
        {
            ESP_LOGI(TAG, "X-FileName: %s", name);
        }
        else
        {
            return HTTPD_CGI_NOTFOUND;
        }
        int namelen = strlen(name);
        int rootlen = strlen(root);
        
        if(namelen+rootlen >= MAXPATH) 
        {
            return HTTPD_CGI_NOTFOUND;
        }
        
        memcpy(path, root, rootlen);
        memcpy(path + rootlen, name, namelen);
        path[rootlen + namelen] = 0;
    }
    
    fs = openWithBackup(path);
    
    if (!fs) 
    {
        return HTTPD_CGI_NOTFOUND;
    }
    ESP_LOGI(TAG, "post.len %d, post.received %d\n", connData->post.len, connData->post.received);
    if(fwrite(connData->post.buff, 1, connData->post.buffLen, fs) < connData->post.buffLen)
    {
        ESP_LOGE(TAG, "error writing file %s", name);
        httpdStartResponse(connData, 404);
        httpdHeader(connData, "Content-Type", "text/plain");
        httpdEndHeaders(connData); 
        return HTTPD_CGI_DONE;
    }
    if (connData->post.len == connData->post.received) {
        //We're done! Format a response.
        httpdStartResponse(connData, 200);
        httpdHeader(connData, "Content-Type", "text/plain");
        httpdEndHeaders(connData); // Getting an extra 0x0a in the body at the other end - why?
        ESP_LOGI(TAG, "Closing file");
        fclose(fs);
        fs = 0;
        return HTTPD_CGI_DONE;
    }
    connData->cgiData = (void *)fs;
    return HTTPD_CGI_MORE;
}
