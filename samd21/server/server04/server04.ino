#include "ESP8266.h"
#include <string.h>

//#define SSID        "NETGEAR12"
//#define PASSWORD    "widephoenix967"

#include <SPI.h>
#include <SD.h>

File root;

ESP8266 *wifi;

void setup(void)
{

  wifi = new ESP8266(Serial1, 115200);
  Serial.begin(9600);
  int i;
  for (i = 0; !Serial && i <= 100; i++)
    delay(100);

  Serial.println("");
  Serial.println("************************** reboot ********************************");  
  Serial.println("");
  
  if (wifi->restart()) {
    Serial.print("restart ok\r\n");
  } else {
    Serial.print("restart err\r\n");
  }

  Serial.print("FW Version:");
  Serial.println(wifi->getVersion().c_str());

  if (wifi->setOprToStationSoftAP()) {
    Serial.print("to station + softap ok\r\n");
  } else {
    Serial.print("to station + softap err\r\n");
  }

  /*
      if (wifi->joinAP(SSID, PASSWORD)) {
          Serial.print("Join AP success\r\n");
          Serial.print("IP: ");
          Serial.println(wifi->getLocalIP().c_str());
      } else {
          Serial.print("Join AP failure\r\n");
      }
  */
  if (wifi->enableMUX()) {
    Serial.print("multiple ok\r\n");
  } else {
    Serial.print("multiple err\r\n");
  }

  if (wifi->startTCPServer(8090)) {
    Serial.print("start tcp server ok\r\n");
  } else {
    Serial.print("start tcp server err\r\n");
  }

  if (wifi->setTCPServerTimeout(10)) {
    Serial.print("set tcp server timout 10 seconds\r\n");
  } else {
    Serial.print("set tcp server timout err\r\n");
  }

  SD.begin(4);
//  root = SD.open("/");
//  printDirectory(root, 0);
//  root.close();

  Serial.println("****");
  Serial.print("setup end\r\n");
  Serial.println((uint32_t)"****", HEX);
  Serial.println((uint32_t)(&i), HEX);
}

#define BUFLEN 1500

// http strings
const char http_ok_head[] = "HTTP/1.1 200 OK\r\nConnection: close\r\n\r\n";
const char http_get_resp[] = "GET";
const char http_404[] = "HTTP/1.1 404 client_error\r\n\r\n";
const char http_405[] = "HTTP/1.1 405 invalid_request\r\n\r\n";

// mostly dir entry html strings
const char style[] = "style=\"font-family:arial\"";
const char html_head[] = "<!DOCTYPE html>\r\n<html>\r\n<body style=\"font-family:'Courier New'\">\r\n<h1  style=\"font-family:'Arial'\">Directory listing</h1>\r\n";
const char test_par[] = "<p>This is a paragraph</p>";
const char table_head[] = "<table style=\"width:20%\">\r\n";
const char table_row_start[] = "<tr>\r\n";
const char table_row_end[] = "</tr>\r\n";

const char table_entry_start[] = "<td>\r\n";
const char table_entry_end[] = "</td>\r\n";

const char html_tail[] = "\r\n</body>\r\n</html>\r\n";

const char anchor_start1[] = "<a href=\"";
const char anchor_start2[] = "\">";
const char anchor_end[] = "</a>";

//#define sendwifi_str(a) wifi->send(mux_id, (uint8_t *)(a), strlen(a))
#define sendwifi(a) wifi->send(mux_id, (uint8_t *)(a), strlen((const char *)(a)))

int strntoupper(char *buf, uint32_t buflen) {
  int i;
  for (i = 0; (buf[i] != '\0') && (i < buflen); i++) {
    buf[i] = toupper(buf[i]);
  }
  return i;
}

void printn(const char *buf, uint32_t n) {
  uint32_t i;
  for (i = 0; i < n; i++) {
    Serial.print(buf[i]);
  }
}

