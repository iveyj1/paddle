// Test code for Adafruit GPS modules using MTK3329/MTK3339 driver
//
// This code turns on the LOCUS built-in datalogger. The datalogger
// turns off when power is lost, so you MUST turn it on every time
// you want to use it!
//
// Tested and works great with the Adafruit Ultimate GPS module
// using MTK33x9 chipset
//    ------> http://www.adafruit.com/products/746
// Pick one up today at the Adafruit electronics shop 
// and help support open source hardware & software! -ada

//#include <Adafruit_GPS.h>
//#if ARDUINO >= 100
//#include <SoftwareSerial.h>
//#else
  // Older Arduino IDE requires NewSoftSerial, download from:
  // http://arduiniana.org/libraries/newsoftserial/
// #include <NewSoftSerial.h>
 // DO NOT install NewSoftSerial if using Arduino 1.0 or later!
//#endif
#include <HardwareSerial.h>
// Connect the GPS Power pin to 5V
// Connect the GPS Ground pin to ground
// If using software serial (sketch example default):
//   Connect the GPS TX (transmit) pin to Digital 3
//   Connect the GPS RX (receive) pin to Digital 2
// If using hardware serial (e.g. Arduino Mega):
//   Connect the GPS TX (transmit) pin to Arduino RX1, RX2 or RX3
//   Connect the GPS RX (receive) pin to matching TX1, TX2 or TX3

// If using software serial, keep these lines enabled
// (you can change the pin numbers to match your wiring):
#if ARDUINO >= 100
 // SoftwareSerial mySerial(3, 2);
#else
 // NewSoftSerial mySerial(3, 2);
#endif

//Adafruit_GPS GPS(&mySerial);
// If using hardware serial (e.g. Arduino Mega), comment
// out the above six lines and enable this line instead:
HardwareSerial Serial1(2);
//Adafruit_GPS GPS(&Serial1);

void setup()  
{    
  while (!Serial);  // Leonardo will wait till serial connects

  // connect at 115200 so we can read the GPS fast enuf and
  // also spit it out
  Serial.begin(115200);
  Serial.println("Adafruit GPS logging start test!");
  Serial1.begin(9600);

  // 9600 NMEA is the default baud rate for MTK - some use 4800
  //GPS.begin(9600);
  
  //GPS.sendCommand(PMTK_SET_NMEA_OUTPUT_RMCONLY);

  // If using hardware serial (e.g. Arduino Mega), change this to Serial1, etc.
  while (Serial1.available())
     Serial1.read();

  delay(1000);
  //Serial1.println("$PMTK622,1*29");
  
  Serial.println("----------------------------------------------------");
}


void loop()                     // run over and over again
{  
  // If using hardware serial (e.g. Arduino Mega), change this to Serial1, etc.
  if (Serial1.available()) {
    char c = Serial1.read();
    if (c) {

      Serial.print(c);

    }
  }
}
