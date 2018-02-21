/* Hello World Example

 This example code is in the Public Domain (or CC0 licensed, at your option.)

 Unless required by applicable law or agreed to in writing, this
 software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 CONDITIONS OF ANY KIND, either express or implied.
 */
#include <stdio.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "freertos/event_groups.h"
#include "esp_system.h"
#include "esp_wifi.h"
#include "esp_event_loop.h"
#include "esp_log.h"
#include "nvs_flash.h"
#include "driver/ledc.h"
#include "lwip/err.h"
#include "lwip/sockets.h"

/* FreeRTOS event group to signal when we are connected & ready to make a request */
static EventGroupHandle_t wifi_event_group;

/* The event group allows multiple bits for each event,
 but we only care about one event - are we connected
 to the AP with an IP? */
static const int CONNECTED_BIT = BIT0;

static const char *TAG = "example";


/* The examples use simple WiFi configuration that you can set via
 'make menuconfig'.

 If you'd rather not, just change the below entries to strings with
 the config you want - ie #define EXAMPLE_WIFI_SSID "mywifissid"
 */
#define EXAMPLE_WIFI_SSID "Cold Comfort Farm"
#define EXAMPLE_WIFI_PASS "widephoenix967"

static esp_err_t event_handler(void *ctx, system_event_t *event) {
   switch (event->event_id) {
   case SYSTEM_EVENT_STA_START:
      esp_wifi_connect();
      break;
   case SYSTEM_EVENT_STA_GOT_IP:
      xEventGroupSetBits(wifi_event_group, CONNECTED_BIT);
      break;
   case SYSTEM_EVENT_STA_DISCONNECTED:
      /* This is a workaround as ESP32 WiFi libs don't currently
       auto-reassociate. */
      esp_wifi_connect();
      xEventGroupClearBits(wifi_event_group, CONNECTED_BIT);
      break;
   default:
      break;
   }
   return ESP_OK;
}

static void initialise_wifi(void) {
   tcpip_adapter_init();
   wifi_event_group = xEventGroupCreate();
   ESP_ERROR_CHECK(esp_event_loop_init(event_handler, NULL));
   wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT()
   ;
   ESP_ERROR_CHECK(esp_wifi_init(&cfg));
   ESP_ERROR_CHECK(esp_wifi_set_storage(WIFI_STORAGE_RAM));
   wifi_config_t wifi_config = { .sta = { .ssid = EXAMPLE_WIFI_SSID,
         .password = EXAMPLE_WIFI_PASS, }, };
   ESP_LOGI(TAG, "Setting WiFi configuration SSID %s...", wifi_config.sta.ssid);
   ESP_ERROR_CHECK(esp_wifi_set_mode(WIFI_MODE_STA));
   ESP_ERROR_CHECK(esp_wifi_set_config(WIFI_IF_STA, &wifi_config));
   ESP_ERROR_CHECK(esp_wifi_start());
}

const static char http_html_hdr[] =
      "HTTP/1.1 200 OK\r\nContent-type: text/html\r\n\r\n";
const static char http_index_html[] =
      "<html><head><title>Congrats!</title></head><body><h1>Welcome to our lwIP HTTP server!</h1><p>This is a small test page, served by httpserver-netconn.</body></html>";

static void http_server_thread() {
   xEventGroupWaitBits(wifi_event_group, CONNECTED_BIT,
   false, true, portMAX_DELAY);
   int sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
   printf("New sock = %d\n", sock);

   struct sockaddr_in serverAddress;
   serverAddress.sin_family = AF_INET;
   serverAddress.sin_addr.s_addr = htonl(INADDR_ANY);
   serverAddress.sin_port = htons(80);
   int rc = bind(sock, (struct sockaddr * ) &serverAddress,
         sizeof(serverAddress));

   printf("bind completed! %d\n", rc);

   rc = listen(sock, 10);
   printf("listen completed! %d\n", rc);


   struct sockaddr_in clientAddress;
   socklen_t clientAddressLength = sizeof(clientAddress);
   int newsockfd, n;
   char buffer[1024];
   int total = 0;
   while (1) {
      printf("Waiting connection accept\n");
      newsockfd = accept(sock, (struct sockaddr * ) &clientAddress, &clientAddressLength);
      printf("Accepted a client connection\n");
      if (newsockfd < 0)
         printf("ERROR on accept\n");

      bzero(buffer, 1024);
      printf("About to read\n");
      total = 0;
      while((n = read(newsockfd, buffer, 1024)) > 0)
      {
            total += n;
          //printf("I've read %8d %8d\n", n,total);
          //printf("Here is the message: %s\n", buffer);
          //n = write(newsockfd, http_html_hdr, sizeof(http_html_hdr));
            //if (n < 0)
                //printf("ERROR reading from socket\n");
      }
      printf("total: %d\n",total);
      vTaskDelay(1000 / portTICK_RATE_MS);
      close(newsockfd);
      printf("socket closed %d\n", newsockfd);
   }
}

void app_main() {
   nvs_flash_init();
   //system_init();
   initialise_wifi();
   xTaskCreate(&http_server_thread, "http_server_netconn_thread", 4096, NULL, 5, NULL);
}

#if 0
/* Hello World Example

   This example code is in the Public Domain (or CC0 licensed, at your option.)

   Unless required by applicable law or agreed to in writing, this
   software is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
   CONDITIONS OF ANY KIND, either express or implied.
*/
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_system.h"
#include "esp_spi_flash.h"


void app_main()
{
    printf("Hello world!\n");

    /* Print chip information */
    esp_chip_info_t chip_info;
    esp_chip_info(&chip_info);
    printf("This is ESP32 chip with %d CPU cores, WiFi%s%s, ",
            chip_info.cores,
            (chip_info.features & CHIP_FEATURE_BT) ? "/BT" : "",
            (chip_info.features & CHIP_FEATURE_BLE) ? "/BLE" : "");

    printf("silicon revision %d, ", chip_info.revision);

    printf("%dMB %s flash\n", spi_flash_get_chip_size() / (1024 * 1024),
            (chip_info.features & CHIP_FEATURE_EMB_FLASH) ? "embedded" : "external");

    for (int i = 10; i >= 0; i--) {
        printf("Restarting in %d seconds...\n", i);
        vTaskDelay(1000 / portTICK_PERIOD_MS);
    }
    printf("Restarting now.\n");
    fflush(stdout);
    esp_restart();
}
#endif
