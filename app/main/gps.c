#include <stdio.h>
#include <string.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "driver/uart.h"
#include "esp_log.h"
#include "gps.h"
#include <time.h>
#include <sys/time.h>

static const char* TAG = "gps.c";
static const char* GPS_CMD_HOT_START = "$PMTK101*32\r\n";
static const char* GPS_CMD_RMS = "$PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29\r\n";
static const char* GPS_CMD_100MS = "$PMTK220,100*2F\r\n"; // 100ms position solutions
static const char* GPS_CMD_SBAS = "$PMTK313,1*2E\r\n"; // enable SBAS
static const char* GPS_CMD_FACTORY_RESET = "$PMTK104*37\r\n";

#define ECHO_TEST_TXD  (GPIO_NUM_17)
#define ECHO_TEST_RXD  (GPIO_NUM_16)
#define ECHO_TEST_RTS  (UART_PIN_NO_CHANGE)
#define ECHO_TEST_CTS  (UART_PIN_NO_CHANGE)

SemaphoreHandle_t nmea_buffer_mutex;
uint8_t *nmea_buffer[2] = {0, 0};
int nmea_buffer_num = 0;
int nmea_available = false;


int copyNthToken(char *dest, size_t destsize, const char *source, int column, char delim, int nchars)
{
    int delimcount = 0;
    int i,j;
    int srclen = strlen(source);
    //ESP_LOGI(TAG, "source: %s", source);
    for(i = 0; i < srclen && delimcount < column; i++)
    {
        if(source[i] == delim) delimcount++;
    }
    //ESP_LOGI(TAG, "source + i %s", source + i);
    for(j = 0; i < srclen && source[i] != delim && j < nchars && j < destsize-1; i++, j++)
    {
        dest[j] = source[i];
    }
    //ESP_LOGI(TAG, "source + i %s", source + i);
    //ESP_LOGI(TAG, "dest: %s", dest);
    dest[j] = 0;
    return j;
}



// Copy last complete fresh NMEA message to buffer
// if not peek, mark buffer stale, if peek, don't mark as stale
// if no fresh buffer, returns false and doesn't copy to buffer

int GetLastNMEAMessage(char* buffer, size_t bufsize, int peek)
{
    int ret = xSemaphoreTake(nmea_buffer_mutex, (TickType_t) 1);
    if(ret != pdTRUE)
    {
        ESP_LOGI(TAG, "Mutex lock timed out in GetLastNMEAMessage");
        return ret;
    }
    else
    {
        if(nmea_available)
        {
            strncpy(buffer, (char *)nmea_buffer[1 - nmea_buffer_num], bufsize);
            buffer[bufsize - 1] = 0;
            if(!peek)
            {
                nmea_available = false;
            }
            xSemaphoreGive(nmea_buffer_mutex);
            return true;
        }
        else
        {
            xSemaphoreGive(nmea_buffer_mutex);
            return false;
        }
    }
}

int atoin(char *string, size_t n)
{
    int retval;
    char temp;
    temp = string[n];
    string[n] = 0;
    retval = atoi(string);
    string[n] = temp;
    return retval;
}


int setSystemDateTime(char *datestr, char *timestr)
{
    struct tm tm_time;
    tm_time.tm_sec = atoin(timestr + 4, 2);
    tm_time.tm_min = atoin(timestr + 2, 2);
    tm_time.tm_hour = atoin(timestr, 2);
    tm_time.tm_mday = atoin(datestr, 2);
    tm_time.tm_mon = atoin(datestr + 2, 2) - 1;
    tm_time.tm_year = atoin(datestr + 4, 2);
    if(tm_time.tm_year <= 50) 
    {
        tm_time.tm_year += 100;
    }
    tm_time.tm_wday = 0;
    tm_time.tm_yday = 0;
    tm_time.tm_isdst = 0;

    time_t time = mktime(&tm_time);
    struct timeval tv = {time , 0};
    settimeofday(&tv, NULL);
    setenv("TZ", "UTC+00", 1);
    tzset();
    return true;
}


#define TIMESTRLEN 6
#define DATESTRLEN 6
static int timesetrtc = false;
static int timesetgps = false;

