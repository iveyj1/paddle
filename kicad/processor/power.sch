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
$Descr A 11000 8500
encoding utf-8
Sheet 2 5
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
L C_Small C8
U 1 1 59B553A2
P 6700 5900
F 0 "C8" H 6710 5970 50  0000 L CNN
F 1 "10uF" H 6710 5820 50  0000 L CNN
F 2 "paddle:SMD_0805" H 6700 5900 50  0001 C CNN
F 3 "" H 6700 5900 50  0001 C CNN
	1    6700 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 59B553A9
P 6700 6050
F 0 "#PWR029" H 6700 5800 50  0001 C CNN
F 1 "GND" H 6700 5900 50  0000 C CNN
F 2 "" H 6700 6050 50  0001 C CNN
F 3 "" H 6700 6050 50  0001 C CNN
	1    6700 6050
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 J4
U 1 1 59B553AF
P 8800 1900
F 0 "J4" H 8800 2050 50  0000 C CNN
F 1 "Battery" V 8900 1900 50  0000 C CNN
F 2 "paddle:JST_battery_header_B2B-PH-K-S" H 8800 1900 50  0001 C CNN
F 3 "" H 8800 1900 50  0001 C CNN
	1    8800 1900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 59B553B6
P 8500 1950
F 0 "#PWR030" H 8500 1700 50  0001 C CNN
F 1 "GND" H 8500 1800 50  0000 C CNN
F 2 "" H 8500 1950 50  0001 C CNN
F 3 "" H 8500 1950 50  0001 C CNN
	1    8500 1950
	1    0    0    -1  
$EndComp
$Comp
L Polyfuse_Small F1
U 1 1 59B553D1
P 8200 1850
F 0 "F1" V 8125 1850 50  0000 C CNN
F 1 "1A Poly" V 8275 1850 50  0000 C CNN
F 2 "paddle:SMD_1812" H 8250 1650 50  0001 L CNN
F 3 "" H 8200 1850 50  0001 C CNN
	1    8200 1850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR031
U 1 1 59B553E0
P 6150 5650
F 0 "#PWR031" H 6150 5400 50  0001 C CNN
F 1 "GND" H 6150 5500 50  0000 C CNN
F 2 "" H 6150 5650 50  0001 C CNN
F 3 "" H 6150 5650 50  0001 C CNN
	1    6150 5650
	1    0    0    -1  
$EndComp
$Comp
L R_US R15
U 1 1 59B553E6
P 6150 3900
F 0 "R15" H 6175 4000 60  0000 C CNN
F 1 "1Meg" H 6175 3800 60  0000 C CNN
F 2 "paddle:R_0603" H 6150 3550 60  0001 C CNN
F 3 "" H 6175 4000 60  0000 C CNN
	1    6150 3900
	0    -1   -1   0   
$EndComp
$Comp
L R_US R14
U 1 1 59B553ED
P 5850 5450
F 0 "R14" H 5875 5550 60  0000 C CNN
F 1 "1Meg" H 5800 5350 60  0000 C CNN
F 2 "paddle:R_0603" H 5850 5100 60  0001 C CNN
F 3 "" H 5875 5550 60  0000 C CNN
	1    5850 5450
	0    -1   -1   0   
$EndComp
$Comp
L MCP73831/2 U4
U 1 1 59B5544C
P 5750 2000
F 0 "U4" H 5700 1500 60  0000 L CNN
F 1 "MCP73832" H 5450 1400 60  0000 L CNN
F 2 "paddle:SOT-23-5" H 5850 1900 30  0001 L CNN
F 3 "" H 5750 2000 60  0000 C CNN
	1    5750 2000
	1    0    0    -1  
$EndComp
$Comp
L NCP694-3.3 U5
U 1 1 59B55453
P 7950 5900
F 0 "U5" H 7900 5400 60  0000 L CNN
F 1 "NCP694-3.3" H 7650 5300 60  0000 L CNN
F 2 "paddle:SOT89-5" H 8050 5800 30  0001 L CNN
F 3 "" H 7950 5900 60  0000 C CNN
	1    7950 5900
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR032
U 1 1 59B55462
P 7350 6350
F 0 "#PWR032" H 7350 6100 50  0001 C CNN
F 1 "GND" H 7350 6200 50  0000 C CNN
F 2 "" H 7350 6350 50  0001 C CNN
F 3 "" H 7350 6350 50  0001 C CNN
	1    7350 6350
	1    0    0    -1  
