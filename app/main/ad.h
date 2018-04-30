/*
 * ad.h
 *
 *  Created on: Mar 25, 2018
 *      Author: osboxes
 */

#ifndef MAIN_AD_H_
#define MAIN_AD_H_

void ADTask(void *pvParameter);
void ADStartAcquire();
void ADStopAcquire();
int ADAcquireInProgress();

#endif /* MAIN_AD_H_ */