int setTime()
{
    char nmeabuf[128] = "";
    char timestr[16] = "";
    char datestr[16] = "";
    char activestr[2] = "";

    if(timesetgps)
    {
        return true;
    }
    
    if((GetLastNMEAMessage(nmeabuf, sizeof(nmeabuf), true)))
    {
        if(strncmp(nmeabuf, "$GPRMC", 6) == 0)
        {
            copyNthToken(timestr, sizeof(timestr), nmeabuf, 1, ',', 6);
            copyNthToken(datestr, sizeof(datestr), nmeabuf, 9, ',', 6);
            //ESP_LOGI(TAG, "Datestr: %s timestr: %s", datestr, timestr);
            copyNthToken(activestr, sizeof(activestr), nmeabuf, 2, ',', 1);
            if(activestr[0] == 'A')
            {
                if(!timesetgps)
                {
                    static int num_valid_gps_msgs = 0;
                    if(num_valid_gps_msgs >= 10)
                    {
                        setSystemDateTime(datestr, timestr);
                        timesetgps = true;
                        timesetrtc = true;
                        
                        char buffer[26] = "";
                        time_t timevar;
                        time(&timevar);
                        strftime(buffer, 26, "%Y-%m-%d %H:%M:%S", localtime(&timevar));
                        ESP_LOGI(TAG, "NMEA: %s", nmeabuf);
                        ESP_LOGI(TAG, "System time set to GPS time: %s", buffer);
                    }
                    num_valid_gps_msgs++;
                }
            }
            else
            {
                if(!timesetrtc && !timesetgps)
                {
                    setSystemDateTime(datestr, timestr);
                    timesetrtc = true;
                    char buffer[26] = "";
                    time_t timevar;
                    time(&timevar);
                    strftime(buffer, 26, "%Y-%m-%d %H:%M:%S", localtime(&timevar));
                    ESP_LOGI(TAG, "NMEA: %s", nmeabuf);
                    ESP_LOGI(TAG, "System time set to RTC time: %s", buffer);            
                }
            }
            return true;
        }
    }

    return false;
}