$EndComp
NoConn ~ 8450 6250
$Comp
L C_Small C5
U 1 1 59B55484
P 4000 2000
F 0 "C5" H 4010 2070 50  0000 L CNN
F 1 "4.7uF" H 4010 1920 50  0000 L CNN
F 2 "paddle:SMD_0805" H 4000 2000 50  0001 C CNN
F 3 "" H 4000 2000 50  0001 C CNN
	1    4000 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 59B5548B
P 4000 2150
F 0 "#PWR033" H 4000 1900 50  0001 C CNN
F 1 "GND" H 4000 2000 50  0000 C CNN
F 2 "" H 4000 2150 50  0001 C CNN
F 3 "" H 4000 2150 50  0001 C CNN
	1    4000 2150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 59B5549A
P 5200 2450
F 0 "#PWR034" H 5200 2200 50  0001 C CNN
F 1 "GND" H 5200 2300 50  0000 C CNN
F 2 "" H 5200 2450 50  0001 C CNN
F 3 "" H 5200 2450 50  0001 C CNN
	1    5200 2450
	1    0    0    -1  
$EndComp
$Comp
L R_US R16
U 1 1 59B554A3
P 6250 2600
F 0 "R16" H 6275 2700 60  0000 C CNN
F 1 "10K" H 6275 2500 60  0000 C CNN
F 2 "paddle:R_0603" H 6250 2250 60  0001 C CNN
F 3 "" H 6275 2700 60  0000 C CNN
	1    6250 2600
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR035
U 1 1 59B554AD
P 6250 2850
F 0 "#PWR035" H 6250 2600 50  0001 C CNN
F 1 "GND" H 6250 2700 50  0000 C CNN
F 2 "" H 6250 2850 50  0001 C CNN
F 3 "" H 6250 2850 50  0001 C CNN
	1    6250 2850
	1    0    0    -1  
$EndComp
Text HLabel 4650 4200 0    60   Output ~ 0
POWER_SW*
Text HLabel 4700 5250 0    60   Input ~ 0
KEEPALIVE
$Comp
L C_Small C7
U 1 1 59B5940E
P 6400 2000
F 0 "C7" H 6410 2070 50  0000 L CNN
F 1 "4.7uF" H 6410 1920 50  0000 L CNN
F 2 "paddle:SMD_0805" H 6400 2000 50  0001 C CNN
F 3 "" H 6400 2000 50  0001 C CNN
	1    6400 2000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR036
U 1 1 59B59414
P 6400 2150
F 0 "#PWR036" H 6400 1900 50  0001 C CNN
F 1 "GND" H 6400 2000 50  0000 C CNN
F 2 "" H 6400 2150 50  0001 C CNN
F 3 "" H 6400 2150 50  0001 C CNN
	1    6400 2150
	1    0    0    -1  
$EndComp
$Comp
L R_US R13
U 1 1 59B5B171
P 4600 2100
F 0 "R13" H 4625 2200 60  0000 C CNN
F 1 "1.0K" H 4625 2000 60  0000 C CNN
F 2 "paddle:R_0603" H 4600 1750 60  0001 C CNN
F 3 "" H 4625 2200 60  0000 C CNN
	1    4600 2100
	1    0    0    -1  
$EndComp
$Comp
L C_Small C9
U 1 1 59B5F0CA
P 8500 5950
F 0 "C9" H 8510 6020 50  0000 L CNN
F 1 "10uF" H 8510 5870 50  0000 L CNN
F 2 "paddle:SMD_0805" H 8500 5950 50  0001 C CNN
F 3 "" H 8500 5950 50  0001 C CNN
	1    8500 5950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR037
U 1 1 59B5F0D0
P 8500 6100
F 0 "#PWR037" H 8500 5850 50  0001 C CNN
F 1 "GND" H 8500 5950 50  0000 C CNN
F 2 "" H 8500 6100 50  0001 C CNN
F 3 "" H 8500 6100 50  0001 C CNN
	1    8500 6100
	1    0    0    -1  
