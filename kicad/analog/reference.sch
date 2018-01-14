EESchema Schematic File Version 4
LIBS:analog-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
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
L device:C_Small C406
U 1 1 59CEDE0B
P 7750 2950
F 0 "C406" H 7760 3020 50  0000 L CNN
F 1 "0.1uF" H 7760 2870 50  0000 L CNN
F 2 "paddle:SMD_0805" H 7750 2950 50  0001 C CNN
F 3 "" H 7750 2950 50  0001 C CNN
	1    7750 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR413
U 1 1 59CEDE12
P 7750 3100
F 0 "#PWR413" H 7750 2850 50  0001 C CNN
F 1 "GND" H 7750 2950 50  0000 C CNN
F 2 "" H 7750 3100 50  0001 C CNN
F 3 "" H 7750 3100 50  0001 C CNN
	1    7750 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR412
U 1 1 59CEDE18
P 7300 3950
F 0 "#PWR412" H 7300 3700 50  0001 C CNN
F 1 "GND" H 7300 3800 50  0000 C CNN
F 2 "" H 7300 3950 50  0001 C CNN
F 3 "" H 7300 3950 50  0001 C CNN
	1    7300 3950
	1    0    0    -1  
$EndComp
$Comp
L analog-rescue:TEST-RESCUE-analog TP401
U 1 1 59CEDE1E
P 8150 3500
F 0 "TP401" H 8150 3800 50  0000 C BNN
F 1 "VREF" H 8150 3750 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 8150 3500 50  0001 C CNN
F 3 "" H 8150 3500 50  0001 C CNN
	1    8150 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR409
U 1 1 59CEDE2C
P 5950 4050
F 0 "#PWR409" H 5950 3800 50  0001 C CNN
F 1 "GND" H 5950 3900 50  0000 C CNN
F 2 "" H 5950 4050 50  0001 C CNN
F 3 "" H 5950 4050 50  0001 C CNN
	1    5950 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR411
U 1 1 59CEDE47
P 7300 2600
F 0 "#PWR411" H 7300 2400 50  0001 C CNN
F 1 "+3.3VA" H 7300 2800 50  0000 C CNN
F 2 "" H 7300 2600 50  0001 C CNN
F 3 "" H 7300 2600 50  0001 C CNN
	1    7300 2600
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR401
U 1 1 59CEDE4D
P 1500 3250
F 0 "#PWR401" H 1500 3050 50  0001 C CNN
F 1 "+3.3VA" H 1500 3450 50  0000 C CNN
F 2 "" H 1500 3250 50  0001 C CNN
F 3 "" H 1500 3250 50  0001 C CNN
	1    1500 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3350 1500 3250
Wire Wire Line
	7600 3600 8200 3600
Connection ~ 7700 3600
Connection ~ 7300 2750
Wire Wire Line
	7300 3800 7300 3950
Wire Wire Line
	7300 2750 7750 2750
Wire Wire Line
	7750 2750 7750 2850
Wire Wire Line
	7750 3050 7750 3100
Wire Wire Line
	7300 2600 7300 3400
Wire Wire Line
	7700 4200 7700 3600
Wire Wire Line
	7000 4200 7700 4200
Wire Wire Line
	7000 3700 7000 4200
Wire Wire Line
	8150 3600 8150 3500
Connection ~ 8150 3600
Text HLabel 8200 3600 2    60   Output ~ 0
VREF
$Comp
L paddle:REF5030 U401
U 1 1 59DEFBF3
P 2700 3500
F 0 "U401" H 2550 2700 60  0000 C CNN
F 1 "REF5030" H 2550 2600 60  0000 C CNN
F 2 "paddle:TSSOP-8_3x3mm_Pitch0.65mm" H 2650 2700 60  0001 C CNN
F 3 "" H 2650 2700 60  0001 C CNN
	1    2700 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR403
