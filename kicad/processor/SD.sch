EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:paddle
LIBS:processor-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MICROSD M1
U 1 1 59CAB903
P 6800 3400
F 0 "M1" H 6800 3400 45  0001 C CNN
F 1 "MICROSD" H 6800 3400 45  0001 C CNN
F 2 "adafruit:MICROSD" H 6830 3550 20  0001 C CNN
F 3 "" H 6800 3400 60  0001 C CNN
	1    6800 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR058
U 1 1 59CAB909
P 6000 4300
F 0 "#PWR058" H 6000 4050 50  0001 C CNN
F 1 "GND" H 6000 4150 50  0000 C CNN
F 2 "" H 6000 4300 50  0001 C CNN
F 3 "" H 6000 4300 50  0001 C CNN
	1    6000 4300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR059
U 1 1 59CAB90F
P 5100 3350
F 0 "#PWR059" H 5100 3200 50  0001 C CNN
F 1 "+3.3V" H 5100 3490 50  0000 C CNN
F 2 "" H 5100 3350 50  0001 C CNN
F 3 "" H 5100 3350 50  0001 C CNN
	1    5100 3350
	1    0    0    -1  
$EndComp
NoConn ~ 6100 2700
NoConn ~ 6100 2800
NoConn ~ 6100 3500
NoConn ~ 6100 3600
$Comp
L C_Small C14
U 1 1 59CAB919
P 5750 4000
F 0 "C14" H 5760 4070 50  0000 L CNN
F 1 "0.1uF" H 5760 3920 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5750 4000 50  0001 C CNN
F 3 "" H 5750 4000 50  0001 C CNN
	1    5750 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR060
U 1 1 59CAB920
P 5750 4150
F 0 "#PWR060" H 5750 3900 50  0001 C CNN
F 1 "GND" H 5750 4000 50  0000 C CNN
F 2 "" H 5750 4150 50  0001 C CNN
F 3 "" H 5750 4150 50  0001 C CNN
	1    5750 4150
	1    0    0    -1  
$EndComp
$Comp
L C_Small C13
U 1 1 59CAB926
P 5300 4000
F 0 "C13" H 5310 4070 50  0000 L CNN
F 1 "10uF" H 5310 3920 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5300 4000 50  0001 C CNN
F 3 "" H 5300 4000 50  0001 C CNN
	1    5300 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR061
U 1 1 59CAB92D
P 5300 4150
F 0 "#PWR061" H 5300 3900 50  0001 C CNN
F 1 "GND" H 5300 4000 50  0000 C CNN
F 2 "" H 5300 4150 50  0001 C CNN
F 3 "" H 5300 4150 50  0001 C CNN
	1    5300 4150
	1    0    0    -1  
$EndComp
Connection ~ 5300 3800
Connection ~ 5750 3800
Wire Wire Line
	5750 3800 5750 3900
Wire Wire Line
	5300 4100 5300 4150
Wire Wire Line
	5750 4100 5750 4150
Wire Wire Line
	5300 3800 5300 3900
Wire Wire Line
	5100 3800 6100 3800
Connection ~ 6000 4100
Wire Wire Line
	6100 3900 6000 3900
Connection ~ 6000 4200
Wire Wire Line
	6100 4100 6000 4100
Wire Wire Line
	6000 3900 6000 4300
Wire Wire Line
	6000 4200 6100 4200
Text HLabel 5950 3100 0    60   Output ~ 0
DATA_OUT
Text HLabel 5950 3200 0    60   Input ~ 0
DATA_IN
Text HLabel 5950 3300 0    60   Input ~ 0
SCLK
Text HLabel 5950 3400 0    60   Input ~ 0
CS
Wire Wire Line
	5100 3350 5100 3400
$Comp
L Q_PMOS_GSD Q7
U 1 1 59CAC052
P 5000 3600
F 0 "Q7" H 5200 3650 50  0000 L CNN
F 1 "DMG3415U" H 5200 3550 50  0000 L CNN
F 2 "paddle:SOT-23" H 5200 3700 50  0001 C CNN
F 3 "" H 5000 3600 50  0001 C CNN
	1    5000 3600
	1    0    0    1   
$EndComp
$Comp
L R_US R23
U 1 1 59CAC2F3
P 4650 3400
F 0 "R23" H 4675 3500 60  0000 C CNN
F 1 "1MEG" H 4675 3300 60  0000 C CNN
F 2 "paddle:R_0603" H 4650 3050 60  0001 C CNN
F 3 "" H 4675 3500 60  0000 C CNN
	1    4650 3400
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR062
U 1 1 59CAC2FA
P 4650 3150
F 0 "#PWR062" H 4650 3000 50  0001 C CNN
F 1 "+3.3V" H 4650 3290 50  0000 C CNN
F 2 "" H 4650 3150 50  0001 C CNN
F 3 "" H 4650 3150 50  0001 C CNN
	1    4650 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3150 4650 3200
Wire Wire Line
	4450 3600 4800 3600
Connection ~ 4650 3600
Text HLabel 4450 3600 0    60   Input ~ 0
ENABLE*
Wire Wire Line
	5950 3100 6100 3100
Wire Wire Line
	6100 3200 5950 3200
Wire Wire Line
	5950 3300 6100 3300
Wire Wire Line
	6100 3400 5950 3400
$Comp
L PWR_FLAG #FLG063
U 1 1 59FFCAED
P 5600 3800
F 0 "#FLG063" H 5600 3875 50  0001 C CNN
F 1 "PWR_FLAG" H 5600 3950 50  0000 C CNN
F 2 "" H 5600 3800 50  0001 C CNN
F 3 "" H 5600 3800 50  0001 C CNN
	1    5600 3800
	1    0    0    -1  
$EndComp
Connection ~ 5600 3800
$EndSCHEMATC
