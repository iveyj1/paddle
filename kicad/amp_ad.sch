EESchema Schematic File Version 2
LIBS:paddle-rescue
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
$Descr A 11000 8500
encoding utf-8
Sheet 6 12
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Notes Line
	3100 11600 3200 11600
$Comp
L OPA388D U701
U 1 1 59D59F62
P 4100 3750
AR Path="/59CF5101/59CF60C9/59D59F62" Ref="U701"  Part="1" 
AR Path="/59CF5101/59DF91A9/59D59F62" Ref="U1001"  Part="1" 
AR Path="/59CF5101/59DF9675/59D59F62" Ref="U1101"  Part="1" 
AR Path="/59CF5101/59DF9B38/59D59F62" Ref="U1201"  Part="1" 
F 0 "U701" H 4100 4000 50  0000 L CNN
F 1 "OPA388D" H 4100 3900 50  0000 L CNN
F 2 "paddle:S-PDSO-G8" H 4150 3800 50  0001 C CNN
F 3 "" H 4250 3900 50  0001 C CNN
	1    4100 3750
	1    0    0    -1  
$EndComp
$Comp
L R_US R704
U 1 1 59DEB2F1
P 4750 4650
AR Path="/59CF5101/59CF60C9/59DEB2F1" Ref="R704"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEB2F1" Ref="R1004"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEB2F1" Ref="R1104"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEB2F1" Ref="R1204"  Part="1" 
F 0 "R704" H 4775 4750 60  0000 C CNN
F 1 "5k" H 4700 4550 60  0000 C CNN
F 2 "paddle:SMD_0805" H 4750 4300 60  0001 C CNN
F 3 "" H 4775 4750 60  0000 C CNN
	1    4750 4650
	1    0    0    -1  
$EndComp
$Comp
L R_US R703
U 1 1 59DEB300
P 4700 3750
AR Path="/59CF5101/59CF60C9/59DEB300" Ref="R703"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEB300" Ref="R1003"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEB300" Ref="R1103"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEB300" Ref="R1203"  Part="1" 
F 0 "R703" H 4725 3850 60  0000 C CNN
F 1 "10" H 4650 3650 60  0000 C CNN
F 2 "paddle:SMD_0805" H 4700 3400 60  0001 C CNN
F 3 "" H 4725 3850 60  0000 C CNN
	1    4700 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3750 4500 3750
Wire Wire Line
	6400 4500 6700 4500
Connection ~ 6500 4500
Connection ~ 6600 4500
Wire Wire Line
	6700 4500 6700 4650
$Comp
L GND #PWR059
U 1 1 59DEB50B
P 6700 4650
AR Path="/59CF5101/59CF60C9/59DEB50B" Ref="#PWR059"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEB50B" Ref="#PWR090"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEB50B" Ref="#PWR0103"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEB50B" Ref="#PWR0116"  Part="1" 
F 0 "#PWR0116" H 6700 4400 50  0001 C CNN
F 1 "GND" H 6700 4500 50  0000 C CNN
F 2 "" H 6700 4650 50  0001 C CNN
F 3 "" H 6700 4650 50  0001 C CNN
	1    6700 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR060
U 1 1 59DEB5C9
P 6050 3450
AR Path="/59CF5101/59CF60C9/59DEB5C9" Ref="#PWR060"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEB5C9" Ref="#PWR091"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEB5C9" Ref="#PWR0104"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEB5C9" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 6050 3200 50  0001 C CNN
F 1 "GND" H 6050 3300 50  0000 C CNN
F 2 "" H 6050 3450 50  0001 C CNN
F 3 "" H 6050 3450 50  0001 C CNN
	1    6050 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR061
