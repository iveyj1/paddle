/*
 * Connect the SD card to the following pins:
 *
 * sparkfun SD Card | sparkfun esp32 thing
 *    VCC       3.3
 *    CS        GPIO5/CS 
 *    DI        GPIO23/MOSI/DI
 *    SCK       GPIO18/SCK
 *    DO        GPIO19/MISO/DO
 *    GND       GND
 */

#include "SPI.h"
#define CS 13


void setup(){
    pinMode(CS, OUTPUT);
    digitalWrite(CS, HIGH);
    SPI.begin(18, 19, 23, CS); // sck, miso, mosi, ss
    Serial.begin(115200);
}
uint8_t a,b,c,d;
uint32_t e;
int32_t f;
String msg;
void loop(){
    SPI.beginTransaction(SPISettings(400000, MSBFIRST, SPI_MODE0));
    digitalWrite(CS, LOW);
    a = SPI.transfer(0x55);
    b = SPI.transfer(0x55);
    c = SPI.transfer(0x55);
    d = SPI.transfer(0x55);
    digitalWrite(CS, HIGH);
    SPI.endTransaction();
    if((a & 0x02) != 0)  {
        Serial.print(String(a,HEX) + " ");
        a |= 0xfc; 
        Serial.println(String(a,HEX));
    }
    e = ((a & 0x1f) << 24) | (b << 16) | (c << 8) | d;
    f = (int32_t)e;

    msg = String(a,HEX) + " " + String(b,HEX) + " " + String(c, HEX) + " " + String(d, HEX) + " " + String(e,HEX) + " " + f;

    Serial.println(msg);
    delay(200);

}
