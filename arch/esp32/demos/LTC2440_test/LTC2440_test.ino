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


#include <Wire.h>
#include "Adafruit_ADS1015.h"

#include "SPI.h"
#define CS 13

Adafruit_ADS1115 ads;  /* Use this for the 16-bit version */


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

    // The ADC input range (or gain) can be changed via the following
    // functions, but be careful never to exceed VDD +0.3V max, or to
    // exceed the upper and lower limits if you adjust the input range!
    // Setting these values incorrectly may destroy your ADC!
    //                                                                ADS1015  ADS1115
    //                                                                -------  -------
    // ads.setGain(GAIN_TWOTHIRDS);  // 2/3x gain +/- 6.144V  1 bit = 3mV      0.1875mV (default)
    //ads.setGain(GAIN_ONE);        // 1x gain   +/- 4.096V  1 bit = 2mV      0.125mV
    ads.setGain(GAIN_TWO);        // 2x gain   +/- 2.048V  1 bit = 1mV      0.0625mV
    // ads.setGain(GAIN_FOUR);       // 4x gain   +/- 1.024V  1 bit = 0.5mV    0.03125mV
    // ads.setGain(GAIN_EIGHT);      // 8x gain   +/- 0.512V  1 bit = 0.25mV   0.015625mV
    // ads.setGain(GAIN_SIXTEEN);    // 16x gain  +/- 0.256V  1 bit = 0.125mV  0.0078125mV
    
    ads.begin();

}
uint8_t a, b, c, d;
uint32_t e;
int32_t f;
String msg;
char cmsg[256];
int8_t sign = 1;
float v, vlast;
void loop() {

    int16_t adc0;

//    adc0 = ads.readADC_SingleEnded(0);
    adc0 = ads.readADC_Differential_0_1();
    
    v = 1000000*(adc0 * 0.0000625) / (100000.0 / 249 + 1);
    sprintf(cmsg, "%12.8f", vlast);
    vlast = v;
    Serial.print(cmsg);

    SPI.beginTransaction(SPISettings(400000, MSBFIRST, SPI_MODE0));
    digitalWrite(CS, LOW);
    a = SPI.transfer(0x00);
    b = SPI.transfer(0x00);
    c = SPI.transfer(0x00);
    d = SPI.transfer(0x00);
    digitalWrite(CS, HIGH);
    SPI.endTransaction();

    e = ((a) << 24) | (b << 16) | (c << 8) | d;
    f = e;
    if ((a & 0x20) == 0)  {
        f = f | 0xe0000000;  // sign extend if negative
    } else {
        f = f & 0x1fffffff;  // get rid of sign bit if positive
    }
    f = f >> 5;  // discard low order bits to leave 24-bit result
 
    //Serial.println(f);
    v = 1000000*(f * 3.3)/16777215.0;
    sprintf(cmsg, " %12.8f", v);
    Serial.println(cmsg);
    //Serial.println();
    delay(250);

}
