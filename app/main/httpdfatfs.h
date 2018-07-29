#ifndef HTTPDFATFS_H
#define HTTPDFATFS_H

#include <libesphttpd/esp.h>
#include "libesphttpd/httpd.h"

CgiStatus cgiFatFsHook(HttpdConnData *connData);
CgiStatus cgiFatFsDirHook(HttpdConnData *connData);
CgiStatus cgiFatFsDirJSONHook(HttpdConnData *connData);

#endif