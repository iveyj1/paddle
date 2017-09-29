EESchema Schematic File Version 2
LIBS:paddle
LIBS:adafruit
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:diode
LIBS:switches
LIBS:paddle-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 11
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
L FGPMMOPA6H U701
U 1 1 59CAA04C
P 6050 4200
F 0 "U701" H 5450 4850 60  0000 C CNN
F 1 "FGPMMOPA6H GPS" H 6050 4850 60  0000 C CNN
F 2 "paddle:FGPMMOPA6H" H 5725 4100 60  0001 C CNN
F 3 "" H 5725 4100 60  0001 C CNN
	1    6050 4200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR080
U 1 1 59CAA053
P 6900 4000
F 0 "#PWR080" H 6900 3750 50  0001 C CNN
F 1 "GND" H 6900 3850 50  0000 C CNN
F 2 "" H 6900 4000 50  0001 C CNN
F 3 "" H 6900 4000 50  0001 C CNN
	1    6900 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR081
U 1 1 59CAA059
P 6950 4600
F 0 "#PWR081" H 6950 4350 50  0001 C CNN
F 1 "GND" H 6950 4450 50  0000 C CNN
F 2 "" H 6950 4600 50  0001 C CNN
F 3 "" H 6950 4600 50  0001 C CNN
	1    6950 4600
	1    0    0    -1  
$EndComp
NoConn ~ 6800 3750
NoConn ~ 6800 3950
NoConn ~ 6800 4050
NoConn ~ 6800 4150
NoConn ~ 6800 4250
NoConn ~ 5300 4250
NoConn ~ 5300 4350
NoConn ~ 5300 4150
NoConn ~ 6800 4350
NoConn ~ 6800 4650
$Comp
L LED LED?
U 1 1 59CAA06A
P 4550 5400
AR Path="/59C7A5C1/59CAA06A" Ref="LED?"  Part="1" 
AR Path="/59CAA06A" Ref="LED?"  Part="1" 
AR Path="/59CA9ED7/59CAA06A" Ref="LED701"  Part="1" 
F 0 "LED701" H 4500 5200 45  0000 L BNN
F 1 "LED" H 4500 5100 45  0000 L BNN
F 2 "paddle:SMD_D_0805" H 4350 5430 20  0001 C CNN
F 3 "" V 4500 5400 60  0001 C CNN
	1    4550 5400
	0    1    1    0   
$EndComp
$Comp
L R_US R704
U 1 1 59CAA071
P 4550 5000
F 0 "R704" H 4575 5100 60  0000 C CNN
F 1 "330" H 4575 4900 60  0000 C CNN
F 2 "paddle:SMD_0805" H 4550 4650 60  0001 C CNN
F 3 "" H 4575 5100 60  0000 C CNN
	1    4550 5000
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR082
U 1 1 59CAA078
P 4550 5600
F 0 "#PWR082" H 4550 5350 50  0001 C CNN
F 1 "GND" H 4550 5450 50  0000 C CNN
F 2 "" H 4550 5600 50  0001 C CNN
F 3 "" H 4550 5600 50  0001 C CNN
	1    4550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3950 4950 3950
Wire Wire Line
	6950 4550 6800 4550
Wire Wire Line
	6950 4600 6950 4550
Wire Wire Line
	6900 3850 6900 4000
Wire Wire Line
	6800 3850 6900 3850
Wire Wire Line
	5200 4450 5300 4450
Wire Wire Line
	5300 3850 5250 3850
Wire Wire Line
	4550 5200 4550 5250
Wire Wire Line
	4550 5550 4550 5600
Wire Wire Line
	5300 4150 4550 4150
Wire Wire Line
	6800 4450 7100 4450
Wire Wire Line
	5050 4050 5300 4050
Wire Wire Line
	4550 4150 4550 4800
Wire Wire Line
	3350 2800 3350 3150
