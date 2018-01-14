 
#include <Wire.h>
#include <HardwareSerial.h>
#include "FS.h"
#include "SD.h"
#include "SPI.h"

// No idea why this address - should be 0x20 but scanner found it here
#define EXPANDER_ADDR 0x38 

#define KEEPALIVE 4
#define POWER_SW 35
#define BLINK 13



// Globals
HardwareSerial Serial1(2); // GPS serial port

//timer variables
hw_timer_t * timer = NULL;
volatile SemaphoreHandle_t timerSemaphore;
portMUX_TYPE timerMux = portMUX_INITIALIZER_UNLOCKED;
volatile uint32_t isrCounter = 0;
volatile uint32_t lastIsrAt = 0;
volatile int margin = 0;
volatile int overrun;

void setupPower()
{
    pinMode(KEEPALIVE, OUTPUT);
    pinMode(POWER_SW, INPUT);
    digitalWrite(KEEPALIVE, HIGH);
}

void setupExpander()
{
    Wire.beginTransmission(EXPANDER_ADDR); 
    Wire.write(byte(0x03)); // direction register
    Wire.write(byte(0x00)); // all outs
    Wire.endTransmission();

    Wire.beginTransmission(EXPANDER_ADDR);
    Wire.write(byte(0x01)); // port register
    Wire.write(byte(0x0f)); // power on, LEDs on   
    Wire.endTransmission();
}

void setupGPS()
{
    Serial1.begin(9600);
}

void setupSD()
{
    SD.begin();
    while(!SD.begin()){
        Serial.println("Card Mount Failed");
        digitalWrite(BLINK, HIGH);
        //return;
    }

}
void setup() {
    Wire.begin();
    Serial.begin(115200);
    setupPower();
    setupExpander();
    setupGPS();
    setupSD();
    pinMode(BLINK, OUTPUT);
    digitalWrite(BLINK, HIGH);
    delay(100);
    digitalWrite(BLINK, LOW);
}

void checkPowerSwitch()
{
    if(digitalRead(POWER_SW) == LOW)
    {
        int i;
        for(i=0; i<10; i++)
        {
            delay(100);
            digitalWrite(BLINK, HIGH);
            delay(100);
            digitalWrite(BLINK, LOW);         
        }
        digitalWrite(KEEPALIVE, LOW);
    }
}

void loop() {
  // put your main code here, to run repeatedly:
    while (Serial1.available()) {
        char c = Serial1.read();
        if (c) {
            Serial.print(c);
        }
    }
    checkPowerSwitch();
    //digitalWrite(BLINK, digitalRead(POWER_SW));
}
