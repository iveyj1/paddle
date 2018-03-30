#ifndef MAIN_EXPANDER_H_
#define MAIN_EXPANDER_H_

#define LED0 0x00u
#define LED1 0x01u
#define LED2 0x02u
#define LED3 0x03u
#define VA_3_3_ENABLE 0x04u
#define GPS_ENABLE 0x05u
#define SD_ENABLE 0x06u
#define AN_REFSEL 0x07u

#define EXPANDER_INIT_STATE (bmask(VA_3_3_ENABLE))
#define EXPANDER_INIT_DIR (0x00)
#define EXPANDER_INIT_POL (0x00)

#define bmask(mask) (1 << (mask))

//void SetupTCA9534();
//int BsetExpander(uint8_t bit, uint8_t val);
void SetupExpander();
int BsetExpander(uint8_t bit, uint8_t val);
int SetExpander(uint8_t val);
#endif