$Comp
L Q_PMOS_GSD Q701
U 1 1 59CAD4AE
P 3250 3350
F 0 "Q701" H 3450 3400 50  0000 L CNN
F 1 "DMG3415U" H 3450 3300 50  0000 L CNN
F 2 "paddle:SOT-23" H 3450 3450 50  0001 C CNN
F 3 "" H 3250 3350 50  0001 C CNN
	1    3250 3350
	1    0    0    1   
$EndComp
$Comp
L +3.3V #PWR083
U 1 1 59CB0B2A
P 3350 2800
F 0 "#PWR083" H 3350 2650 50  0001 C CNN
F 1 "+3.3V" H 3350 2940 50  0000 C CNN
F 2 "" H 3350 2800 50  0001 C CNN
F 3 "" H 3350 2800 50  0001 C CNN
	1    3350 2800
	1    0    0    -1  
$EndComp
$Comp
L C_Small C702
U 1 1 59CB0B30
P 4250 3950
F 0 "C702" H 4260 4020 50  0000 L CNN
F 1 "0.01uF" H 4260 3870 50  0000 L CNN
F 2 "paddle:SMD_0805" H 4250 3950 50  0001 C CNN
F 3 "" H 4250 3950 50  0001 C CNN
	1    4250 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR084
U 1 1 59CB0B37
P 4250 4100
F 0 "#PWR084" H 4250 3850 50  0001 C CNN
F 1 "GND" H 4250 3950 50  0000 C CNN
F 2 "" H 4250 4100 50  0001 C CNN
F 3 "" H 4250 4100 50  0001 C CNN
	1    4250 4100
	1    0    0    -1  
$EndComp
$Comp
L C_Small C701
U 1 1 59CB0B3D
P 4000 3950
F 0 "C701" H 4010 4020 50  0000 L CNN
F 1 "10uF" H 4010 3870 50  0000 L CNN
F 2 "paddle:SMD_1206" H 4000 3950 50  0001 C CNN
F 3 "" H 4000 3950 50  0001 C CNN
	1    4000 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR085
U 1 1 59CB0B44
P 4000 4100
F 0 "#PWR085" H 4000 3850 50  0001 C CNN
F 1 "GND" H 4000 3950 50  0000 C CNN
F 2 "" H 4000 4100 50  0001 C CNN
F 3 "" H 4000 4100 50  0001 C CNN
	1    4000 4100
	1    0    0    -1  
$EndComp
Connection ~ 4250 3750
Wire Wire Line
	4250 3750 4250 3850
Connection ~ 4000 3750
Wire Wire Line
	4000 3850 4000 3750
Wire Wire Line
	4000 4050 4000 4100
Wire Wire Line
	4250 4050 4250 4100
Wire Wire Line
	3350 3750 3350 3550
Text HLabel 2950 3350 0    60   Input ~ 0
GPS_EN*
Wire Wire Line
	2950 3350 3050 3350
$Comp
L R_US R701
U 1 1 59CB0CA3
P 3000 3050
F 0 "R701" H 3025 3150 60  0000 C CNN
F 1 "1MEG" H 3025 2950 60  0000 C CNN
F 2 "paddle:SMD_0805" H 3000 2700 60  0001 C CNN
F 3 "" H 3025 3150 60  0000 C CNN
	1    3000 3050
	0    1    1    0   
$EndComp
Wire Wire Line
	3000 3250 3000 3350
Connection ~ 3000 3350
Wire Wire Line
	3000 2850 3350 2850
Text HLabel 7100 4450 2    60   Input ~ 0
1PPS
Text HLabel 3650 4850 0    60   Input ~ 0
GPS_RXD
Text HLabel 3650 4550 0    60   Input ~ 0
GPS_TXD
$Comp
L GND #PWR086
U 1 1 59CB0DB1
P 4950 3950
F 0 "#PWR086" H 4950 3700 50  0001 C CNN
F 1 "GND" H 4950 3800 50  0000 C CNN
F 2 "" H 4950 3950 50  0001 C CNN
F 3 "" H 4950 3950 50  0001 C CNN
	1    4950 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR087