void loop(void) {
  char buffer[BUFLEN];
  uint8_t mux_id;
  uint32_t res;
  char *token;
  File f1;
//  Serial.println(String("before recv: ")+String(millis()));
  uint32_t len = wifi->recv(&mux_id, (uint8_t *)buffer, sizeof(buffer), 1000);
//  Serial.println(String("after recv: ")+String(millis()));
//  if(len > 0) {
//    Serial.print("mux: ");
//    Serial.println(mux_id);
//    Serial.print("len: ");
//    Serial.println(len);
//    Serial.print("\r\nbuffer:\r\n");
//    printn(buffer, len);
//    Serial.print("\r\nend buffer\r\n");
//  }
  uint32_t readbytes;
  buffer[(len < BUFLEN ? len : BUFLEN - 1)] = 0;
  if (len > 0) {


    strntoupper(buffer, BUFLEN);
    token = strtok(buffer, " \r\n");
//    Serial.print("received: ");
//    Serial.print(token);
//    Serial.print(" ");
    if (strcmp(token, http_get_resp) == 0) {
      token = strtok(NULL, " \r\n");
//      Serial.println(token);
      f1 = SD.open(token);
      if (f1) {
//        Serial.print(token);
//        Serial.println(" exists");
        sendwifi(http_ok_head);
        if (f1.isDirectory()) {
          sendDirPage(wifi, mux_id, token);
          sendwifi(html_tail);
        } else {
//          Serial.println(String("sending ") + token);
          readbytes = f1.read(buffer, BUFLEN);
          while (readbytes > 0) {
            wifi->send(mux_id, (uint8_t*)buffer, readbytes);
            readbytes = f1.read(buffer, BUFLEN);
          }
        }
      } else {
        Serial.println("doesn't exist");
        sendwifi(http_404);
      }
      if (f1)
        f1.close();
    } else {
//      Serial.println("invalid request");
      sendwifi(http_405);
    }
    delay(50);
    wifi->releaseTCP(mux_id);
//    Serial.println("TCP released");
  }
}

void printDirectory(File dir, int numTabs) {
  Serial.println("in printDirectory");
  while (true) {
    File entry =  dir.openNextFile();
    if (! entry) {
      // no more files
      break;
    }
    for (uint8_t i = 0; i < numTabs; i++) {
      Serial.print('\t');
    }
    Serial.print(entry.name());
    if (entry.isDirectory()) {
      Serial.println("/");
      printDirectory(entry, numTabs + 1);
    } else {
      // files have sizes, directories do not
      Serial.print(" ");
      Serial.println(entry.size(), DEC);
    }
    entry.close();
  }
}

void sendDirPage(ESP8266 *wifi, uint8_t mux_id, const String &path) {
  File dir;
  dir = SD.open(path);
  char str[20];
  char buf[512];
  String s;

  s = html_head;
  s += table_head;
  dir.rewindDirectory();

  while (true) {
    File entry =  dir.openNextFile();
    if (! entry) {
      break;
    }
    if (entry.isDirectory()) {
      s += String(table_row_start);
      s += String(String(table_entry_start));
      s += String(anchor_start1);
      s += String(entry.name());
      s += String(anchor_start2);
      s += String(entry.name());
      s += String("/");
      s += String(anchor_end);
      s += String(table_entry_end);
      s += String(table_entry_start);
      s += String(table_entry_end);
    } else {
      s += String(table_row_start);
      s += String(table_entry_start);
      s += String(anchor_start1);
      s += String(entry.name());
      s += String(anchor_start2);
      s += String(entry.name());
      s += String(anchor_end);
      s += String(table_entry_end);
      s += String(table_entry_start);
      s += String(itoa(entry.size(), str, 10));
      s += String(table_entry_end);
    }
    if (entry)
      entry.close();
  }
  s += String(html_tail);
  if (dir) {
    dir.close();
  }
  if(s.length()>= BUFLEN) {
    const char a[] = "<P>Directory too long to display</P>\r\n\r\n";
    wifi->send(mux_id, (uint8_t *)(a), strlen(a));
  } else {
    s.toCharArray(buf, BUFLEN);
    wifi->send(mux_id, (uint8_t *)(buf), s.length());
  }
//  Serial.println("Leaving sendDirPage");
}

