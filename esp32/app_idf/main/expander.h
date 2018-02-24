#ifndef __expander.h__
#define __expander.h__

void setupExpander();
uint8_t testWire(uint8_t address);
uint8_t writeTCA9534A(uint8_t address, uint8_t port, uint8_t val);
int bsetExpander(uint8_t bit, uint8_t val);

#endif