U 1 1 59DEB702
P 7050 4050
AR Path="/59CF5101/59CF60C9/59DEB702" Ref="#PWR061"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEB702" Ref="#PWR092"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEB702" Ref="#PWR0105"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEB702" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 7050 3800 50  0001 C CNN
F 1 "GND" H 7050 3900 50  0000 C CNN
F 2 "" H 7050 4050 50  0001 C CNN
F 3 "" H 7050 4050 50  0001 C CNN
	1    7050 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4050 7050 4050
Wire Wire Line
	4900 3750 6050 3750
$Comp
L C_Small C704
U 1 1 59DEBB55
P 5550 4000
AR Path="/59CF5101/59CF60C9/59DEBB55" Ref="C704"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEBB55" Ref="C1004"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEBB55" Ref="C1104"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEBB55" Ref="C1204"  Part="1" 
F 0 "C704" H 5560 4070 50  0000 L CNN
F 1 "1uF" H 5560 3920 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5550 4000 50  0001 C CNN
F 3 "" H 5550 4000 50  0001 C CNN
	1    5550 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR062
U 1 1 59DEBB5C
P 5550 4150
AR Path="/59CF5101/59CF60C9/59DEBB5C" Ref="#PWR062"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEBB5C" Ref="#PWR093"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEBB5C" Ref="#PWR0106"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEBB5C" Ref="#PWR0119"  Part="1" 
F 0 "#PWR0119" H 5550 3900 50  0001 C CNN
F 1 "GND" H 5550 4000 50  0000 C CNN
F 2 "" H 5550 4150 50  0001 C CNN
F 3 "" H 5550 4150 50  0001 C CNN
	1    5550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 4100 5550 4150
Wire Wire Line
	5550 3900 5550 3750
Connection ~ 5550 3750
$Comp
L C_Small C703
U 1 1 59DEBBF3
P 4200 4300
AR Path="/59CF5101/59CF60C9/59DEBBF3" Ref="C703"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEBBF3" Ref="C1003"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEBBF3" Ref="C1103"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEBBF3" Ref="C1203"  Part="1" 
F 0 "C703" H 4210 4370 50  0000 L CNN
F 1 "0.01uF" H 4210 4220 50  0000 L CNN
F 2 "paddle:SMD_0805" H 4200 4300 50  0001 C CNN
F 3 "" H 4200 4300 50  0001 C CNN
	1    4200 4300
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 4650 4950 4650
Wire Wire Line
	3900 4650 4550 4650
Wire Wire Line
	3200 4300 4100 4300
Wire Wire Line
	3800 3850 3600 3850
Wire Wire Line
	3600 3850 3600 4300
Connection ~ 3900 4300
Wire Wire Line
	5050 3750 5050 4650
Connection ~ 5050 3750
$Comp
L R_US R702
U 1 1 59DEBDAB
P 3200 4750
AR Path="/59CF5101/59CF60C9/59DEBDAB" Ref="R702"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEBDAB" Ref="R1002"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEBDAB" Ref="R1102"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEBDAB" Ref="R1202"  Part="1" 
F 0 "R702" H 3225 4850 60  0000 C CNN
F 1 "DNP" H 3150 4650 60  0000 C CNN
F 2 "paddle:SMD_0805" H 3200 4400 60  0001 C CNN
F 3 "" H 3225 4850 60  0000 C CNN
	1    3200 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 4550 3200 4300
Connection ~ 3600 4300
Wire Wire Line
	3200 4950 3200 5150
Wire Wire Line
	3050 3650 3800 3650
Wire Wire Line
	3300 3650 3300 3800
Connection ~ 3300 3650
Wire Wire Line
	3300 4000 3300 4050
$Comp
L GND #PWR063
U 1 1 59DEBF54
P 3300 4050
AR Path="/59CF5101/59CF60C9/59DEBF54" Ref="#PWR063"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEBF54" Ref="#PWR094"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEBF54" Ref="#PWR0107"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEBF54" Ref="#PWR0120"  Part="1" 
F 0 "#PWR0120" H 3300 3800 50  0001 C CNN
F 1 "GND" H 3300 3900 50  0000 C CNN
F 2 "" H 3300 4050 50  0001 C CNN
F 3 "" H 3300 4050 50  0001 C CNN
	1    3300 4050
	1    0    0    -1  
