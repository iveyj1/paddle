
void setupGPS()
{
    //bsetExpander(GPS_ENABLE, 0);
    Serial1.begin(9600);
}

void setupGPS(HardwareSerial &ser) {
    ser.println("$PMTK314,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0*29"); // RMS message only
    ser.println("$PMTK220,100*2F"); // 100ms position solutions
    ser.println("$PMTK313,1*2E"); // enable SBAS
}

int16_t c;
String s[2];
uint8_t nema_index = 0;
uint8_t nema_available = 0;
uint8_t nema_available_last = 0;

void processGPS(HardwareSerial &uart, String &str) {
    while ((c = uart.read()) != -1) {
        if (char(c) == '$') {
          //Serial.println(s[nema_index]);
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

    if (nema_available != nema_available_last) {
    str = s[nema_available];
    nema_available_last = nema_available;
    } else {
        str = "";
    }
}

