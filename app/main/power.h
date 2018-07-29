/*
 * power.h
 *
 *  Created on: Feb 24, 2018
 *      Author: osboxes
 */

#ifndef MAIN_POWER_H_
#define MAIN_POWER_H_

// IO ports
#define KEEPALIVE 4
#define POWER_SW 34
#define BLINK 13


#define MIN_BATV 3.5f

void SetupPower();
void checkPowerSwitch();
void PowerTask(void *pvParameter);


#endif /* MAIN_POWER_H_ */
