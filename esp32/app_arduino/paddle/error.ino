// blink out an error code
void error(uint8_t errno) {
    Serial.println(String("Error number: ") + errno);
    while (1) {
        uint8_t i;
        for (i = 0; i < errno; i++) {
            digitalWrite(BLINK, HIGH);
            delay(50);
            digitalWrite(BLINK, LOW);
            delay(450);
        }

        delay(2000);
    //        checkShutdown();
    }
}