void GpsTask(void *pvParameter)
{
    nmea_buffer_mutex =  xSemaphoreCreateMutex();
    uint8_t data_byte = 0;
    size_t nmea_buffer_index = 0;
    nmea_buffer_num = 0;
    int len = 0;

    if( nmea_buffer_mutex == NULL )
    {
        ESP_LOGE(TAG, "NMEA mutex not created");
    }
    xSemaphoreTake(nmea_buffer_mutex, portMAX_DELAY);
    // Configure a temporary buffer for the incoming data
    nmea_buffer[0] = (uint8_t *) malloc(NMEA_BUF_LEN);
    nmea_buffer[0][0] = '\0';
    nmea_buffer[1] = (uint8_t *) malloc(NMEA_BUF_LEN);
    nmea_buffer[1][0] = '\0';
    xSemaphoreGive(nmea_buffer_mutex);
    /* Configure parameters of an UART driver,
     * communication pins and install the driver */
    uart_config_t uart_config = {
        .baud_rate = 9600,
        .data_bits = UART_DATA_8_BITS,
        .parity    = UART_PARITY_DISABLE,
        .stop_bits = UART_STOP_BITS_1,
        .flow_ctrl = UART_HW_FLOWCTRL_DISABLE
    };
    uart_param_config(UART_NUM_1, &uart_config);
    uart_set_pin(UART_NUM_1, ECHO_TEST_TXD, ECHO_TEST_RXD, ECHO_TEST_RTS, ECHO_TEST_CTS);
    uart_driver_install(UART_NUM_1, NMEA_BUF_LEN * 2, 0, 0, NULL, 0);

    do  // throw out bytes from GPS until start of first NMEA string - makes sure GPS is alive before cmd sent
    {
        len = uart_read_bytes(UART_NUM_1, &data_byte, 1, 200 / portTICK_RATE_MS);
        //ESP_LOGI(TAG, "len %d byte %d", len, data_byte);
    } while(len == 0 || data_byte != '$');
    uart_write_bytes(UART_NUM_1, GPS_CMD_HOT_START, strlen(GPS_CMD_HOT_START));
    vTaskDelay(1000/portTICK_PERIOD_MS);
    uart_write_bytes(UART_NUM_1, GPS_CMD_RMS, strlen(GPS_CMD_RMS));
    vTaskDelay(100/portTICK_PERIOD_MS);
    uart_write_bytes(UART_NUM_1, GPS_CMD_100MS, strlen(GPS_CMD_100MS));
    vTaskDelay(100/portTICK_PERIOD_MS);
    uart_write_bytes(UART_NUM_1, GPS_CMD_SBAS, strlen(GPS_CMD_SBAS));
    vTaskDelay(100/portTICK_PERIOD_MS);

    //esp_err_t starttime = esp_timer_get_time();
    while (1) {
        // Read data from the UART
        len = uart_read_bytes(UART_NUM_1, &data_byte, 1, 200 / portTICK_RATE_MS);
        if (len>0)
        {
            xSemaphoreTake(nmea_buffer_mutex, portMAX_DELAY);
            if (data_byte == '\r')
            {
                nmea_buffer[nmea_buffer_num][nmea_buffer_index] = 0;
                //ESP_LOGI(TAG, "NMEA: %s", nmea_buffer[nmea_buffer_num]);
                //ESP_LOGI(TAG, "Previous NMEA: %s", nmea_buffer[1-nmea_buffer_num]);
                //ESP_LOGI(TAG, "%lld", esp_timer_get_time());
                //ESP_LOGI(TAG, "Stack high-water: %d", uxTaskGetStackHighWaterMark(NULL));
                if(nmea_buffer[nmea_buffer_num][0] == '$' && nmea_buffer[nmea_buffer_num][nmea_buffer_index - 3] == '*')
                {
                    char cs_read_upper_str[2] = "z"; 
                    char cs_read_lower_str[2] = "z";
                    cs_read_upper_str[0] = nmea_buffer[nmea_buffer_num][nmea_buffer_index - 2];
                    cs_read_lower_str[0] = nmea_buffer[nmea_buffer_num][nmea_buffer_index - 1];
                    //ESP_LOGI(TAG, "cs high byte: %s, low byte: %s", cs_read_upper_str, cs_read_lower_str);
                    uint8_t cs_read_upper;
                    uint8_t cs_read_lower;
                    cs_read_upper = (uint8_t) strtol(cs_read_upper_str, NULL, 16);
                    cs_read_lower = (uint8_t) strtol(cs_read_lower_str, NULL, 16);
                    //ESP_LOGI(TAG, "cs high byte: %x, low byte: %x", cs_read_upper, cs_read_lower);
                    cs_read_upper = cs_read_upper << 4;
                    //ESP_LOGI(TAG, "cs high byte: %x, low byte: %x", cs_read_upper, cs_read_lower);
                    unsigned int cs_read;
                    unsigned int cs_calc;
                    cs_read = cs_read_upper | cs_read_lower;
                    cs_calc = 0;
                    for(int i = 1; i < nmea_buffer_index - 3; i++)
                    {
                        cs_calc = cs_calc ^ nmea_buffer[nmea_buffer_num][i];
                    }
                    //ESP_LOGI(TAG, "cs_read: %02x cs_calc: %02x", cs_read, cs_calc);
                    if(cs_read == cs_calc)
                    {
                        nmea_buffer_num = 1 - nmea_buffer_num;
                        nmea_available = true;
                    }
                    else
                    {
                        ESP_LOGE(TAG, "NMEA checksum error: read: %x, calc: %x, %s", cs_read, cs_calc, nmea_buffer[nmea_buffer_num]);
                    }
                }                    
                nmea_buffer_index = 0;
                xSemaphoreGive(nmea_buffer_mutex);
                setTime();
            } else if (data_byte == '\n')
            {
                xSemaphoreGive(nmea_buffer_mutex);
            }
                else
            {
                nmea_buffer[nmea_buffer_num][nmea_buffer_index] = data_byte;
                nmea_buffer_index = (nmea_buffer_index < NMEA_BUF_LEN - 1) ? nmea_buffer_index + 1 : nmea_buffer_index;
                xSemaphoreGive(nmea_buffer_mutex);
            }
       }
    }
}
