

void setupExpander()
{
    int address = EXPANDER_ADDR;
    int error;
    error = writeWire(address, TCA9534_DIR_PORT, 0x00);  // set direction all outs
    error = writeWire(address, TCA9534_POL_PORT, 0x00);  // set initial polarity all noninverting
    error = writeWire(address, TCA9534_OUT_PORT, 0x60);  // set initial all power and LEDs off
}

uint8_t testWire(uint8_t address)
{
    Wire.beginTransmission(address);
    return(Wire.endTransmission());
}

uint8_t addressWire(uint8_t address, uint8_t port)
{
    Wire.beginTransmission(address);
    Wire.write(port); // port register
    return(Wire.endTransmission());
}

uint8_t writeWire(uint8_t address, uint8_t port, uint8_t val)
{
    Wire.beginTransmission(address);
    Wire.write(port); // port register
    Wire.write(val); // value
    return(Wire.endTransmission());
}

void bsetExpander(uint8_t bit, uint8_t val)
{
    int address = EXPANDER_ADDR;
    int error;
    error = testWire(address);
 
    if (error == 0)
    {
        uint8_t c;
        addressWire(address, TCA9534_OUT_PORT);    
        Wire.requestFrom(address, 1);
        if(Wire.available())
        {
            c = Wire.read();
            //Serial.print("\nc: ");
            //Serial.print(c, HEX);
            //Serial.print(byte(c | bmask(bit)),HEX);
            //Serial.println(byte(c & ~bmask(bit)),HEX);
            
            if(val)
            {
                writeWire(address, TCA9534_OUT_PORT, byte(c | bmask(bit))); // set bit   
            } else
            {
                writeWire(address, TCA9534_OUT_PORT, byte(c & ~bmask(bit))); // clear bit   
            }
            error = Wire.endTransmission();
        }
    }
}