$EndComp
$Comp
L Q_PMOS_GSD Q5
U 1 1 59BB4FEC
P 7550 2550
F 0 "Q5" H 7750 2600 50  0000 L CNN
F 1 "DMG3415U" H 7750 2500 50  0000 L CNN
F 2 "paddle:SOT-23" H 7750 2650 50  0001 C CNN
F 3 "" H 7550 2550 50  0001 C CNN
	1    7550 2550
	1    0    0    -1  
$EndComp
$Comp
L R_US R17
U 1 1 59BB5545
P 7050 3150
F 0 "R17" H 7075 3250 60  0000 C CNN
F 1 "1.0Meg" H 7000 3050 60  0000 C CNN
F 2 "paddle:R_0603" H 7050 2800 60  0001 C CNN
F 3 "" H 7075 3250 60  0000 C CNN
	1    7050 3150
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR038
U 1 1 59BB7413
P 7050 3400
F 0 "#PWR038" H 7050 3150 50  0001 C CNN
F 1 "GND" H 7050 3250 50  0000 C CNN
F 2 "" H 7050 3400 50  0001 C CNN
F 3 "" H 7050 3400 50  0001 C CNN
	1    7050 3400
	1    0    0    -1  
$EndComp
$Comp
L Q_PMOS_GSD Q4
U 1 1 59BB970F
P 6600 4100
F 0 "Q4" H 6800 4150 50  0000 L CNN
F 1 "DMG3415U" H 6800 4050 50  0000 L CNN
F 2 "paddle:SOT-23" H 6800 4200 50  0001 C CNN
F 3 "" H 6600 4100 50  0001 C CNN
	1    6600 4100
	1    0    0    1   
$EndComp
Text Notes 7800 2800 0    60   ~ 0
S
Text Notes 7800 2400 0    60   ~ 0
D
Text Notes 6850 3950 0    60   ~ 0
S
Text Notes 6850 4300 0    60   ~ 0
D
$Comp
L Q_NMOS_GSD Q3
U 1 1 59C7C991
P 6050 5250
F 0 "Q3" H 6250 5300 50  0000 L CNN
F 1 "DMG3414U" H 6250 5200 50  0000 L CNN
F 2 "paddle:SOT-23" H 6250 5350 50  0001 C CNN
F 3 "" H 6050 5250 50  0001 C CNN
	1    6050 5250
	1    0    0    -1  
$EndComp
Text Label 7100 3850 0    60   ~ 0
V_UNREG
$Comp
L Schottky D1
U 1 1 59C502A4
P 7350 2850
F 0 "D1" H 7350 2950 50  0000 C CNN
F 1 "RB168LAM-30" H 7350 2750 50  0000 C CNN
F 2 "paddle:D_SOD-128" H 7350 2675 50  0001 C CNN
F 3 "" H 7350 2850 50  0001 C CNN
	1    7350 2850
	1    0    0    -1  
$EndComp
Text HLabel 2550 1850 0    60   Input ~ 0
+VBUS
Text HLabel 9400 5750 2    60   Output ~ 0
+3.3V
Text HLabel 6900 5100 2    60   Output ~ 0
+V_UNREG_SW
$Comp
L GND #PWR039
U 1 1 59D182BE
P 5250 4750
F 0 "#PWR039" H 5250 4500 50  0001 C CNN
F 1 "GND" H 5250 4600 50  0000 C CNN
F 2 "" H 5250 4750 50  0001 C CNN
F 3 "" H 5250 4750 50  0001 C CNN
	1    5250 4750
	1    0    0    -1  
$EndComp
$Comp
L Schottky D2
U 1 1 59D1851A
P 7950 5500
F 0 "D2" H 7950 5600 50  0000 C CNN
F 1 "RB168LAM-30" H 7950 5400 50  0000 C CNN
F 2 "paddle:D_SOD-128" H 7950 5325 50  0001 C CNN
F 3 "" H 7950 5500 50  0001 C CNN
	1    7950 5500
	-1   0    0    1   
$EndComp
$Comp
L Q_PMOS_GSD Q1
U 1 1 59E55B7C
P 3100 2850
F 0 "Q1" V 3500 2850 50  0000 L CNN
F 1 "DMG3415U" V 3400 2700 50  0000 L CNN
F 2 "paddle:SOT-23" H 3300 2950 50  0001 C CNN
F 3 "" H 3100 2850 50  0001 C CNN
	1    3100 2850
	0    -1   1    0   