U 1 1 59CB12C3
P 5200 4450
F 0 "#PWR087" H 5200 4200 50  0001 C CNN
F 1 "GND" H 5200 4300 50  0000 C CNN
F 2 "" H 5200 4450 50  0001 C CNN
F 3 "" H 5200 4450 50  0001 C CNN
	1    5200 4450
	1    0    0    -1  
$EndComp
$Comp
L Battery_Cell BT701
U 1 1 59CB3239
P 5050 5400
F 0 "BT701" H 5150 5500 50  0000 L CNN
F 1 "Battery_Cell" H 5150 5400 50  0000 L CNN
F 2 "" V 5050 5460 50  0001 C CNN
F 3 "" V 5050 5460 50  0001 C CNN
	1    5050 5400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR088
U 1 1 59CB3240
P 5050 5650
F 0 "#PWR088" H 5050 5400 50  0001 C CNN
F 1 "GND" H 5050 5500 50  0000 C CNN
F 2 "" H 5050 5650 50  0001 C CNN
F 3 "" H 5050 5650 50  0001 C CNN
	1    5050 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5500 5050 5650
Wire Wire Line
	5050 4050 5050 5200
$Comp
L C_Small C703
U 1 1 59CB3249
P 4850 5500
F 0 "C703" H 4860 5570 50  0000 L CNN
F 1 "1uF" H 4860 5420 50  0000 L CNN
F 2 "paddle:SMD_0805" H 4850 5500 50  0001 C CNN
F 3 "" H 4850 5500 50  0001 C CNN
	1    4850 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR089
U 1 1 59CB3250
P 4850 5650
F 0 "#PWR089" H 4850 5400 50  0001 C CNN
F 1 "GND" H 4850 5500 50  0000 C CNN
F 2 "" H 4850 5650 50  0001 C CNN
F 3 "" H 4850 5650 50  0001 C CNN
	1    4850 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 5600 4850 5650
Wire Wire Line
	4850 5200 4850 5400
Wire Wire Line
	5050 5200 4850 5200
Text HLabel 5250 3850 0    60   Input ~ 0
GPS_RESET*
$Comp
L R_US R702
U 1 1 59CB67E4
P 4050 4550
F 0 "R702" H 4075 4650 60  0000 C CNN
F 1 "330" H 4075 4450 60  0000 C CNN
F 2 "paddle:SMD_0805" H 4050 4200 60  0001 C CNN
F 3 "" H 4075 4650 60  0000 C CNN
	1    4050 4550
	1    0    0    -1  
$EndComp
$Comp
L R_US R703
U 1 1 59CB67EB
P 4050 4850
F 0 "R703" H 4075 4950 60  0000 C CNN
F 1 "330" H 4075 4750 60  0000 C CNN
F 2 "paddle:SMD_0805" H 4050 4500 60  0001 C CNN
F 3 "" H 4075 4950 60  0000 C CNN
	1    4050 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4550 4250 4550
Wire Wire Line
	3850 4550 3650 4550
Wire Wire Line
	3650 4850 3850 4850
Wire Wire Line
	4250 4850 4350 4850
Wire Wire Line
	4350 4850 4350 4650
Wire Wire Line
	4350 4650 5300 4650
$Comp
L Ferrite_Bead_Small L701
U 1 1 59CB7059
P 3650 3750
F 0 "L701" V 3725 3800 50  0000 L CNN
F 1 "bead" V 3850 3800 50  0000 L CNN
F 2 "paddle:SMD_0805" V 3580 3750 50  0001 C CNN
F 3 "" H 3650 3750 50  0001 C CNN
	1    3650 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	3550 3750 3350 3750
Wire Wire Line
	3750 3750 5300 3750
$EndSCHEMATC