U 1 1 59DEFD98
P 2900 4250
F 0 "#PWR403" H 2900 4000 50  0001 C CNN
F 1 "GND" H 2900 4100 50  0000 C CNN
F 2 "" H 2900 4250 50  0001 C CNN
F 3 "" H 2900 4250 50  0001 C CNN
	1    2900 4250
	1    0    0    -1  
$EndComp
$Comp
L paddle:TS5A3160 U402
U 1 1 59DF0BBD
P 5950 3500
F 0 "U402" H 5700 4000 50  0000 R CNN
F 1 "TS5A3160" H 5700 3900 50  0000 R CNN
F 2 "" H 6000 3250 50  0001 L CNN
F 3 "" H 6050 3500 50  0001 C CNN
	1    5950 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR408
U 1 1 59DF0C9C
P 5950 3000
F 0 "#PWR408" H 5950 2800 50  0001 C CNN
F 1 "+3.3VA" H 5950 3200 50  0000 C CNN
F 2 "" H 5950 3000 50  0001 C CNN
F 3 "" H 5950 3000 50  0001 C CNN
	1    5950 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 3500 7000 3500
Wire Wire Line
	5500 3650 5350 3650
Wire Wire Line
	5350 3650 5350 3750
$Comp
L power:+3.3VA #PWR407
U 1 1 59DF172E
P 4750 3650
F 0 "#PWR407" H 4750 3450 50  0001 C CNN
F 1 "+3.3VA" H 4750 3850 50  0000 C CNN
F 2 "" H 4750 3650 50  0001 C CNN
F 3 "" H 4750 3650 50  0001 C CNN
	1    4750 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3350 2200 3350
Wire Wire Line
	5950 4000 5950 4050
$Comp
L device:C_Small C401
U 1 1 59DF1FFE
P 1950 3550
F 0 "C401" H 1960 3620 50  0000 L CNN
F 1 "10uF" H 1960 3470 50  0000 L CNN
F 2 "paddle:SMD_1206" H 1950 3550 50  0001 C CNN
F 3 "" H 1950 3550 50  0001 C CNN
	1    1950 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3350 1950 3450
Connection ~ 1950 3350
$Comp
L power:GND #PWR402
U 1 1 59DF20EE
P 1950 3700
F 0 "#PWR402" H 1950 3450 50  0001 C CNN
F 1 "GND" H 1950 3550 50  0000 C CNN
F 2 "" H 1950 3700 50  0001 C CNN
F 3 "" H 1950 3700 50  0001 C CNN
	1    1950 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 3650 1950 3700
$Comp
L device:C_Small C403
U 1 1 59DF26BA
P 3500 4000
F 0 "C403" H 3510 4070 50  0000 L CNN
F 1 "10uF" H 3510 3920 50  0000 L CNN
F 2 "paddle:SMD_1206" H 3500 4000 50  0001 C CNN
F 3 "" H 3500 4000 50  0001 C CNN
	1    3500 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR405
U 1 1 59DF271A
P 3500 4200
F 0 "#PWR405" H 3500 3950 50  0001 C CNN
F 1 "GND" H 3500 4050 50  0000 C CNN
F 2 "" H 3500 4200 50  0001 C CNN
F 3 "" H 3500 4200 50  0001 C CNN
	1    3500 4200
	1    0    0    -1  
$EndComp
$Comp
L paddle:R_US R401
U 1 1 59DF27CE
P 3500 3650
F 0 "R401" H 3525 3750 60  0000 C CNN
F 1 "1R0" H 3450 3550 60  0000 C CNN
F 2 "paddle:SMD_0805" H 3500 3300 60  0001 C CNN
F 3 "" H 3525 3750 60  0000 C CNN
	1    3500 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 3350 3500 3450
Wire Wire Line
	3500 3850 3500 3900
Wire Wire Line
	3500 4100 3500 4200
Connection ~ 3500 3350
$Comp
L device:C_Small C402
U 1 1 59DF29C2
P 3200 3950
F 0 "C402" H 3210 4020 50  0000 L CNN
F 1 "1uF" H 3210 3870 50  0000 L CNN
F 2 "paddle:SMD_0805" H 3200 3950 50  0001 C CNN
F 3 "" H 3200 3950 50  0001 C CNN
	1    3200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3750 3200 3850
