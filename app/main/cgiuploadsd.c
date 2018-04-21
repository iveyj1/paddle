#include "cgi.h"
#include "cgiuploadsd.h"
#include "libesphttpd/httpd.h"
#include "esp_log.h"
#include <stdlib.h>

const char TAG[] = "cgiuploadsd.c";

#define min(x, y) ({                \
    typeof(x) _min1 = (x);          \
    typeof(y) _min2 = (y);          \
    (void) (&_min1 == &_min2);      \
    _min1 < _min2 ? _min1 : _min2; })
    
#define MAXPATH 128

CgiStatus ICACHE_FLASH_ATTR cgiUploadSdFile(HttpdConnData *connData)
{
    FILE *fs = (FILE *)connData->cgiData;
    char *root = (char*) connData->cgiArg;
    char path[MAXPATH] = "";
    char name[MAXPATH] = "";
    
    if (connData->isConnectionClosed) 
    {
        //Connection aborted. Clean up.
        if (fs)   // if open, close file and release memory here
            fclose(fs);
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
            httpdStartResponse(connData, 400);
            httpdHeader(connData, "Content-Type", "text/plain");
            httpdEndHeaders(connData); 
            return HTTPD_CGI_DONE;
        }
        int namelen = strlen(name);
        int rootlen = strlen(root);
        if(namelen+rootlen >= MAXPATH)
        {
            httpdStartResponse(connData, 400);
            httpdHeader(connData, "Content-Type", "text/plain");
            httpdEndHeaders(connData); 
            return HTTPD_CGI_DONE;
        }
        memcpy(path, root, rootlen);
        memcpy(path + rootlen, name, namelen);
        path[rootlen + namelen] = 0;
        ESP_LOGI(TAG, "root: %s name: %s path:%s", root, name, path);
        fs = fopen(path, "w");
        if (!fs) 
        { 
            httpdStartResponse(connData, 404);
            httpdHeader(connData, "Content-Type", "text/plain");
            httpdEndHeaders(connData); 
            return HTTPD_CGI_DONE;
        }
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
