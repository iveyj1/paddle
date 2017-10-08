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
uint8_t sign = 1;
void loop() {
    SPI.beginTransaction(SPISettings(400000, MSBFIRST, SPI_MODE0));
    digitalWrite(CS, LOW);
    a = SPI.transfer(0x55);
    b = SPI.transfer(0x55);
    c = SPI.transfer(0x55);
    d = SPI.transfer(0x55);
    digitalWrite(CS, HIGH);
    SPI.endTransaction();

    if ((a & 0x20) == 0)  {
        sign = -1;
    } else {
        sign = 1;
    }
    a = a & 0x1f;
    e = ((a) << 24) | (b << 16) | (c << 8) | d;
    f = sign*e;

    //msg = String(a, HEX) + " " + String(b, HEX) + " " + String(c, HEX) + " " + String(d, HEX) + " " + String(e, HEX) + " " + f;

    //Serial.println(msg);

    PrintHex83(&a,1);
    PrintHex83(&b,1);
    PrintHex83(&c,1);
    PrintHex83(&d,1);
    sprintf(cmsg," %12ld",f);
    Serial.println(cmsg);
    delay(200);

}
