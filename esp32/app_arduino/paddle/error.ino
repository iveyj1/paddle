// blink out an error code
void showError(int errnum) 
{
    Serial.println(String("Error number: ") + errno);
    while (1) {
        uint8_t i;
        for (i = 0; i < errnum; i++) {
            digitalWrite(BLINK, HIGH);
            delay(50);
            digitalWrite(BLINK, LOW);
            delay(450);
        }

        delay(2000);
    //        checkShutdown();
    }
}