$Comp
L power:GND #PWR404
U 1 1 59DF29C9
P 3200 4100
F 0 "#PWR404" H 3200 3850 50  0001 C CNN
F 1 "GND" H 3200 3950 50  0000 C CNN
F 2 "" H 3200 4100 50  0001 C CNN
F 3 "" H 3200 4100 50  0001 C CNN
	1    3200 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 4050 3200 4100
$Comp
L device:C_Small C404
U 1 1 59DF2AEE
P 3850 3550
F 0 "C404" H 3860 3620 50  0000 L CNN
F 1 "1uF" H 3860 3470 50  0000 L CNN
F 2 "paddle:SMD_0805" H 3850 3550 50  0001 C CNN
F 3 "" H 3850 3550 50  0001 C CNN
	1    3850 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR406
U 1 1 59DF2AF4
P 3850 3700
F 0 "#PWR406" H 3850 3450 50  0001 C CNN
F 1 "GND" H 3850 3550 50  0000 C CNN
F 2 "" H 3850 3700 50  0001 C CNN
F 3 "" H 3850 3700 50  0001 C CNN
	1    3850 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3650 3850 3700
Wire Wire Line
	3850 3350 3850 3450
Connection ~ 3850 3350
Text HLabel 6600 3250 2    60   Input ~ 0
AN_REFSEL
Wire Wire Line
	6400 3250 6600 3250
$Comp
L power:GND #PWR410
U 1 1 59F5E52A
P 6750 3900
F 0 "#PWR410" H 6750 3650 50  0001 C CNN
F 1 "GND" H 6750 3750 50  0000 C CNN
F 2 "" H 6750 3900 50  0001 C CNN
F 3 "" H 6750 3900 50  0001 C CNN
	1    6750 3900
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C405
U 1 1 59F5E530
P 6750 3750
F 0 "C405" H 6760 3820 50  0000 L CNN
F 1 "0.001uF" H 6760 3670 50  0000 L CNN
F 2 "paddle:SMD_0805" H 6750 3750 50  0001 C CNN
F 3 "" H 6750 3750 50  0001 C CNN
	1    6750 3750
	-1   0    0    1   
$EndComp
$Comp
L paddle:LTC2052 U201
U 2 1 59F5E559
P 7300 3600
F 0 "U201" H 7300 3800 50  0000 L CNN
F 1 "LTC2052" H 7300 3400 50  0000 L CNN
F 2 "" H 7300 3600 50  0001 C CNN
F 3 "" H 7300 3600 50  0001 C CNN
	2    7300 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3500 6750 3650
Wire Wire Line
	6750 3850 6750 3900
$Comp
L paddle:R_US R402
U 1 1 59F5E53D
P 4400 3350
F 0 "R402" H 4425 3450 60  0000 C CNN
F 1 "20k" H 4350 3250 60  0000 C CNN
F 2 "paddle:SMD_0805" H 4400 3000 60  0001 C CNN
F 3 "" H 4425 3450 60  0000 C CNN
	1    4400 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3200 3350 4200 3350
Wire Wire Line
	4600 3350 5500 3350
Connection ~ 6750 3500
Wire Wire Line
	4750 3750 4750 3650
$Comp
L paddle:R_US R403
U 1 1 59F968E9
P 5050 3750
F 0 "R403" H 5075 3850 60  0000 C CNN
F 1 "20k" H 5000 3650 60  0000 C CNN
F 2 "paddle:SMD_0805" H 5050 3400 60  0001 C CNN
F 3 "" H 5075 3850 60  0000 C CNN
	1    5050 3750
	-1   0    0    1   
$EndComp
Wire Wire Line
	4850 3750 4750 3750
Wire Wire Line
	5350 3750 5250 3750
$EndSCHEMATC