$EndComp
Text Notes 3300 3100 2    60   ~ 0
S
Text Notes 2900 3100 2    60   ~ 0
D
$Comp
L R_US R11
U 1 1 59E56664
P 2650 3250
F 0 "R11" H 2675 3350 60  0000 C CNN
F 1 "1.0Meg" H 2675 3150 60  0000 C CNN
F 2 "paddle:R_0603" H 2650 2900 60  0001 C CNN
F 3 "" H 2675 3350 60  0000 C CNN
	1    2650 3250
	0    1    1    0   
$EndComp
$Comp
L GND #PWR040
U 1 1 59E567BA
P 2650 3500
F 0 "#PWR040" H 2650 3250 50  0001 C CNN
F 1 "GND" H 2650 3350 50  0000 C CNN
F 2 "" H 2650 3500 50  0001 C CNN
F 3 "" H 2650 3500 50  0001 C CNN
	1    2650 3500
	1    0    0    -1  
$EndComp
$Comp
L Q_PMOS_GSD Q2
U 1 1 59E56883
P 3450 1950
F 0 "Q2" V 3850 1950 50  0000 L CNN
F 1 "DMG3415U" V 3750 1800 50  0000 L CNN
F 2 "paddle:SOT-23" H 3650 2050 50  0001 C CNN
F 3 "" H 3450 1950 50  0001 C CNN
	1    3450 1950
	0    -1   -1   0   
$EndComp
Text Notes 3650 1800 2    60   ~ 0
S
Text Notes 3250 1800 2    60   ~ 0
D
$Comp
L R_US R12
U 1 1 59E56895
P 2800 2100
F 0 "R12" H 2825 2200 60  0000 C CNN
F 1 "1.0Meg" H 2825 2000 60  0000 C CNN
F 2 "paddle:R_0603" H 2800 1750 60  0001 C CNN
F 3 "" H 2825 2200 60  0000 C CNN
	1    2800 2100
	0    1    1    0   
$EndComp
$Comp
L GND #PWR041
U 1 1 59E5689E
P 2800 2350
F 0 "#PWR041" H 2800 2100 50  0001 C CNN
F 1 "GND" H 2800 2200 50  0000 C CNN
F 2 "" H 2800 2350 50  0001 C CNN
F 3 "" H 2800 2350 50  0001 C CNN
	1    2800 2350
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X01_FEMALE J2
U 1 1 59E5FA35
P 2200 2950
F 0 "J2" H 2200 3050 50  0000 C CNN
F 1 "V_QI" H 2200 2850 50  0000 C CNN
F 2 "paddle:TH_1.0" H 2200 2950 50  0001 C CNN
F 3 "" H 2200 2950 50  0001 C CNN
	1    2200 2950
	-1   0    0    1   
$EndComp
$Comp
L CONN_01X01_FEMALE J3
U 1 1 59E5FAA8
P 2200 3250
F 0 "J3" H 2200 3350 50  0000 C CNN
F 1 "GND" H 2200 3150 50  0000 C CNN
F 2 "paddle:TH_1.0" H 2200 3250 50  0001 C CNN
F 3 "" H 2200 3250 50  0001 C CNN
	1    2200 3250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR042
U 1 1 59E5FBC5
P 2400 3350
F 0 "#PWR042" H 2400 3100 50  0001 C CNN
F 1 "GND" H 2400 3200 50  0000 C CNN
F 2 "" H 2400 3350 50  0001 C CNN
F 3 "" H 2400 3350 50  0001 C CNN
	1    2400 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 6000 6700 6050
Wire Wire Line
	6700 4300 6700 5800
Wire Wire Line
	8600 1950 8500 1950
Wire Wire Line
	6150 4100 6150 5050
Wire Wire Line
	6150 4100 6400 4100
Wire Wire Line
	5250 5250 5850 5250
Wire Wire Line
	6150 5450 6150 5650
Wire Wire Line
	6150 3700 6150 3650
Wire Wire Line
	6150 5650 5850 5650
Wire Wire Line
	7350 6000 7450 6000
Wire Wire Line
	7350 5500 7350 6000
Wire Wire Line
	6700 5750 7450 5750
Wire Wire Line
	7450 6250 7350 6250
Wire Wire Line
	7350 6250 7350 6350
Connection ~ 7350 5750
Connection ~ 6700 5750
Wire Wire Line
	4000 2100 4000 2150
