// blink out an error code
void error(uint8_t errno) {
    Serial.println(String("Error number: ") + errno);
    while (1) {
        uint8_t i;
        for (i = 0; i < errno; i++) {
            digitalWrite(pin_red_led, HIGH);
            delay(50);
            digitalWrite(pin_red_led, LOW);
            delay(450);
        }

        delay(2000);
    //        checkShutdown();
    }
}