$EndComp
$Comp
L C_Small C701
U 1 1 59DEBEB7
P 3300 3900
AR Path="/59CF5101/59CF60C9/59DEBEB7" Ref="C701"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEBEB7" Ref="C1001"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEBEB7" Ref="C1101"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEBEB7" Ref="C1201"  Part="1" 
F 0 "C701" H 3310 3970 50  0000 L CNN
F 1 "0.01uF" H 3310 3820 50  0000 L CNN
F 2 "paddle:SMD_0805" H 3300 3900 50  0001 C CNN
F 3 "" H 3300 3900 50  0001 C CNN
	1    3300 3900
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR064
U 1 1 59DEC063
P 4000 4050
AR Path="/59CF5101/59CF60C9/59DEC063" Ref="#PWR064"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEC063" Ref="#PWR095"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEC063" Ref="#PWR0108"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEC063" Ref="#PWR0121"  Part="1" 
F 0 "#PWR0121" H 4000 3800 50  0001 C CNN
F 1 "GND" H 4000 3900 50  0000 C CNN
F 2 "" H 4000 4050 50  0001 C CNN
F 3 "" H 4000 4050 50  0001 C CNN
	1    4000 4050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR065
U 1 1 59DEC1A6
P 7050 3200
AR Path="/59CF5101/59CF60C9/59DEC1A6" Ref="#PWR065"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEC1A6" Ref="#PWR096"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEC1A6" Ref="#PWR0109"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEC1A6" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 7050 2950 50  0001 C CNN
F 1 "GND" H 7050 3050 50  0000 C CNN
F 2 "" H 7050 3200 50  0001 C CNN
F 3 "" H 7050 3200 50  0001 C CNN
	1    7050 3200
	1    0    0    -1  
$EndComp
$Comp
L R_US R701
U 1 1 59DEC1C9
P 2850 3650
AR Path="/59CF5101/59CF60C9/59DEC1C9" Ref="R701"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEC1C9" Ref="R1001"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEC1C9" Ref="R1101"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEC1C9" Ref="R1201"  Part="1" 
F 0 "R701" H 2875 3750 60  0000 C CNN
F 1 "10k" H 2800 3550 60  0000 C CNN
F 2 "paddle:SMD_0805" H 2850 3300 60  0001 C CNN
F 3 "" H 2875 3750 60  0000 C CNN
	1    2850 3650
	-1   0    0    1   
$EndComp
Text HLabel 2900 5150 0    60   Input ~ 0
VREF
Wire Wire Line
	2900 5150 6050 5150
Text Label 3200 5150 0    60   ~ 0
VREF
Text Label 6050 3300 2    60   ~ 0
VREF
Text HLabel 7250 3450 2    60   Input ~ 0
SCLK
Text HLabel 7250 3550 2    60   Output ~ 0
SDO
Text HLabel 7250 3650 2    60   Input ~ 0
SDI
Text HLabel 7250 3750 2    60   Input ~ 0
CS*
Wire Wire Line
	7050 3450 7250 3450
Wire Wire Line
	7250 3550 7050 3550
Wire Wire Line
	7050 3650 7250 3650
Wire Wire Line
	7250 3750 7050 3750
$Comp
L Q_NMOS_GSD Q701
U 1 1 59DECDAE
P 8000 3100
AR Path="/59CF5101/59CF60C9/59DECDAE" Ref="Q701"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DECDAE" Ref="Q1001"  Part="1" 
AR Path="/59CF5101/59DF9675/59DECDAE" Ref="Q1101"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DECDAE" Ref="Q1201"  Part="1" 
F 0 "Q701" H 8200 3150 50  0000 L CNN
F 1 "DMG3414U" H 8200 3050 50  0000 L CNN
F 2 "paddle:SOT-23" H 8200 3200 50  0001 C CNN
F 3 "" H 8000 3100 50  0001 C CNN
	1    8000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3100 7800 3100
