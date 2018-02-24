#include <Wire.h>
#include "ADS1015_async.h"

ADS1115_async ads(0x48);  /* Use this for the 16-bit version */


volatile static uint8_t a=0;

void int_subr()
{
    a = 1;
}

void setup(void)
{
    Serial.begin(115200);
    Serial.println("Hello!");

    Serial.println("Getting single-ended readings from AIN0..3");
    Serial.println("ADC Range: +/- 6.144V (1 bit = 3mV/ADS1015, 0.1875mV/ADS1115)");

    // The ADC input range (or gain) can be changed via the following
    // functions, but be careful never to exceed VDD +0.3V max, or to
    // exceed the upper and lower limits if you adjust the input range!
    // Setting these values incorrectly may destroy your ADC!
    //                                                                ADS1015  ADS1115
    //                                                                -------  -------
    // ads.setGain(GAIN_TWOTHIRDS);  // 2/3x gain +/- 6.144V  1 bit = 3mV      0.1875mV (default)
    ads.setGain(GAIN_ONE);        // 1x gain   +/- 4.096V  1 bit = 2mV      0.125mV
    // ads.setGain(GAIN_TWO);        // 2x gain   +/- 2.048V  1 bit = 1mV      0.0625mV
    // ads.setGain(GAIN_FOUR);       // 4x gain   +/- 1.024V  1 bit = 0.5mV    0.03125mV
    // ads.setGain(GAIN_EIGHT);      // 8x gain   +/- 0.512V  1 bit = 0.25mV   0.015625mV
    // ads.setGain(GAIN_SIXTEEN);    // 16x gain  +/- 0.256V  1 bit = 0.125mV  0.0078125mV

    ads.begin();

    pinMode(33, INPUT_PULLUP);
    pinMode(27, OUTPUT);
    attachInterrupt(digitalPinToInterrupt(33), int_subr, FALLING);
    
}
void loop(void)
{
    int16_t adc0, adc1, adc2, adc3;

    digitalWrite(27, HIGH);
    ads.startADC_SingleEnded(0);
    digitalWrite(27, LOW);
    while (a == 0) 
    {
        Serial.println("not interrupted");
        delay(100);
    } 
    //delay(9);
    a = 0;
    adc0 = ads.getLastConversionResults();
    Serial.print("AIN0: "); Serial.println(adc0);
    Serial.println(" ");

    delay(100);


}
