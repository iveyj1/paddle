/*
    Connect the SD card to the following pins:

    sparkfun SD Card | sparkfun esp32 thing
      VCC       3.3
      CS        GPIO13/CS
      DI        GPIO23/MOSI/DI
      SCK       GPIO18/SCK
      DO        GPIO19/MISO/DO
      GND       GND
*/

#include "SPI.h"
#define CS 13

void PrintHex83(uint8_t *data, uint8_t length) // prints 8-bit data in hex
{
 char tmp[length*2+1];
 byte first ;
 int j=0;
 for (uint8_t i=0; i<length; i++) 
 {
   first = (data[i] >> 4) | 48;
   if (first > 57) tmp[j] = first + (byte)39;
   else tmp[j] = first ;
   j++;

   first = (data[i] & 0x0F) | 48;
   if (first > 57) tmp[j] = first + (byte)39; 
   else tmp[j] = first;
   j++;
 }
 tmp[length*2] = 0;
 Serial.print(tmp);
}

void setup() {
    pinMode(CS, OUTPUT);
    digitalWrite(CS, HIGH);
    SPI.begin(18, 19, 23, CS); // sck, miso, mosi, ss
    Serial.begin(115200);
}
uint8_t a, b, c, d;
uint32_t e;
int32_t f;
String msg;
char cmsg[256];
int8_t sign = 1;
float v;
void loop() {
    SPI.beginTransaction(SPISettings(400000, MSBFIRST, SPI_MODE0));
    digitalWrite(CS, LOW);
    a = SPI.transfer(0x00);
    b = SPI.transfer(0x00);
    c = SPI.transfer(0x00);
    d = SPI.transfer(0x00);
    digitalWrite(CS, HIGH);
    SPI.endTransaction();

    //PrintHex83(&a,1);
    //PrintHex83(&b,1);
    //PrintHex83(&c,1);
    //PrintHex83(&d,1);
    //Serial.println();
    e = ((a) << 24) | (b << 16) | (c << 8) | d;
    f = e;
    if ((a & 0x20) == 0)  {
        f = f | 0xe0000000;  // sign extend if negative
    } else {
        f = f & 0x1fffffff;  // get rid of sign bit if positive
    }
    f = f >> 5;  // discard low order bits to leave 24-bit result
 
    //Serial.println(f);
    v = (f * 3.3)/16777215.0;
    sprintf(cmsg, "%10.8f", v);
    Serial.println(cmsg);
    delay(250);

}