Wire Wire Line
	4000 1850 4000 1900
Wire Wire Line
	3650 1850 5300 1850
Connection ~ 4000 1850
Wire Wire Line
	5200 2450 5200 2350
Wire Wire Line
	5200 2350 5300 2350
Wire Wire Line
	6200 2350 6250 2350
Wire Wire Line
	6250 2350 6250 2400
Wire Wire Line
	6250 2800 6250 2850
Wire Wire Line
	6400 1850 6400 1900
Wire Wire Line
	6400 2100 6400 2150
Wire Wire Line
	4300 1850 4300 2100
Wire Wire Line
	4300 2100 4400 2100
Connection ~ 4300 1850
Wire Wire Line
	4900 2100 4800 2100
Wire Wire Line
	5200 2100 5300 2100
Wire Wire Line
	8450 5750 9400 5750
Wire Wire Line
	8500 6050 8500 6100
Wire Wire Line
	8500 5500 8500 5850
Connection ~ 8500 5750
Wire Wire Line
	8600 1850 8300 1850
Wire Wire Line
	7650 1850 7650 2350
Wire Wire Line
	7050 1550 7050 2950
Connection ~ 7050 2850
Wire Wire Line
	7050 3350 7050 3400
Wire Wire Line
	6200 1850 8100 1850
Wire Wire Line
	7050 2550 7050 2850
Wire Wire Line
	7050 2550 7350 2550
Connection ~ 7650 1850
Connection ~ 7650 2850
Connection ~ 7050 2550
Wire Wire Line
	7050 2850 7200 2850
Wire Wire Line
	7500 2850 7650 2850
Wire Wire Line
	-54750 0    -54750 -100
Connection ~ 6400 1850
Wire Wire Line
	8500 5500 8100 5500
Wire Wire Line
	7800 5500 7350 5500
Wire Wire Line
	3800 1850 3800 2950
Connection ~ 3800 1850
Wire Wire Line
	2300 2950 2900 2950
Wire Wire Line
	3800 2950 3300 2950
Wire Wire Line
	2650 3050 2650 2950
Connection ~ 2650 2950
Wire Wire Line
	2650 3450 2650 3500
Wire Wire Line
	2550 1850 3250 1850
Wire Wire Line
	3450 2150 3450 2600
Wire Wire Line
	2800 1900 2800 1850
Connection ~ 2800 1850
Wire Wire Line
	2800 2300 2800 2350
Wire Wire Line
	6900 5100 6700 5100
Connection ~ 6700 5100
Wire Wire Line
	3100 1850 3100 2650
Connection ~ 3100 1850
Wire Wire Line
	2400 3350 2400 3250
Wire Wire Line
	2400 3250 2300 3250
Connection ~ 6150 4100
Wire Wire Line
	3450 2600 2800 2600
Wire Wire Line
	2800 2600 2800 2950
Connection ~ 2800 2950
Wire Wire Line
	6700 3650 6700 3900
Connection ~ 6700 3650
Wire Wire Line
	7650 3650 7650 2750
$Comp
L SWITCH_PUSHBUTTON SW?
U 1 1 59F6C3BE
P 5700 3950
AR Path="/59B548AE/59F6C3BE" Ref="SW?"  Part="1" 
AR Path="/59FE1414/59FE32E0/59F6C3BE" Ref="SW?"  Part="1" 
AR Path="/59FFABEE/59F6C3BE" Ref="SW1"  Part="1" 
F 0 "SW1" H 5600 4090 45  0000 L BNN
F 1 "SW" H 5600 3860 45  0000 L BNN
F 2 "paddle:SW_KMR7" H 6000 4150 20  0001 C CNN
F 3 "" H 5700 3950 60  0001 C CNN
	1    5700 3950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 1850 5150 1550
Wire Wire Line
	5150 1550 7050 1550
Connection ~ 5150 1850
$Comp
L C_Small C6
U 1 1 59F6DAB9
P 5450 5450
F 0 "C6" H 5460 5520 50  0000 L CNN
F 1 "10uF" H 5460 5370 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5450 5450 50  0001 C CNN
F 3 "" H 5450 5450 50  0001 C CNN
	1    5450 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR043
