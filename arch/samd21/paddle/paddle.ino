#include <SPI.h>
#include <SD.h>
#include <Wire.h>
//#define debug_con

volatile unsigned int start_acq = 0;
volatile unsigned int overrun = 0;

// Set the pins used
#define cardSelect 4

File logfile;

int pin_red_led = 13; 
int pin_grn_led = 8; 
int pin_power_switch = 6;
int pin_keepalive = 12; 

void checkShutdown()  {
    if(digitalRead(pin_power_switch) == LOW){
        if(logfile) {
            logfile.close();
            digitalWrite(pin_grn_led, HIGH);
            delay(100);
        }
        delay(100);
        digitalWrite(pin_keepalive, LOW);
        while(1) {
            ;
        }
    }    
    return;
}

// blink out an error code
void error(uint8_t errno) {
    while(1) {
        uint8_t i;
        for (i=0; i<errno; i++) {
            digitalWrite(pin_red_led, HIGH);
            delay(50);
            digitalWrite(pin_red_led, LOW);
            delay(450);
        }
//        for (i=errno; i<15; i++) {
          delay(2000);
//        }
        checkShutdown();
    }
}

void setup_tcc() {
    // Enable clock for TC 
    REG_GCLK_CLKCTRL = (uint16_t) (GCLK_CLKCTRL_CLKEN | GCLK_CLKCTRL_GEN_GCLK0 | GCLK_CLKCTRL_ID_TCC0_TCC1) ;
    while ( GCLK->STATUS.bit.SYNCBUSY == 1 ); // wait for sync 

    // The type cast must fit with the selected timer 
    Tcc* TC = (Tcc*) TCC0;                    // get timer struct

    TC->CTRLA.reg &= ~TCC_CTRLA_ENABLE;       // Disable TC
    while (TC->SYNCBUSY.bit.ENABLE == 1);     // wait for sync 


    TC->CTRLA.reg |= TCC_CTRLA_PRESCALER_DIV64;   // Set prescaler


    TC->WAVE.reg |= TCC_WAVE_WAVEGEN_NFRQ;    // Set wave form configuration 
    while (TC->SYNCBUSY.bit.WAVE == 1);       // wait for sync 

    TC->PER.reg = 0x493e; //0x1d4c; //0x1d4c; // Set counter Top using the PER register  
    while (TC->SYNCBUSY.bit.PER == 1);        // wait for sync 

    TC->CC[0].reg = 0xFFF;
    while (TC->SYNCBUSY.bit.CC0 == 1); // wait for sync 

    // Interrupts 
    TC->INTENSET.reg = 0;                     // disable all interrupts
    TC->INTENSET.bit.OVF = 1;                 // enable overfollow interrupt
    //TC->INTENSET.bit.MC0 = 1;               // enable compare match to CC0

    // Enable InterruptVector
    NVIC_EnableIRQ(TCC0_IRQn);

    // Enable TC
    TC->CTRLA.reg |= TCC_CTRLA_ENABLE ;
    while (TC->SYNCBUSY.bit.ENABLE == 1); // wait for sync 

}