$Comp
L GND #PWR066
U 1 1 59DECF72
P 8100 3300
AR Path="/59CF5101/59CF60C9/59DECF72" Ref="#PWR066"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DECF72" Ref="#PWR097"  Part="1" 
AR Path="/59CF5101/59DF9675/59DECF72" Ref="#PWR0110"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DECF72" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 8100 3050 50  0001 C CNN
F 1 "GND" H 8100 3150 50  0000 C CNN
F 2 "" H 8100 3300 50  0001 C CNN
F 3 "" H 8100 3300 50  0001 C CNN
	1    8100 3300
	1    0    0    -1  
$EndComp
Text HLabel 8300 2750 2    60   Output ~ 0
BUSY*
Wire Wire Line
	8300 2750 8100 2750
Wire Wire Line
	8100 2750 8100 2900
Text HLabel 2650 3650 0    60   Input ~ 0
ANALOG_IN
$Comp
L +3.3VA #PWR067
U 1 1 59DED15F
P 4000 2900
AR Path="/59CF5101/59CF60C9/59DED15F" Ref="#PWR067"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DED15F" Ref="#PWR098"  Part="1" 
AR Path="/59CF5101/59DF9675/59DED15F" Ref="#PWR0111"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DED15F" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 4000 2700 50  0001 C CNN
F 1 "+3.3VA" H 4000 3100 50  0000 C CNN
F 2 "" H 4000 2900 50  0001 C CNN
F 3 "" H 4000 2900 50  0001 C CNN
	1    4000 2900
	1    0    0    -1  
$EndComp
$Comp
L +3.3VA #PWR068
U 1 1 59DED17B
P 5700 2550
AR Path="/59CF5101/59CF60C9/59DED17B" Ref="#PWR068"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DED17B" Ref="#PWR099"  Part="1" 
AR Path="/59CF5101/59DF9675/59DED17B" Ref="#PWR0112"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DED17B" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 5700 2350 50  0001 C CNN
F 1 "+3.3VA" H 5700 2750 50  0000 C CNN
F 2 "" H 5700 2550 50  0001 C CNN
F 3 "" H 5700 2550 50  0001 C CNN
	1    5700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2600 5700 2550
$Comp
L C_Small C706
U 1 1 59DED524
P 5900 2700
AR Path="/59CF5101/59CF60C9/59DED524" Ref="C706"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DED524" Ref="C1006"  Part="1" 
AR Path="/59CF5101/59DF9675/59DED524" Ref="C1106"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DED524" Ref="C1206"  Part="1" 
F 0 "C706" H 5910 2770 50  0000 L CNN
F 1 "10uF" H 5910 2620 50  0000 L CNN
F 2 "paddle:SMD_1206" H 5900 2700 50  0001 C CNN
F 3 "" H 5900 2700 50  0001 C CNN
	1    5900 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR069
U 1 1 59DED543
P 5900 2850
AR Path="/59CF5101/59CF60C9/59DED543" Ref="#PWR069"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DED543" Ref="#PWR0100"  Part="1" 
AR Path="/59CF5101/59DF9675/59DED543" Ref="#PWR0113"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DED543" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 5900 2600 50  0001 C CNN
F 1 "GND" H 5900 2700 50  0000 C CNN
F 2 "" H 5900 2850 50  0001 C CNN
F 3 "" H 5900 2850 50  0001 C CNN
	1    5900 2850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C705
U 1 1 59DED56F
P 5700 2700
AR Path="/59CF5101/59CF60C9/59DED56F" Ref="C705"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DED56F" Ref="C1005"  Part="1" 
AR Path="/59CF5101/59DF9675/59DED56F" Ref="C1105"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DED56F" Ref="C1205"  Part="1" 
F 0 "C705" H 5710 2770 50  0000 L CNN
F 1 "0.1uF" H 5710 2620 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5700 2700 50  0001 C CNN
F 3 "" H 5700 2700 50  0001 C CNN
	1    5700 2700
	-1   0    0    1   
