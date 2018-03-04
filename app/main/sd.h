/*
 * sd.h
 *
 *  Created on: Feb 28, 2018
 *      Author: osboxes
 */
#ifndef MAIN_SD_H_
#define MAIN_SD_H_
extern FILE *acqfile;

void CloseAcqFile(void);
int OpenNextAcqFile(void);

#endif