U 1 1 59F6DABF
P 5450 5600
F 0 "#PWR043" H 5450 5350 50  0001 C CNN
F 1 "GND" H 5450 5450 50  0000 C CNN
F 2 "" H 5450 5600 50  0001 C CNN
F 3 "" H 5450 5600 50  0001 C CNN
	1    5450 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 5550 5450 5600
Wire Wire Line
	5450 5250 5450 5350
Connection ~ 5450 5250
$Comp
L LED LED7
U 1 1 59FFF112
P 5050 2100
F 0 "LED7" H 5000 1900 45  0000 L BNN
F 1 "LED" H 5000 1800 45  0000 L BNN
F 2 "paddle:SMD_D_0805" H 4850 2130 20  0001 C CNN
F 3 "" V 5000 2100 60  0001 C CNN
	1    5050 2100
	-1   0    0    1   
$EndComp
$Comp
L PWR_FLAG #FLG044
U 1 1 59FFC7AF
P 4450 1850
F 0 "#FLG044" H 4450 1925 50  0001 C CNN
F 1 "PWR_FLAG" H 4450 2000 50  0000 C CNN
F 2 "" H 4450 1850 50  0001 C CNN
F 3 "" H 4450 1850 50  0001 C CNN
	1    4450 1850
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG045
U 1 1 59FFC818
P 6700 4650
F 0 "#FLG045" H 6700 4725 50  0001 C CNN
F 1 "PWR_FLAG" H 6700 4800 50  0000 C CNN
F 2 "" H 6700 4650 50  0001 C CNN
F 3 "" H 6700 4650 50  0001 C CNN
	1    6700 4650
	0    1    1    0   
$EndComp
Connection ~ 6700 4650
Connection ~ 4450 1850
$Comp
L Schottky D4
U 1 1 5A0BC7B3
P 5700 4450
F 0 "D4" H 5700 4550 50  0000 C CNN
F 1 "RB168LAM-30" H 5700 4350 50  0000 C CNN
F 2 "paddle:D_SOD-128" H 5700 4275 50  0001 C CNN
F 3 "" H 5700 4450 50  0001 C CNN
	1    5700 4450
	0    1    1    0   
$EndComp
$Comp
L Schottky D3
U 1 1 5A0BC847
P 5100 5250
F 0 "D3" H 5100 5350 50  0000 C CNN
F 1 "RB168LAM-30" H 5100 5150 50  0000 C CNN
F 2 "paddle:D_SOD-128" H 5100 5075 50  0001 C CNN
F 3 "" H 5100 5250 50  0001 C CNN
	1    5100 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 5250 4700 5250
Connection ~ 5700 5250
Wire Wire Line
	5700 4150 5700 4300
Wire Wire Line
	5700 3750 5700 3650
Connection ~ 6150 3650
$Comp
L R_US R30
U 1 1 5A0BD110
P 5700 4900
F 0 "R30" H 5725 5000 60  0000 C CNN
F 1 "1.0k" H 5650 4800 60  0000 C CNN
F 2 "paddle:R_0603" H 5700 4550 60  0001 C CNN
F 3 "" H 5725 5000 60  0000 C CNN
	1    5700 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5700 4600 5700 4700
Wire Wire Line
	5700 5100 5700 5250
$Comp
L R_US R29
U 1 1 5A0BD777
P 5250 4450
F 0 "R29" H 5275 4550 60  0000 C CNN
F 1 "1Meg" H 5275 4350 60  0000 C CNN
F 2 "paddle:R_0603" H 5250 4100 60  0001 C CNN
F 3 "" H 5275 4550 60  0000 C CNN
	1    5250 4450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5150 4200 5700 4200
Wire Wire Line
	5250 4200 5250 4250
Connection ~ 5700 4200
Wire Wire Line
	5250 4650 5250 4750
Connection ~ 5250 4200
Wire Wire Line
	5700 3650 7650 3650
$Comp
L R_US R18
U 1 1 5A0BE1FB
P 4950 4200
F 0 "R18" H 4975 4300 60  0000 C CNN
F 1 "100k" H 4975 4100 60  0000 C CNN
F 2 "paddle:R_0603" H 4950 3850 60  0001 C CNN
F 3 "" H 4975 4300 60  0000 C CNN
	1    4950 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4200 4650 4200
Text Notes 6250 5500 0    60   ~ 0
S
Text Notes 6200 5000 0    60   ~ 0
D
$EndSCHEMATC