$EndComp
Wire Wire Line
	5700 2600 6450 2600
Connection ~ 5900 2600
Wire Wire Line
	5900 2800 5900 2850
Wire Wire Line
	5700 2800 5700 2850
$Comp
L GND #PWR070
U 1 1 59DED6A0
P 5700 2850
AR Path="/59CF5101/59CF60C9/59DED6A0" Ref="#PWR070"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DED6A0" Ref="#PWR0101"  Part="1" 
AR Path="/59CF5101/59DF9675/59DED6A0" Ref="#PWR0114"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DED6A0" Ref="#PWR0127"  Part="1" 
F 0 "#PWR0127" H 5700 2600 50  0001 C CNN
F 1 "GND" H 5700 2700 50  0000 C CNN
F 2 "" H 5700 2850 50  0001 C CNN
F 3 "" H 5700 2850 50  0001 C CNN
	1    5700 2850
	1    0    0    -1  
$EndComp
$Comp
L LTC2440 U702
U 1 1 59DEE409
P 6550 3650
AR Path="/59CF5101/59CF60C9/59DEE409" Ref="U702"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEE409" Ref="U1002"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEE409" Ref="U1102"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEE409" Ref="U1202"  Part="1" 
F 0 "U702" H 6550 2550 60  0000 C CNN
F 1 "LTC2440" H 6550 2450 60  0000 C CNN
F 2 "paddle:SSOP-16_3.9x4.9mm_Pitch0.635mm" H 6450 2300 60  0001 C CNN
F 3 "" H 6450 2300 60  0001 C CNN
	1    6550 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 4300 4450 4300
Connection ~ 4450 3750
Wire Wire Line
	4450 4300 4450 3750
Wire Wire Line
	3900 4650 3900 4300
Wire Wire Line
	6050 5150 6050 3900
Connection ~ 3200 5150
Wire Wire Line
	6450 2600 6450 2750
$Comp
L C_Small C702
U 1 1 59DEECC0
P 3800 3150
AR Path="/59CF5101/59CF60C9/59DEECC0" Ref="C702"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEECC0" Ref="C1002"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEECC0" Ref="C1102"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEECC0" Ref="C1202"  Part="1" 
F 0 "C702" H 3810 3220 50  0000 L CNN
F 1 "0.1uF" H 3810 3070 50  0000 L CNN
F 2 "paddle:SMD_0805" H 3800 3150 50  0001 C CNN
F 3 "" H 3800 3150 50  0001 C CNN
	1    3800 3150
	-1   0    0    1   
$EndComp
Wire Wire Line
	3800 3250 3800 3300
$Comp
L GND #PWR071
U 1 1 59DEECC7
P 3800 3300
AR Path="/59CF5101/59CF60C9/59DEECC7" Ref="#PWR071"  Part="1" 
AR Path="/59CF5101/59DF91A9/59DEECC7" Ref="#PWR0102"  Part="1" 
AR Path="/59CF5101/59DF9675/59DEECC7" Ref="#PWR0115"  Part="1" 
AR Path="/59CF5101/59DF9B38/59DEECC7" Ref="#PWR0128"  Part="1" 
F 0 "#PWR0128" H 3800 3050 50  0001 C CNN
F 1 "GND" H 3800 3150 50  0000 C CNN
F 2 "" H 3800 3300 50  0001 C CNN
F 3 "" H 3800 3300 50  0001 C CNN
	1    3800 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2900 4000 3450
Wire Wire Line
	3800 3050 3800 3000
Wire Wire Line
	3800 3000 4000 3000
Connection ~ 4000 3000
$EndSCHEMATC
