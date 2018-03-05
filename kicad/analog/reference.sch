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
L analog-rescue:TEST-RESCUE-analog TP401
U 1 1 59CEDE1E
P 6300 3250
F 0 "TP401" H 6300 3550 50  0000 C BNN
F 1 "VREF" H 6300 3500 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 6300 3250 50  0001 C CNN
F 3 "" H 6300 3250 50  0001 C CNN
	1    6300 3250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3VA #PWR401
U 1 1 59CEDE4D
P 3150 3150
F 0 "#PWR401" H 3150 2950 50  0001 C CNN
F 1 "+3.3VA" H 3150 3350 50  0000 C CNN
F 2 "" H 3150 3150 50  0001 C CNN
F 3 "" H 3150 3150 50  0001 C CNN
	1    3150 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3250 3150 3150
Wire Wire Line
	6050 3250 6300 3250
Wire Wire Line
	6300 3250 6450 3250
Connection ~ 6300 3250
Text HLabel 6450 3250 2    60   Output ~ 0
VREF
$Comp
L paddle:REF5030 U401
U 1 1 59DEFBF3
P 4350 3400
F 0 "U401" H 4200 2600 60  0000 C CNN
F 1 "REF5030" H 4200 2500 60  0000 C CNN
F 2 "paddle:TSSOP-8_3x3mm_Pitch0.65mm" H 4300 2600 60  0001 C CNN
F 3 "" H 4300 2600 60  0001 C CNN
	1    4350 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR403
U 1 1 59DEFD98
P 4550 4150
F 0 "#PWR403" H 4550 3900 50  0001 C CNN
F 1 "GND" H 4550 4000 50  0000 C CNN
F 2 "" H 4550 4150 50  0001 C CNN
F 3 "" H 4550 4150 50  0001 C CNN
	1    4550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3250 3600 3250
Wire Wire Line
	3600 3250 3850 3250
$Comp
L device:C_Small C401
U 1 1 59DF1FFE
P 3600 3450
F 0 "C401" H 3610 3520 50  0000 L CNN
F 1 "10uF" H 3610 3370 50  0000 L CNN
F 2 "paddle:SMD_1206" H 3600 3450 50  0001 C CNN
F 3 "" H 3600 3450 50  0001 C CNN
	1    3600 3450
	-1   0    0    1   
$EndComp
Wire Wire Line
	3600 3250 3600 3350
Connection ~ 3600 3250
$Comp
L power:GND #PWR402
U 1 1 59DF20EE
P 3600 3600
F 0 "#PWR402" H 3600 3350 50  0001 C CNN
F 1 "GND" H 3600 3450 50  0000 C CNN
F 2 "" H 3600 3600 50  0001 C CNN
F 3 "" H 3600 3600 50  0001 C CNN
	1    3600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3550 3600 3600
$Comp
L device:C_Small C403
U 1 1 59DF26BA
P 5150 3900
F 0 "C403" H 5160 3970 50  0000 L CNN
F 1 "10uF" H 5160 3820 50  0000 L CNN
F 2 "paddle:SMD_1206" H 5150 3900 50  0001 C CNN
F 3 "" H 5150 3900 50  0001 C CNN
	1    5150 3900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR405
U 1 1 59DF271A
P 5150 4100
F 0 "#PWR405" H 5150 3850 50  0001 C CNN
F 1 "GND" H 5150 3950 50  0000 C CNN
F 2 "" H 5150 4100 50  0001 C CNN
F 3 "" H 5150 4100 50  0001 C CNN
	1    5150 4100
	1    0    0    -1  
$EndComp
$Comp
L paddle:R_US R401
U 1 1 59DF27CE
P 5150 3550
F 0 "R401" H 5175 3650 60  0000 C CNN
F 1 "1R0" H 5100 3450 60  0000 C CNN
F 2 "paddle:SMD_0805" H 5150 3200 60  0001 C CNN
F 3 "" H 5175 3650 60  0000 C CNN
	1    5150 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 3250 5150 3350
Wire Wire Line
	5150 3750 5150 3800
Wire Wire Line
	5150 4000 5150 4100
Connection ~ 5150 3250
$Comp
L device:C_Small C402
U 1 1 59DF29C2
P 4850 3850
F 0 "C402" H 4860 3920 50  0000 L CNN
F 1 "1uF" H 4860 3770 50  0000 L CNN
F 2 "paddle:SMD_0805" H 4850 3850 50  0001 C CNN
F 3 "" H 4850 3850 50  0001 C CNN
	1    4850 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3650 4850 3750
$Comp
L power:GND #PWR404
U 1 1 59DF29C9
P 4850 4000
F 0 "#PWR404" H 4850 3750 50  0001 C CNN
F 1 "GND" H 4850 3850 50  0000 C CNN
F 2 "" H 4850 4000 50  0001 C CNN
F 3 "" H 4850 4000 50  0001 C CNN
	1    4850 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 3950 4850 4000
$Comp
L device:C_Small C404
U 1 1 59DF2AEE
P 5500 3450
F 0 "C404" H 5510 3520 50  0000 L CNN
F 1 "1uF" H 5510 3370 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5500 3450 50  0001 C CNN
F 3 "" H 5500 3450 50  0001 C CNN
	1    5500 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR406
U 1 1 59DF2AF4
P 5500 3600
F 0 "#PWR406" H 5500 3350 50  0001 C CNN
F 1 "GND" H 5500 3450 50  0000 C CNN
F 2 "" H 5500 3600 50  0001 C CNN
F 3 "" H 5500 3600 50  0001 C CNN
	1    5500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 3550 5500 3600
Wire Wire Line
	5500 3250 5500 3350
Connection ~ 5500 3250
Wire Wire Line
	4850 3250 5150 3250
Wire Wire Line
	5150 3250 5500 3250
Wire Wire Line
	5500 3250 6050 3250
Wire Wire Line
	6050 3250 6050 3250
$EndSCHEMATC
