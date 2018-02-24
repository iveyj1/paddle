#include "FS.h"
#include "SD.h"
#include "SPI.h"

#include <Wire.h>
#include <Adafruit_ADS1015.h>

Adafruit_ADS1115 ads;  /* Use this for the 16-bit version */

#define pin_red_led 5

HardwareSerial Serial1(2);

//timer variables
hw_timer_t * timer = NULL;
volatile SemaphoreHandle_t timerSemaphore;
portMUX_TYPE timerMux = portMUX_INITIALIZER_UNLOCKED;
volatile uint32_t isrCounter = 0;
volatile uint32_t lastIsrAt = 0;
volatile int margin = 0;
volatile int overrun;

File logfile;


char filename[25];

void setup(){

    pinMode(5, OUTPUT);
    Serial.begin(115200);
    if(!SD.begin()){
        Serial.println("Card Mount Failed");
        error(2);
    }
    Serial1.begin(9600);
    setupGPS(Serial1);
    //testFile();
    setupTimer();

    strcpy(filename, "/ANALOG00.TXT");

    for (uint8_t i = 0; i < 100; i++) {
        filename[7] = '0' + i / 10;
        filename[8] = '0' + i % 10;
        // create if does not exist, do not open existing, write, sync after write
        if (! SD.exists(filename)) {
            break;
        }
    }

    logfile = SD.open(filename, FILE_WRITE);
    if( ! logfile ) {
        Serial.println("could not open file");
        error(3);
    } 

    ads.setGain(GAIN_SIXTEEN);    // 16x gain  +/- 0.256V  1 bit = 0.125mV  0.0078125mV
    ads.begin();
}

uint32_t loopc = 0;

void loop(){
    uint32_t time;
    String gpsstr;
    String outstr;
    if (xSemaphoreTake(timerSemaphore, 0) == pdTRUE) {
        overrun = 1;
        margin = -1;
    } else {
        time = millis();
        while (xSemaphoreTake(timerSemaphore, 0) != pdTRUE) {
            ;
        }
        margin = millis() - time;
    }
    //Serial.println(String("Margin: ")+margin);
    processGPS(Serial1, gpsstr);
    outstr = String() + millis() + " " + gpsstr;
    logfile.println(outstr);
    Serial.println(outstr);
    if(digitalRead(0) == LOW) {
        logfile.close();
        Serial.println("Stop pressed");
        error(1);
    }
    
}


