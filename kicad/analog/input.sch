EESchema Schematic File Version 4
LIBS:analog-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
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
L analog-rescue:CONN_02X05-RESCUE-analog J301
U 1 1 59CECF11
P 5300 3050
F 0 "J301" H 5300 3350 50  0000 C CNN
F 1 "CONN_02X05" H 5300 2750 50  0000 C CNN
F 2 "paddle:header-0.050-10-pin-through-hole" H 5300 1850 50  0001 C CNN
F 3 "" H 5300 1850 50  0001 C CNN
	1    5300 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR0301
U 1 1 59CECF30
P 4900 2800
F 0 "#PWR0301" H 4900 2600 50  0001 C CNN
F 1 "+3.3VA" H 4900 3000 50  0000 C CNN
F 2 "" H 4900 2800 50  0001 C CNN
F 3 "" H 4900 2800 50  0001 C CNN
	1    4900 2800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0304
U 1 1 59CECF36
P 5700 3350
F 0 "#PWR0304" H 5700 3100 50  0001 C CNN
F 1 "GND" H 5700 3200 50  0000 C CNN
F 2 "" H 5700 3350 50  0001 C CNN
F 3 "" H 5700 3350 50  0001 C CNN
	1    5700 3350
	1    0    0    -1  
$EndComp
$Comp
L paddle:SP3003-04 U301
U 1 1 59CECF3F
P 6050 4350
F 0 "U301" H 5800 4900 60  0000 C CNN
F 1 "SP3003-04" H 6200 4900 60  0000 C CNN
F 2 "paddle:SMD_SC70-6" H 6050 3400 60  0001 C CNN
F 3 "" H 6050 3400 60  0001 C CNN
	1    6050 4350
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR0302
U 1 1 59CECF46
P 5450 4050
F 0 "#PWR0302" H 5450 3900 50  0001 C CNN
F 1 "+3.3V" H 5450 4190 50  0000 C CNN
F 2 "" H 5450 4050 50  0001 C CNN
F 3 "" H 5450 4050 50  0001 C CNN
	1    5450 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0303
U 1 1 59CECF4C
P 5450 4600
F 0 "#PWR0303" H 5450 4350 50  0001 C CNN
F 1 "GND" H 5450 4450 50  0000 C CNN
F 2 "" H 5450 4600 50  0001 C CNN
F 3 "" H 5450 4600 50  0001 C CNN
	1    5450 4600
	1    0    0    -1  
$EndComp
$Comp
L paddle:R_US R301
U 1 1 59CF0D9D
P 6050 2850
F 0 "R301" H 6100 3250 60  0000 C CNN
F 1 "10k 0.1%" H 6500 3250 60  0000 C CNN
F 2 "paddle:R_0805" H 6050 2500 60  0001 C CNN
F 3 "" H 6075 2950 60  0000 C CNN
	1    6050 2850
	1    0    0    -1  
$EndComp
$Comp
L paddle:R_US R302
U 1 1 59CF0E0C
P 6050 2950
F 0 "R302" H 6100 3350 60  0000 C CNN
F 1 "10k 0.1%" H 6500 3350 60  0000 C CNN
F 2 "paddle:R_0805" H 6050 2600 60  0001 C CNN
F 3 "" H 6075 3050 60  0000 C CNN
	1    6050 2950
	1    0    0    -1  
$EndComp
$Comp
L paddle:R_US R303
U 1 1 59CF0E2B
P 6050 3050
F 0 "R303" H 6100 3450 60  0000 C CNN
F 1 "10k 0.1%" H 6500 3450 60  0000 C CNN
F 2 "paddle:R_0805" H 6050 2700 60  0001 C CNN
F 3 "" H 6075 3150 60  0000 C CNN
	1    6050 3050
	1    0    0    -1  
$EndComp
$Comp
L paddle:R_US R304
U 1 1 59CF0E51
P 6050 3150
F 0 "R304" H 6100 3550 60  0000 C CNN
F 1 "10k 0.1%" H 6500 3550 60  0000 C CNN
F 2 "paddle:R_0805" H 6050 2800 60  0001 C CNN
F 3 "" H 6075 3250 60  0000 C CNN
	1    6050 3150
	1    0    0    -1  
$EndComp
Text HLabel 7800 2850 2    60   Input ~ 0
IN_0
Text HLabel 7800 2950 2    60   Input ~ 0
IN_1
Text HLabel 7800 3050 2    60   Input ~ 0
IN_2
Text HLabel 7800 3150 2    60   Input ~ 0
IN_3
Wire Wire Line
	4900 2850 5050 2850
Wire Wire Line
	5700 3250 5550 3250
Wire Wire Line
	5550 3150 5850 3150
Wire Wire Line
	5550 3050 5850 3050
Wire Wire Line
	5550 2950 5850 2950
Wire Wire Line
	5550 2850 5850 2850
Wire Wire Line
	4900 2800 4900 2850
Wire Wire Line
	5700 3250 5700 3350
Wire Wire Line
	5550 4150 5450 4150
Wire Wire Line
	5450 4150 5450 4050
Wire Wire Line
	5550 4600 5450 4600
Wire Wire Line
	6550 4050 6900 4050
Wire Wire Line
	6550 4250 7050 4250
Wire Wire Line
	6550 4450 7200 4450
Wire Wire Line
	6550 4650 7350 4650
Wire Wire Line
	6250 2850 6900 2850
Wire Wire Line
	6250 2950 7050 2950
Wire Wire Line
	6250 3050 7200 3050
Wire Wire Line
	6250 3150 7350 3150
Wire Wire Line
	6900 4050 6900 2850
Connection ~ 6900 2850
Wire Wire Line
	7050 4250 7050 2950
Connection ~ 7050 2950
Wire Wire Line
	7200 4450 7200 3050
Connection ~ 7200 3050
Wire Wire Line
	7350 4650 7350 3150
Connection ~ 7350 3150
NoConn ~ 5050 2950
NoConn ~ 5050 3050
NoConn ~ 5050 3150
NoConn ~ 5050 3250
Wire Wire Line
	6900 2850 7800 2850
Wire Wire Line
	7050 2950 7800 2950
Wire Wire Line
	7200 3050 7800 3050
Wire Wire Line
	7350 3150 7800 3150
$EndSCHEMATC
