/*
   Connect the SD card to the following pins:

   sparkfun SD Card | sparkfun esp32 thing
      VCC       3.3
      CS        2/CS/GPIO21
      DI        23/MOSI/GPIO23
      SCK       SCK
      DO        19/MISO/GPIO19
      GND       GND
*/
#include "FS.h"
#include "SD.h"
#include "SPI.h"


#include <Wire.h>
#define debug_con

volatile unsigned int overrun = 0;

HardwareSerial Serial1(2);

File logfile;

int pin_red_led = 5;

void listDir(fs::FS &fs, const char * dirname, uint8_t levels){
    Serial.printf("Listing directory: %s\n", dirname);

    File root = fs.open(dirname);
    if(!root){
        Serial.println("Failed to open directory");
        return;
    }
    if(!root.isDirectory()){
        Serial.println("Not a directory");
        return;
    }

    File file = root.openNextFile();
    while(file){
        if(file.isDirectory()){
            Serial.print("  DIR : ");
            Serial.println(file.name());
            if(levels){
                listDir(fs, file.name(), levels -1);
            }
        } else {
            Serial.print("  FILE: ");
            Serial.print(file.name());
            Serial.print("  SIZE: ");
            Serial.println(file.size());
        }
        file = root.openNextFile();
    }
}

hw_timer_t * timer = NULL;
volatile SemaphoreHandle_t timerSemaphore;
portMUX_TYPE timerMux = portMUX_INITIALIZER_UNLOCKED;

volatile uint32_t isrCounter = 0;
volatile uint32_t lastIsrAt = 0;

void IRAM_ATTR onTimer() {
    // Increment the counter and set the time of ISR
    portENTER_CRITICAL_ISR(&timerMux);
    isrCounter++;
    lastIsrAt = millis();
    portEXIT_CRITICAL_ISR(&timerMux);
    // Give a semaphore that we can check in the loop
    xSemaphoreGiveFromISR(timerSemaphore, NULL);
    // It is safe to use digitalRead/Write here if you want to toggle an output
}

void setupTimer() {
    // Create semaphore to inform us when the timer has fired
    timerSemaphore = xSemaphoreCreateBinary();
    
    // Use 1st timer of 4 (counted from zero).
    // Set 80 divider for prescaler (see ESP32 Technical Reference Manual).
    timer = timerBegin(0, 80, true);
    
    // Attach onTimer function to our timer.
    timerAttachInterrupt(timer, &onTimer, true);
    
    // Set alarm to call onTimer function every second (value in microseconds).
    // Repeat the alarm (third parameter)
    timerAlarmWrite(timer, 100000, true);
    
    // Start an alarm
    timerAlarmEnable(timer);
    
}

// blink out an error code
void error(uint8_t errno) {
    Serial.println(String("Error number: ") + errno);
    while (1) {
        uint8_t i;
        for (i = 0; i < errno; i++) {
            digitalWrite(pin_red_led, HIGH);
            delay(50);
            digitalWrite(pin_red_led, LOW);
            delay(450);
        }
        delay(2000);
    }
}


void openAcqFile() {
    char filename[20];
    File file;
    //see if the card is present and can be initialized:
    if (!SD.begin()) {
        Serial.println("Card Mount Failed");
        return;
    }
    uint8_t cardType = SD.cardType();
    
    if (cardType == CARD_NONE) {
        Serial.println("No SD card attached");
        return;
    }
    
    uint64_t cardSize = SD.cardSize() / (1024 * 1024);
    Serial.printf("SD Card Size: %lluMB\n", cardSize);
  
    strcpy(filename, "/ANALOG00.TXT");
    for (uint8_t i = 0; i < 100; i++) {
        filename[7] = '0' + i / 10;
        filename[8] = '0' + i % 10;
        // create if does not exist, do not open existing, write, sync after write
        if (! SD.exists(filename)) {
            break;
        }
    }
    file = SD.open(filename, FILE_WRITE);
    if(!file)
        Serial.printf("File %s not open", filename);
}

void setupPins() {
    pinMode(pin_red_led, OUTPUT);
    digitalWrite(pin_red_led, HIGH);
}

void setup() {

    Serial.begin(115200);
    setupPins();
    setupTimer();
    listDir(SD, "/", 0);
    openAcqFile();
}

uint32_t i = 0, overrun_count = 0;

uint32_t margin = 0;

void loop() {
   
    digitalWrite(pin_red_led, LOW);
    if (xSemaphoreTake(timerSemaphore, 0) == pdTRUE) {
        overrun = 1;
    }
    while (xSemaphoreTake(timerSemaphore, 0) != pdTRUE) {
        margin++;
    }
    
    digitalWrite(pin_red_led, HIGH);


}


