 
#include <Wire.h>
#include <HardwareSerial.h>
#include <FS.h>
#include "SD.h"
#include "SPI.h"
#include <WiFi.h>

// No idea why this address - should be 0x20 (or possibly 0x40) but scanner found it here
#define EXPANDER_ADDR 0x38 

// IO ports
#define KEEPALIVE 4
#define POWER_SW 35
#define BLINK 13
//#define cardselect 5

// Expander bits
#define LED0 0x00u
#define LED1 0x01u
#define LED2 0x02u
#define LED3 0x03u
#define VA_3_3_ENABLE 0x04u
#define GPS_ENABLE 0x05u
#define SD_ENABLE 0x06u
#define AN_REFSEL 0x07u

#define TCA9534_IN_PORT 0x00
#define TCA9534_OUT_PORT 0x01
#define TCA9534_POL_PORT 0x02
#define TCA9534_DIR_PORT 0x03

#define bmask(mask) (1 << (mask))
#define cardSelect 5

//WiFi globals
const char* ssid     = "NETGEAR12";
const char* password = "widephoenix967";
WiFiServer server(80);


// Globals
HardwareSerial Serial1(2); // GPS serial port
File logfile;

//timer variables
hw_timer_t * timer = NULL;
volatile SemaphoreHandle_t timerSemaphore;
portMUX_TYPE timerMux = portMUX_INITIALIZER_UNLOCKED;
volatile uint32_t isrCounter = 0;
volatile uint32_t lastIsrAt = 0;
volatile int margin = 0;
volatile int overrun;

void setup() {
    pinMode(BLINK, OUTPUT);
    Wire.begin();
    Serial.begin(115200);
    setupPower();
    setupExpander();
    setupGPS();
    setupSD();
    openAcqFile();
    setupTimer();
    setupWifi();

}

//int overrun = false;
unsigned long int startloop = 0;
unsigned long int temp;
void loop() 
{
    while (Serial1.available()) 
    {
        char c = Serial1.read();
        if (c) 
        {
            ;//Serial.print(c);
        }
    }

  // If Timer has fired
    if (xSemaphoreTake(timerSemaphore, 0) == pdTRUE)
    { // blown loop time     
       overrun = true; 
       bsetExpander(LED0, HIGH);
    }
    margin = 0;
    
    while (xSemaphoreTake(timerSemaphore, 0) != pdTRUE)
    {
        margin++;
    }
    
    {
        uint32_t isrCount = 0, isrTime = 0;
        // Read the interrupt count and time
        portENTER_CRITICAL(&timerMux);
        isrCount = isrCounter;
        isrTime = lastIsrAt;
        portEXIT_CRITICAL(&timerMux);
        //digitalWrite(BLINK, ((isrCounter % 2) == 1));
        Serial.print(isrCount);
        Serial.print(" ");
        Serial.print(isrTime);
        Serial.print(" ");
        Serial.print(micros());
        Serial.print(" ");
        temp = micros();
        Serial.println(temp-startloop);
    }
    startloop = temp;
    processWifi();
    checkPowerSwitch();
    
    //digitalWrite(BLINK, digitalRead(LOW));
    //delay(1000);
    //digitalWrite(BLINK, HIGH);
    //delay(1000);
}
