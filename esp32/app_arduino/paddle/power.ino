void setupPower()
{
    pinMode(KEEPALIVE, OUTPUT);
    pinMode(POWER_SW, INPUT);
    digitalWrite(KEEPALIVE, HIGH);
}

void checkPowerSwitch()
{
    if(digitalRead(POWER_SW) == LOW)
    {
        int i;
        logfile.close();
        delay(50);
        for(i=0; i<10; i++)
        {
            delay(100);
            digitalWrite(BLINK, HIGH);
            delay(100);
            digitalWrite(BLINK, LOW);         
        }
        digitalWrite(KEEPALIVE, LOW);
    }
}