void open_acq_file(){
    char testchar;
    char filename[15];
    //see if the card is present and can be initialized:
    if (!SD.begin(cardSelect)) {
        error(2);
    }

    strcpy(filename, "ANALOG00.TXT");
    for (uint8_t i = 0; i < 100; i++) {
        filename[6] = '0' + i/10;
        filename[7] = '0' + i%10;
        // create if does not exist, do not open existing, write, sync after write
        if (! SD.exists(filename)) {
            break;
        }
    }

    if(SD.exists(filename)) {
        if(!SD.remove(filename)) {
            error(3);
        }
    }

    logfile = SD.open(filename, FILE_WRITE);
    if(!logfile) {
        error(4);
    }
    logfile.seek(0);
    if(logfile.write('t') != 1) {
        error(5);
    }
    logfile.flush();
    logfile.close();

    logfile = SD.open(filename, FILE_WRITE);
    if(!logfile) {
        error(6);
    }
    logfile.seek(0);
    testchar = 0;
    testchar = logfile.read();
    if(testchar != 't'){
        error(7);
    }
    logfile.seek(0);
    if(logfile.write('r') != 1) {
        error(8);
    }
    logfile.close();

    
    logfile = SD.open(filename, FILE_WRITE);
    if(!logfile) {
        error(9);
    }
    logfile.seek(0);
    testchar = 0;
    testchar = logfile.read();
    if(testchar != 'r'){
        error(10);
    }
    logfile.flush();
    logfile.close();

    if(SD.exists(filename)) {
        if(!SD.remove(filename)) {
            error(11);
        }
    }    
    
    logfile = SD.open(filename, FILE_WRITE);
    if( ! logfile ) {
        error(12);
    }
}

void setup() {

    pinMode(pin_red_led, OUTPUT);   
    digitalWrite(pin_red_led, HIGH); 
    pinMode(pin_grn_led, OUTPUT);   
    digitalWrite(pin_grn_led, LOW); 
    pinMode(pin_power_switch, INPUT_PULLUP);
    pinMode(pin_keepalive, OUTPUT);
    digitalWrite(pin_keepalive, HIGH);
    setup_tcc();
    open_acq_file();
    analogReadResolution(12);
    overrun = 0;
    start_acq=0;

#ifdef debug_con  
    Serial.begin(115200);
#endif  

    Serial1.begin(9600);
    Serial1.println("$PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29"); // RMS message only
    Serial1.println("$PMTK220,100*2F"); // 100ms position solutions
    Serial1.println("$PMTK313,1*2E"); // enable SBAS
}

uint32_t i=0, overrun_count=0;

uint32_t margin=0;

int16_t c;
String s[2];
uint8_t nema_index = 0;
uint8_t nema_available = 0;
uint8_t nema_available_last = 0;

void loop() {
    uint16_t adc0, adc1, adc2, adc3;
    String outstr = "";

    digitalWrite(pin_red_led, LOW);
    if(start_acq == 1){
        overrun = 1;
        digitalWrite(pin_grn_led, HIGH);
    }
    while(start_acq==0) {
        margin++;
    }

    digitalWrite(pin_red_led, HIGH);
    checkShutdown();

    adc0 = analogRead(A0);
    adc1 = analogRead(A1); 
    adc2 = analogRead(A2); 
    adc3 = analogRead(A3); 

    while((c = Serial1.read()) != -1) {
        if(char(c) == '$') {
            for (int index1 = 0; index1 <= s[nema_index].length(); index1++) {
                if (s[nema_index][index1] == '\r' || s[nema_index][index1] == '\n') {
                    s[nema_index][index1] = ' ';
                }
            }
            nema_available = nema_index;
            nema_index = 1 - nema_index;      
            s[nema_index] = "";
        } else {
            s[nema_index] = s[nema_index] + char(c);
        }
    }

    String temp;
    if(nema_available != nema_available_last) {
        temp = s[nema_available];
        nema_available_last = nema_available;
    } else {
        temp = "";
    }
    outstr = outstr + i + "," + adc0 + "," + adc1 + "," + adc2 + "," + adc3 + "," + overrun + "," + margin + "," + temp ;  
    logfile.println(outstr);

    //if (i % 256 == 0){
    logfile.flush();
    //}
    i++;
    start_acq = 0;
    overrun = 0;
    margin = 0;
    digitalWrite(pin_grn_led, LOW);

}

void TCC0_Handler()
{
    Tcc* TC = (Tcc*) TCC0;       // get timer struct
    if (TC->INTFLAG.bit.OVF == 1) {  // A overflow caused the interrupt
        TC->INTFLAG.bit.OVF = 1;    // writing a one clears the flag ovf flag
        start_acq=1;
    }

}
