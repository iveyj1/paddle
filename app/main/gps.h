/*
 * gps.h
 *
 *  Created on: Feb 24, 2018
 *      Author: osboxes
 */

#ifndef MAIN_GPS_H_
#define MAIN_GPS_H_

void GpsTask();

extern SemaphoreHandle_t nmea_buffer_mutex;
extern uint8_t *nmea_buffer[2];
extern int nmea_buffer_num;
extern int nmea_available;

#endif /* MAIN_GPS_H_ */
