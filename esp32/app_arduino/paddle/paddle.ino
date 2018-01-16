 
#include <Wire.h>
#include <HardwareSerial.h>
#include <FS.h>
#include "SD.h"
#include "SPI.h"

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


// Globals
HardwareSerial Serial1(2); // GPS serial port
File logfile;
#define cardSelect 5

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
    //testFile();

}

void loop() 
{
    while (Serial1.available()) 
    {
        char c = Serial1.read();
        if (c) {
            ;//Serial.print(c);
        }
    }
  // If Timer has fired
#if 0
    if (xSemaphoreTake(timerSemaphore, 0) == pdTRUE)
    {
        uint32_t isrCount = 0, isrTime = 0;
        // Read the interrupt count and time
        portENTER_CRITICAL(&timerMux);
        isrCount = isrCounter;
        isrTime = lastIsrAt;
        portEXIT_CRITICAL(&timerMux);
        digitalWrite(BLINK, ((isrCounter % 2) == 1));
    }
#endif
    checkPowerSwitch();
    
    //digitalWrite(BLINK, digitalRead(LOW));
    //delay(1000);
    //digitalWrite(BLINK, HIGH);
    //delay(1000);
}
