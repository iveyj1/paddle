

void setupExpander()
{
    int address = EXPANDER_ADDR;
    int error;
    error = writeTCA9534A(address, TCA9534_DIR_PORT, 0x00);  // set direction all outs
    error = writeTCA9534A(address, TCA9534_POL_PORT, 0x00);  // set initial polarity all noninverting
    error = writeTCA9534A(address, TCA9534_OUT_PORT, 0x60);  // set initial all power and LEDs off
}

uint8_t testWire(uint8_t address)
{
    Wire.beginTransmission(address);
    return(Wire.endTransmission());
}


uint8_t writeTCA9534A(uint8_t address, uint8_t port, uint8_t val)
{
    Wire.beginTransmission(address);
    Wire.write(port); // port register
    Wire.write(val); // value
    return(Wire.endTransmission());
}

int bsetExpander(uint8_t bit, uint8_t val)
{
    int address = EXPANDER_ADDR;
    int error;
    if(error = testWire(address))
    {
        Serial.println("error accessing port expander");
        return error;
    }

    if (error == 0)
    {
        uint8_t c;
        Wire.beginTransmission(address);// address of port expander
        Wire.write(TCA9534_OUT_PORT);   // Set up to access output port in next read
        
        if(error = Wire.endTransmission())
        {
            Serial.println("error writing to port expander");
            return error;
        }
        Wire.requestFrom(address, 1);
        if(Wire.available())
        {
            c = Wire.read();
            if(val)
            {
                writeTCA9534A(address, TCA9534_OUT_PORT, byte(c | bmask(bit))); // set selected bit   
            } else
            {
                writeTCA9534A(address, TCA9534_OUT_PORT, byte(c & ~bmask(bit))); // clear selected bit   
            }
        } else
        {
            Serial.println("error reading from port expander");

        }
    }
    return error;
}
#if 0
testWire(0x38);
Wire.beginTransmission(0x38);// address of port expander
Wire.write(0x01);   // Set up to access output port in next read
Wire.endTransmission();

Wire.requestFrom(0x38, 1);
if(Wire.available())
{
    c = Wire.read();
}
Wire.beginTransmission(0x38);// address of port expander
Wire.write(0x01);
Wire.write(c ^ 1);   // 
Wire.endTransmission();
#endif

#if 0
// basic write to slave example
Wire.beginTransmission(0x38);   // Select address of I2C device to communicate with
Wire.write(0x01);               // Select TCA9534A port register to write to
Wire.write(0x55);               // write data value
error = Wire.endTransmission(); // execute write - 0 == success, 2 == nak 


// basic read from slave example
Wire.beginTransmission(0x38);      // I2C address of device
Wire.write(0x01); // port register // TCA9534 port to read from (applies to all future reads until another port is selected)
error = Wire.endTransmission();    // write to device

Wire.requestFrom(0x38, 1);         // request 1 byte of data from device
if(Wire.available())
{
    c = Wire.read();               // read requested data
}

#endif

