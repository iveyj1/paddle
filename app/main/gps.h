/*
 * gps.h
 *
 *  Created on: Feb 24, 2018
 *      Author: osboxes
 */

#ifndef MAIN_GPS_H_
#define MAIN_GPS_H_

#define NMEA_BUF_LEN 256

extern SemaphoreHandle_t nmea_buffer_mutex;
extern uint8_t *nmea_buffer[2];
extern int nmea_buffer_num;
extern int nmea_available;

int GetLastNMEAMessage(char* buffer, size_t bufsize, int peek);
void GpsTask();

#endif /* MAIN_GPS_H_ */
