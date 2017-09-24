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
$Descr A 11000 8500
encoding utf-8
Sheet 1 7
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
L OPA333 U101
U 1 1 594DCA25
P 2250 6600
F 0 "U101" H 2250 6850 60  0000 L CNN
F 1 "OPA333" H 2250 6750 60  0000 L CNN
F 2 "paddle:sot23-5" H 2250 6450 30  0001 L CNN
F 3 "" H 2250 6600 60  0000 C CNN
	1    2250 6600
	1    0    0    -1  
$EndComp
$Comp
L R_US R101
U 1 1 5951AA39
P 1000 6250
F 0 "R101" H 1025 6350 60  0000 C CNN
F 1 "10k" H 1025 6150 60  0000 C CNN
F 2 "paddle:SMD_0805" H 1000 5900 60  0001 C CNN
F 3 "" H 1025 6350 60  0000 C CNN
	1    1000 6250
	0    1    1    0   
$EndComp
$Comp
L R_US R102
U 1 1 5951AAA3
P 1000 6700
F 0 "R102" H 1025 6800 60  0000 C CNN
F 1 "0" H 1025 6600 60  0000 C CNN
F 2 "paddle:SMD_0805" H 1000 6350 60  0001 C CNN
F 3 "" H 1025 6800 60  0000 C CNN
	1    1000 6700
	0    1    1    0   
$EndComp
$Comp
L GND #PWR106
U 1 1 5951AD19
P 1000 6900
F 0 "#PWR106" H 1000 6650 50  0001 C CNN
F 1 "GND" H 1000 6750 50  0000 C CNN
F 2 "" H 1000 6900 50  0001 C CNN
F 3 "" H 1000 6900 50  0001 C CNN
	1    1000 6900
	1    0    0    -1  
$EndComp
Text Label 2450 750  0    60   ~ 0
IN_0
Text Label 2450 850  0    60   ~ 0
IN_1
Text Label 2450 950  0    60   ~ 0
IN_2
Text Label 2450 1050 0    60   ~ 0
IN_3
$Comp
L C_Small C101
U 1 1 5957CBF5
P 2650 6150
F 0 "C101" H 2660 6220 50  0000 L CNN
F 1 "0.1uF" H 2660 6070 50  0000 L CNN
F 2 "paddle:SMD_0805" H 2650 6150 50  0001 C CNN
F 3 "" H 2650 6150 50  0001 C CNN
	1    2650 6150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR113
U 1 1 5957CBFB
P 2650 6300
F 0 "#PWR113" H 2650 6050 50  0001 C CNN
F 1 "GND" H 2650 6150 50  0000 C CNN
F 2 "" H 2650 6300 50  0001 C CNN
F 3 "" H 2650 6300 50  0001 C CNN
	1    2650 6300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR111
U 1 1 59689ED6
P 2200 6950
F 0 "#PWR111" H 2200 6700 50  0001 C CNN
F 1 "GND" H 2200 6800 50  0000 C CNN
F 2 "" H 2200 6950 50  0001 C CNN
F 3 "" H 2200 6950 50  0001 C CNN
	1    2200 6950
	1    0    0    -1  
$EndComp
$Comp
L FGPMMOPA6H U104
U 1 1 59A1EEB6
P 9200 1650
F 0 "U104" H 8600 2300 60  0000 C CNN
F 1 "FGPMMOPA6H GPS" H 9200 2300 60  0000 C CNN
F 2 "paddle:FGPMMOPA6H" H 8875 1550 60  0001 C CNN
F 3 "" H 8875 1550 60  0001 C CNN
	1    9200 1650
	1    0    0    -1  
$EndComp
$Comp
L MICROSD M101
U 1 1 59A1DC4D
P 9750 3400
F 0 "M101" H 9750 3400 45  0001 C CNN
F 1 "MICROSD" H 9750 3400 45  0001 C CNN
F 2 "adafruit:MICROSD" H 9780 3550 20  0001 C CNN
F 3 "" H 9750 3400 60  0001 C CNN
	1    9750 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR141
U 1 1 59A2EF86
P 8950 4300
F 0 "#PWR141" H 8950 4050 50  0001 C CNN
F 1 "GND" H 8950 4150 50  0000 C CNN
F 2 "" H 8950 4300 50  0001 C CNN
F 3 "" H 8950 4300 50  0001 C CNN
	1    8950 4300
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR138
U 1 1 59AC0F60
P 8450 3750
F 0 "#PWR138" H 8450 3600 50  0001 C CNN
F 1 "+3.3V" H 8450 3890 50  0000 C CNN
F 2 "" H 8450 3750 50  0001 C CNN
F 3 "" H 8450 3750 50  0001 C CNN
	1    8450 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR136
U 1 1 59AC1419
P 8200 2100
F 0 "#PWR136" H 8200 1850 50  0001 C CNN
F 1 "GND" H 8200 1950 50  0000 C CNN
F 2 "" H 8200 2100 50  0001 C CNN
F 3 "" H 8200 2100 50  0001 C CNN
	1    8200 2100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR132
U 1 1 59AC1566
P 7350 1100
F 0 "#PWR132" H 7350 950 50  0001 C CNN
F 1 "+3.3V" H 7350 1240 50  0000 C CNN
F 2 "" H 7350 1100 50  0001 C CNN
F 3 "" H 7350 1100 50  0001 C CNN
	1    7350 1100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR143
U 1 1 59AC2CAA
P 10100 1450
F 0 "#PWR143" H 10100 1200 50  0001 C CNN
F 1 "GND" H 10100 1300 50  0000 C CNN
F 2 "" H 10100 1450 50  0001 C CNN
F 3 "" H 10100 1450 50  0001 C CNN
	1    10100 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR145
U 1 1 59AC2D38
P 10150 2050
F 0 "#PWR145" H 10150 1800 50  0001 C CNN
F 1 "GND" H 10150 1900 50  0000 C CNN
F 2 "" H 10150 2050 50  0001 C CNN
F 3 "" H 10150 2050 50  0001 C CNN
	1    10150 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR137
U 1 1 59AC302A
P 8300 1500
F 0 "#PWR137" H 8300 1250 50  0001 C CNN
F 1 "GND" H 8300 1350 50  0000 C CNN
F 2 "" H 8300 1500 50  0001 C CNN
F 3 "" H 8300 1500 50  0001 C CNN
	1    8300 1500
	1    0    0    -1  
$EndComp
$Sheet
S 3200 1550 950  1250
U 59AC068D
F0 "amp_ad0" 60
F1 "amp_ad.sch" 60
F2 "Vref" I L 3200 2350 60 
F3 "Analog_in" I L 3200 1850 60 
F4 "ADDR" I R 4150 1750 60 
F5 "SCK" I R 4150 2000 60 
F6 "SDA" I R 4150 2300 60 
F7 "Aux_in" I L 3200 2100 60 
F8 "ALERT" I R 4150 2600 60 
$EndSheet
$Comp
L GND #PWR133
U 1 1 59AE08F3
P 7550 4300
F 0 "#PWR133" H 7550 4050 50  0001 C CNN
F 1 "GND" H 7550 4150 50  0000 C CNN
F 2 "" H 7550 4300 50  0001 C CNN
F 3 "" H 7550 4300 50  0001 C CNN
	1    7550 4300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR125
U 1 1 59AE096A
P 5450 4350
F 0 "#PWR125" H 5450 4100 50  0001 C CNN
F 1 "GND" H 5450 4200 50  0000 C CNN
F 2 "" H 5450 4350 50  0001 C CNN
F 3 "" H 5450 4350 50  0001 C CNN
	1    5450 4350
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR121
U 1 1 59B50878
P 5100 2250
F 0 "#PWR121" H 5100 2100 50  0001 C CNN
F 1 "+3.3V" H 5100 2390 50  0000 C CNN
F 2 "" H 5100 2250 50  0001 C CNN
F 3 "" H 5100 2250 50  0001 C CNN
	1    5100 2250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR116
U 1 1 59B7DD18
P 4550 1750
F 0 "#PWR116" H 4550 1500 60  0001 C CNN
F 1 "GND" H 4550 1600 60  0000 C CNN
F 2 "" H 4550 1750 50  0001 C CNN
F 3 "" H 4550 1750 50  0001 C CNN
	1    4550 1750
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR115
U 1 1 59B7DF1A
P 4350 3300
F 0 "#PWR115" H 4350 3150 50  0001 C CNN
F 1 "+3.3V" H 4350 3440 50  0000 C CNN
F 2 "" H 4350 3300 50  0001 C CNN
F 3 "" H 4350 3300 50  0001 C CNN
	1    4350 3300
	1    0    0    -1  
$EndComp
Text Label 4600 1250 0    60   ~ 0
SDA
Text Label 7750 3200 0    60   ~ 0
SDA
Text Label 4300 1250 0    60   ~ 0
SCK
Text Label 4950 5300 0    60   ~ 0
SCK
Text Label 7750 2900 0    60   ~ 0
SCK
NoConn ~ 7400 3300
NoConn ~ 9950 1200
NoConn ~ 9950 1400
NoConn ~ 9950 1500
NoConn ~ 9950 1600
NoConn ~ 9950 1700
NoConn ~ 8450 1700
NoConn ~ 8450 1800
NoConn ~ 8450 1600
NoConn ~ 9950 1800
NoConn ~ 9950 1900
NoConn ~ 9950 2100
NoConn ~ 9050 2700
NoConn ~ 9050 2800
NoConn ~ 9050 3500
NoConn ~ 9050 3600
$Comp
L C_Small C103
U 1 1 59B969B1
P 5450 2550
F 0 "C103" H 5460 2620 50  0000 L CNN
F 1 "0.1uF" H 5460 2470 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5450 2550 50  0001 C CNN
F 3 "" H 5450 2550 50  0001 C CNN
	1    5450 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR124
U 1 1 59B969B8
P 5450 2700
F 0 "#PWR124" H 5450 2450 50  0001 C CNN
F 1 "GND" H 5450 2550 50  0000 C CNN
F 2 "" H 5450 2700 50  0001 C CNN
F 3 "" H 5450 2700 50  0001 C CNN
	1    5450 2700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C102
U 1 1 59B969BE
P 5200 2550
F 0 "C102" H 5210 2620 50  0000 L CNN
F 1 "10uF" H 5210 2470 50  0000 L CNN
F 2 "paddle:SMD_1206" H 5200 2550 50  0001 C CNN
F 3 "" H 5200 2550 50  0001 C CNN
	1    5200 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR122
U 1 1 59B969C5
P 5200 2700
F 0 "#PWR122" H 5200 2450 50  0001 C CNN
F 1 "GND" H 5200 2550 50  0000 C CNN
F 2 "" H 5200 2700 50  0001 C CNN
F 3 "" H 5200 2700 50  0001 C CNN
	1    5200 2700
	1    0    0    -1  
$EndComp
$Comp
L C_Small C106
U 1 1 59B97B23
P 7950 1400
F 0 "C106" H 7960 1470 50  0000 L CNN
F 1 "0.1uF" H 7960 1320 50  0000 L CNN
F 2 "paddle:SMD_0805" H 7950 1400 50  0001 C CNN
F 3 "" H 7950 1400 50  0001 C CNN
	1    7950 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR135
U 1 1 59B97B29
P 7950 1550
F 0 "#PWR135" H 7950 1300 50  0001 C CNN
F 1 "GND" H 7950 1400 50  0000 C CNN
F 2 "" H 7950 1550 50  0001 C CNN
F 3 "" H 7950 1550 50  0001 C CNN
	1    7950 1550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C105
U 1 1 59B97B2F
P 7700 1400
F 0 "C105" H 7710 1470 50  0000 L CNN
F 1 "10uF" H 7710 1320 50  0000 L CNN
F 2 "paddle:SMD_1206" H 7700 1400 50  0001 C CNN
F 3 "" H 7700 1400 50  0001 C CNN
	1    7700 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR134
U 1 1 59B97B35
P 7700 1550
F 0 "#PWR134" H 7700 1300 50  0001 C CNN
F 1 "GND" H 7700 1400 50  0000 C CNN
F 2 "" H 7700 1550 50  0001 C CNN
F 3 "" H 7700 1550 50  0001 C CNN
	1    7700 1550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C108
U 1 1 59B9A183
P 8700 4000
F 0 "C108" H 8710 4070 50  0000 L CNN
F 1 "0.1uF" H 8710 3920 50  0000 L CNN
F 2 "paddle:SMD_0805" H 8700 4000 50  0001 C CNN
F 3 "" H 8700 4000 50  0001 C CNN
	1    8700 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR140
U 1 1 59B9A189
P 8700 4150
F 0 "#PWR140" H 8700 3900 50  0001 C CNN
F 1 "GND" H 8700 4000 50  0000 C CNN
F 2 "" H 8700 4150 50  0001 C CNN
F 3 "" H 8700 4150 50  0001 C CNN
	1    8700 4150
	1    0    0    -1  
$EndComp
$Comp
L C_Small C107
U 1 1 59B9A18F
P 8450 4000
F 0 "C107" H 8460 4070 50  0000 L CNN
F 1 "10uF" H 8460 3920 50  0000 L CNN
F 2 "paddle:SMD_1206" H 8450 4000 50  0001 C CNN
F 3 "" H 8450 4000 50  0001 C CNN
	1    8450 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR139
U 1 1 59B9A195
P 8450 4150
F 0 "#PWR139" H 8450 3900 50  0001 C CNN
F 1 "GND" H 8450 4000 50  0000 C CNN
F 2 "" H 8450 4150 50  0001 C CNN
F 3 "" H 8450 4150 50  0001 C CNN
	1    8450 4150
	1    0    0    -1  
$EndComp
$Comp
L R_US R103
U 1 1 59B7F0A7
P 4300 950
F 0 "R103" H 4325 1050 60  0000 C CNN
F 1 "4.7k" H 4325 850 60  0000 C CNN
F 2 "paddle:SMD_0805" H 4300 600 60  0001 C CNN
F 3 "" H 4325 1050 60  0000 C CNN
	1    4300 950 
	0    1    1    0   
$EndComp
$Comp
L R_US R104
U 1 1 59B7F244
P 4600 950
F 0 "R104" H 4625 1050 60  0000 C CNN
F 1 "4.7k" H 4625 850 60  0000 C CNN
F 2 "paddle:SMD_0805" H 4600 600 60  0001 C CNN
F 3 "" H 4625 1050 60  0000 C CNN
	1    4600 950 
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR117
U 1 1 59B7F3F4
P 4600 750
F 0 "#PWR117" H 4600 600 50  0001 C CNN
F 1 "+3.3V" H 4600 890 50  0000 C CNN
F 2 "" H 4600 750 50  0001 C CNN
F 3 "" H 4600 750 50  0001 C CNN
	1    4600 750 
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR114
U 1 1 59B7F550
P 4300 750
F 0 "#PWR114" H 4300 600 50  0001 C CNN
F 1 "+3.3V" H 4300 890 50  0000 C CNN
F 2 "" H 4300 750 50  0001 C CNN
F 3 "" H 4300 750 50  0001 C CNN
	1    4300 750 
	1    0    0    -1  
$EndComp
Text Label 4950 6950 0    60   ~ 0
SCK
Text Label 4950 7250 0    60   ~ 0
SDA
Text Label 4950 5600 0    60   ~ 0
SDA
Text Label 4250 3950 0    60   ~ 0
SDA
Text Label 4250 3650 0    60   ~ 0
SCK
Text Label 7500 4000 0    60   ~ 0
BOOTLOAD*
Text Label 5350 3050 0    60   ~ 0
RESET*
$Comp
L C_Small C104
U 1 1 59B959B1
P 4900 3200
F 0 "C104" H 4910 3270 50  0000 L CNN
F 1 "1.0uF" H 4910 3120 50  0000 L CNN
F 2 "paddle:SMD_0805" H 4900 3200 50  0001 C CNN
F 3 "" H 4900 3200 50  0001 C CNN
	1    4900 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR119
U 1 1 59B95A61
P 4900 3350
F 0 "#PWR119" H 4900 3100 50  0001 C CNN
F 1 "GND" H 4900 3200 50  0000 C CNN
F 2 "" H 4900 3350 50  0001 C CNN
F 3 "" H 4900 3350 50  0001 C CNN
	1    4900 3350
	1    0    0    -1  
$EndComp
$Comp
L R_US R105
U 1 1 59B95CC2
P 4900 2800
F 0 "R105" H 4925 2900 60  0000 C CNN
F 1 "10k" H 4925 2700 60  0000 C CNN
F 2 "paddle:SMD_0805" H 4900 2450 60  0001 C CNN
F 3 "" H 4925 2900 60  0000 C CNN
	1    4900 2800
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR118
U 1 1 59B9713C
P 4900 2550
F 0 "#PWR118" H 4900 2400 50  0001 C CNN
F 1 "+3.3V" H 4900 2690 50  0000 C CNN
F 2 "" H 4900 2550 50  0001 C CNN
F 3 "" H 4900 2550 50  0001 C CNN
	1    4900 2550
	1    0    0    -1  
$EndComp
$Comp
L TEST TP103
U 1 1 59BE3AEC
P 5250 900
F 0 "TP103" H 5250 1200 50  0000 C BNN
F 1 "SDA" H 5250 1150 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 5250 900 50  0001 C CNN
F 3 "" H 5250 900 50  0001 C CNN
	1    5250 900 
	1    0    0    -1  
$EndComp
$Comp
L TEST TP104
U 1 1 59BE3B75
P 5500 900
F 0 "TP104" H 5500 1200 50  0000 C BNN
F 1 "SCK" H 5500 1150 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 5500 900 50  0001 C CNN
F 3 "" H 5500 900 50  0001 C CNN
	1    5500 900 
	1    0    0    -1  
$EndComp
Text Label 5250 900  0    60   ~ 0
SDA
Text Label 5500 900  0    60   ~ 0
SCK
$Comp
L TEST TP101
U 1 1 59BE52EA
P 2900 5950
F 0 "TP101" H 2900 6250 50  0000 C BNN
F 1 "AN1" H 2900 6200 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 2900 5950 50  0001 C CNN
F 3 "" H 2900 5950 50  0001 C CNN
	1    2900 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3950 4250 3950
Wire Wire Line
	8200 5500 8650 5500
Wire Wire Line
	4300 750  4300 750 
Wire Wire Line
	4300 1150 4300 1150
Wire Wire Line
	7600 3800 7400 3800
Wire Wire Line
	7600 2100 7600 3800
Wire Wire Line
	8450 2100 7600 2100
Wire Wire Line
	7500 2000 8450 2000
Wire Wire Line
	7500 3700 7500 2000
Wire Wire Line
	7400 3700 7500 3700
Wire Wire Line
	7400 3100 7950 3100
Wire Wire Line
	7400 3000 7950 3000
Connection ~ 8450 3800
Connection ~ 8700 3800
Wire Wire Line
	8700 3900 8700 3800
Wire Wire Line
	8450 4100 8450 4150
Wire Wire Line
	8700 4100 8700 4150
Connection ~ 7950 1200
Wire Wire Line
	7950 1200 7950 1300
Connection ~ 7700 1200
Wire Wire Line
	7700 1300 7700 1200
Wire Wire Line
	7700 1500 7700 1550
Wire Wire Line
	7950 1500 7950 1550
Connection ~ 5450 2350
Wire Wire Line
	5450 2350 5450 2450
Connection ~ 5200 2350
Wire Wire Line
	5200 2450 5200 2350
Wire Wire Line
	5200 2650 5200 2700
Wire Wire Line
	5450 2650 5450 2700
Wire Wire Line
	7750 2900 7400 2900
Wire Wire Line
	4250 3650 4150 3650
Wire Wire Line
	4950 5300 4800 5300
Connection ~ 4900 6950
Connection ~ 4900 5600
Wire Wire Line
	4950 7250 4800 7250
Wire Wire Line
	4800 5600 4950 5600
Wire Wire Line
	4900 5050 4900 5600
Wire Wire Line
	4800 5050 4900 5050
Wire Wire Line
	7400 3200 7750 3200
Wire Wire Line
	4800 6950 4950 6950
Wire Wire Line
	4900 6700 4900 6950
Wire Wire Line
	4800 6700 4900 6700
Wire Wire Line
	4350 3300 4350 3400
Wire Wire Line
	4150 1750 4550 1750
Wire Wire Line
	1450 5600 1450 5400
Wire Wire Line
	2600 6600 2950 6600
Connection ~ 2600 6600
Connection ~ 2200 5950
Wire Wire Line
	5100 2350 5100 2250
Wire Wire Line
	5100 2350 5600 2350
Connection ~ 7550 4200
Wire Wire Line
	7400 4100 7550 4100
Wire Wire Line
	5450 4250 5450 4350
Wire Wire Line
	5550 4250 5450 4250
Wire Wire Line
	7550 4100 7550 4300
Wire Wire Line
	7400 4200 7550 4200
Wire Wire Line
	8300 3400 8300 3600
Wire Wire Line
	8300 3600 7400 3600
Wire Wire Line
	8300 1400 8300 1500
Wire Wire Line
	8450 1400 8300 1400
Wire Wire Line
	10150 2000 9950 2000
Wire Wire Line
	10150 2050 10150 2000
Wire Wire Line
	10100 1300 10100 1450
Wire Wire Line
	9950 1300 10100 1300
Wire Wire Line
	7350 1200 7350 1100
Wire Wire Line
	7350 1200 8450 1200
Wire Wire Line
	8200 1900 8200 2100
Wire Wire Line
	8450 1900 8200 1900
Wire Wire Line
	8450 3750 8450 3900
Wire Wire Line
	8450 3800 9050 3800
Wire Wire Line
	9050 3400 8300 3400
Wire Wire Line
	8250 3500 7400 3500
Wire Wire Line
	8250 3300 8250 3500
Wire Wire Line
	9050 3300 8250 3300
Wire Wire Line
	8750 2800 7400 2800
Wire Wire Line
	8750 3200 8750 2800
Wire Wire Line
	9050 3200 8750 3200
Wire Wire Line
	8200 3100 9050 3100
Wire Wire Line
	8200 3400 8200 3100
Wire Wire Line
	7400 3400 8200 3400
Connection ~ 8950 4100
Wire Wire Line
	9050 3900 8950 3900
Connection ~ 8950 4200
Wire Wire Line
	9050 4100 8950 4100
Wire Wire Line
	8950 3900 8950 4300
Wire Wire Line
	8950 4200 9050 4200
Wire Wire Line
	2200 6900 2200 6950
Wire Wire Line
	1000 6900 1000 6900
Wire Wire Line
	2200 5950 2650 5950
Wire Wire Line
	2650 5950 2650 6050
Wire Wire Line
	2650 6250 2650 6300
Wire Wire Line
	1700 750  1850 750 
Wire Wire Line
	2200 5850 2200 6300
Wire Wire Line
	2600 7200 2600 6600
Wire Wire Line
	1900 7200 2600 7200
Wire Wire Line
	1900 6700 1900 7200
Connection ~ 1000 6500
Wire Wire Line
	1000 6500 1100 6500
Wire Wire Line
	1000 6450 1000 6500
Wire Wire Line
	7400 4000 7500 4000
Wire Wire Line
	4900 3300 4900 3350
Wire Wire Line
	4900 2550 4900 2600
$Comp
L BME280 U102
U 1 1 59C0D1CA
P 6350 1400
F 0 "U102" H 6350 850 60  0000 C CNN
F 1 "BME280" H 6350 1450 60  0000 C CNN
F 2 "paddle:BME280" H 6025 950 60  0001 C CNN
F 3 "" H 6025 950 60  0001 C CNN
	1    6350 1400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR127
U 1 1 59C0EBF9
P 5650 1200
F 0 "#PWR127" H 5650 950 50  0001 C CNN
F 1 "GND" H 5650 1050 50  0000 C CNN
F 2 "" H 5650 1200 50  0001 C CNN
F 3 "" H 5650 1200 50  0001 C CNN
	1    5650 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1200 5650 1150
Wire Wire Line
	5650 1150 5750 1150
$Comp
L GND #PWR131
U 1 1 59C0F17C
P 7200 1350
F 0 "#PWR131" H 7200 1100 50  0001 C CNN
F 1 "GND" H 7200 1200 50  0000 C CNN
F 2 "" H 7200 1350 50  0001 C CNN
F 3 "" H 7200 1350 50  0001 C CNN
	1    7200 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 1350 7200 1300
Wire Wire Line
	7200 1300 6950 1300
$Comp
L +3.3V #PWR129
U 1 1 59C0F634
P 6950 1000
F 0 "#PWR129" H 6950 850 50  0001 C CNN
F 1 "+3.3V" H 6950 1140 50  0000 C CNN
F 2 "" H 6950 1000 50  0001 C CNN
F 3 "" H 6950 1000 50  0001 C CNN
	1    6950 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1000 6950 1450
Text Label 5750 1450 0    60   ~ 0
SDA
Text Label 5750 1600 0    60   ~ 0
SCK
Connection ~ 6950 1150
$Comp
L +3.3V #PWR123
U 1 1 59C0FB93
P 5450 1200
F 0 "#PWR123" H 5450 1050 50  0001 C CNN
F 1 "+3.3V" H 5450 1340 50  0000 C CNN
F 2 "" H 5450 1200 50  0001 C CNN
F 3 "" H 5450 1200 50  0001 C CNN
	1    5450 1200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR130
U 1 1 59C0FDC1
P 6950 1700
F 0 "#PWR130" H 6950 1450 50  0001 C CNN
F 1 "GND" H 6950 1550 50  0000 C CNN
F 2 "" H 6950 1700 50  0001 C CNN
F 3 "" H 6950 1700 50  0001 C CNN
	1    6950 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 1600 6950 1700
Wire Wire Line
	5450 1300 5750 1300
NoConn ~ 8450 1300
$Comp
L TEST TP102
U 1 1 59C47A6B
P 5000 900
F 0 "TP102" H 5000 1200 50  0000 C BNN
F 1 "GND" H 5000 1150 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 5000 900 50  0001 C CNN
F 3 "" H 5000 900 50  0001 C CNN
	1    5000 900 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR120
U 1 1 59C47B7B
P 5000 900
F 0 "#PWR120" H 5000 650 50  0001 C CNN
F 1 "GND" H 5000 750 50  0000 C CNN
F 2 "" H 5000 900 50  0001 C CNN
F 3 "" H 5000 900 50  0001 C CNN
	1    5000 900 
	1    0    0    -1  
$EndComp
$Sheet
S 3200 3200 950  1250
U 59C4FDAB
F0 "amp_ad1" 60
F1 "amp_ad.sch" 60
F2 "Vref" I L 3200 4000 60 
F3 "Analog_in" I L 3200 3500 60 
F4 "ADDR" I R 4150 3400 60 
F5 "SCK" I R 4150 3650 60 
F6 "SDA" I R 4150 3950 60 
F7 "Aux_in" I L 3200 3750 60 
F8 "ALERT" I R 4150 4250 60 
$EndSheet
$Sheet
S 3850 4850 950  1250
U 59C51325
F0 "amp_ad2" 60
F1 "amp_ad.sch" 60
F2 "Vref" I L 3850 5650 60 
F3 "Analog_in" I L 3850 5150 60 
F4 "ADDR" I R 4800 5050 60 
F5 "SCK" I R 4800 5300 60 
F6 "SDA" I R 4800 5600 60 
F7 "Aux_in" I L 3850 5400 60 
F8 "ALERT" I R 4800 5900 60 
$EndSheet
$Sheet
S 3850 6500 950  1250
U 59C515B1
F0 "amp_ad3" 60
F1 "amp_ad.sch" 60
F2 "Vref" I L 3850 7300 60 
F3 "Analog_in" I L 3850 6800 60 
F4 "ADDR" I R 4800 6700 60 
F5 "SCK" I R 4800 6950 60 
F6 "SDA" I R 4800 7250 60 
F7 "Aux_in" I L 3850 7050 60 
F8 "ALERT" I R 4800 7550 60 
$EndSheet
Wire Wire Line
	4350 3400 4150 3400
$Comp
L ESP32-WROOM U103
U 1 1 599FE750
P 6500 3550
F 0 "U103" H 5800 4800 60  0000 C CNN
F 1 "ESP32-WROOM" H 6450 3550 60  0000 C CNN
F 2 "paddle:ESP32-WROOM" H 6850 4900 60  0001 C CNN
F 3 "" H 6050 4000 60  0001 C CNN
	1    6500 3550
	1    0    0    -1  
$EndComp
Text Label 4250 2600 0    60   ~ 0
ALERT0
Wire Wire Line
	4150 2600 4250 2600
Text Label 4250 4250 0    60   ~ 0
ALERT1
Wire Wire Line
	4150 4250 4250 4250
Text Label 4900 5900 0    60   ~ 0
ALERT2
Wire Wire Line
	4800 5900 4900 5900
Text Label 4900 7550 0    60   ~ 0
ALERT3
Wire Wire Line
	4800 7550 4900 7550
Text Label 5450 3550 2    60   ~ 0
ALERT0
Text Label 5450 3650 2    60   ~ 0
ALERT1
Text Label 5450 3350 2    60   ~ 0
ALERT2
Text Label 5450 3450 2    60   ~ 0
ALERT3
$Sheet
S 6300 5100 1050 1400
U 59C7A5C1
F0 "USB" 60
F1 "USB.sch" 60
F2 "TXD" I R 7350 5550 60 
F3 "RXD" I R 7350 5800 60 
F4 "RESET*" I R 7350 6050 60 
F5 "BOOTLOAD*" I R 7350 6300 60 
F6 "+VBUS" I R 7350 5300 60 
$EndSheet
Text Label 7950 3000 0    60   ~ 0
RXD
Text Label 7950 3100 0    60   ~ 0
TXD
Text Label 7550 5550 0    60   ~ 0
TXD
Text Label 7550 5800 0    60   ~ 0
RXD
Wire Wire Line
	7550 5550 7350 5550
Wire Wire Line
	7350 5800 7550 5800
Wire Wire Line
	7350 5300 8200 5300
Wire Wire Line
	8200 5300 8200 5500
$Sheet
S 8650 5100 1050 1400
U 59B548AE
F0 "Power" 60
F1 "power.sch" 60
F2 "KEEPALIVE" I L 8650 6000 60 
F3 "SHUTDOWN*" O R 9700 6150 60 
F4 "+VBUS" I L 8650 5500 60 
F6 "+3.3V" I R 9700 5450 60 
F7 "+3.3VA" I R 9700 5800 60 
$EndSheet
Text Label 7550 6300 0    60   ~ 0
BOOTLOAD*
Wire Wire Line
	7350 6300 7550 6300
Text Label 7550 6050 0    60   ~ 0
RESET*
Wire Wire Line
	7550 6050 7350 6050
NoConn ~ 6250 4600
NoConn ~ 6350 4600
NoConn ~ 6450 4600
NoConn ~ 6550 4600
NoConn ~ 6650 4600
NoConn ~ 6750 4600
Wire Wire Line
	9700 5450 9950 5450
$Comp
L +3.3V #PWR142
U 1 1 59C9D32F
P 9950 5400
F 0 "#PWR142" H 9950 5250 50  0001 C CNN
F 1 "+3.3V" H 9950 5540 50  0000 C CNN
F 2 "" H 9950 5400 50  0001 C CNN
F 3 "" H 9950 5400 50  0001 C CNN
	1    9950 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 5450 9950 5400
Text Label 8500 6000 2    60   ~ 0
KEEPALIVE
Text Label 9900 6150 0    60   ~ 0
SHUTDOWN*
Wire Wire Line
	8500 6000 8650 6000
Text Label 5450 3750 2    60   ~ 0
SHUTDOWN*
Text Label 5450 3850 2    60   ~ 0
KEEPALIVE
Wire Wire Line
	5450 3850 5550 3850
Wire Wire Line
	5550 3750 5450 3750
Wire Wire Line
	5450 3350 5550 3350
Wire Wire Line
	5550 3450 5450 3450
Wire Wire Line
	5450 3550 5550 3550
Wire Wire Line
	5550 3650 5450 3650
$Comp
L GND #PWR128
U 1 1 59CA6D82
P 6050 4650
F 0 "#PWR128" H 6050 4400 50  0001 C CNN
F 1 "GND" H 6050 4500 50  0000 C CNN
F 2 "" H 6050 4650 50  0001 C CNN
F 3 "" H 6050 4650 50  0001 C CNN
	1    6050 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4600 6050 4650
Wire Wire Line
	2500 1150 2350 1150
Wire Wire Line
	2450 1050 2350 1050
Wire Wire Line
	2350 950  2450 950 
Wire Wire Line
	2450 850  2350 850 
Wire Wire Line
	2350 750  2450 750 
Text Label 3000 1850 2    60   ~ 0
IN_0
Text Label 3000 2100 2    60   ~ 0
AUX_IN_0
Text Label 3000 2350 2    60   ~ 0
VREF
Wire Wire Line
	3000 2350 3200 2350
Wire Wire Line
	3200 2100 3000 2100
Wire Wire Line
	3000 1850 3200 1850
$Comp
L CONN_02X05 J101
U 1 1 59546D57
P 2100 950
F 0 "J101" H 2100 1250 50  0000 C CNN
F 1 "CONN_02X05" H 2100 650 50  0000 C CNN
F 2 "paddle:header-0.050-10-pin-through-hole" H 2100 -250 50  0001 C CNN
F 3 "" H 2100 -250 50  0001 C CNN
	1    2100 950 
	1    0    0    -1  
$EndComp
Text Label 3000 3500 2    60   ~ 0
IN_1
Text Label 3000 3750 2    60   ~ 0
AUX_IN_1
Text Label 3000 4000 2    60   ~ 0
VREF
Wire Wire Line
	3000 4000 3200 4000
Wire Wire Line
	3200 3750 3000 3750
Wire Wire Line
	3000 3500 3200 3500
Text Label 3650 5150 2    60   ~ 0
IN_2
Text Label 3650 5400 2    60   ~ 0
AUX_IN_2
Text Label 3650 5650 2    60   ~ 0
VREF
Wire Wire Line
	3650 5650 3850 5650
Wire Wire Line
	3850 5400 3650 5400
Wire Wire Line
	3650 5150 3850 5150
Text Label 3650 6800 2    60   ~ 0
IN_3
Text Label 3650 7050 2    60   ~ 0
AUX_IN_3
Text Label 3650 7300 2    60   ~ 0
VREF
Wire Wire Line
	3650 7300 3850 7300
Wire Wire Line
	3850 7050 3650 7050
Wire Wire Line
	3650 6800 3850 6800
Wire Wire Line
	2900 6600 2900 5950
$Comp
L TLVH431* U107
U 1 1 59C95B56
P 1450 6500
F 0 "U107" H 1750 6550 60  0000 C CNN
F 1 "DNP TLVH431" H 1800 6150 60  0000 C CNN
F 2 "paddle:SOT-23" H 1450 5500 60  0001 C CNN
F 3 "" H 1450 5500 60  0001 C CNN
	1    1450 6500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR108
U 1 1 59C95CD4
P 1450 7000
F 0 "#PWR108" H 1450 6750 50  0001 C CNN
F 1 "GND" H 1450 6850 50  0000 C CNN
F 2 "" H 1450 7000 50  0001 C CNN
F 3 "" H 1450 7000 50  0001 C CNN
	1    1450 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 6900 1450 7000
$Comp
L R_US R106
U 1 1 59C95F3D
P 1450 5800
F 0 "R106" H 1475 5900 60  0000 C CNN
F 1 "10k" H 1475 5700 60  0000 C CNN
F 2 "paddle:SMD_0805" H 1450 5450 60  0001 C CNN
F 3 "" H 1475 5900 60  0000 C CNN
	1    1450 5800
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 6000 1450 6100
Wire Wire Line
	700  6050 1750 6050
Connection ~ 1450 6050
Wire Wire Line
	1750 6050 1750 6500
Wire Wire Line
	1750 6500 1900 6500
$Comp
L C_Small C109
U 1 1 59C98128
P 700 6550
F 0 "C109" H 710 6620 50  0000 L CNN
F 1 "DNP 0.1uF" H 710 6470 50  0000 L CNN
F 2 "paddle:SMD_0805" H 700 6550 50  0001 C CNN
F 3 "" H 700 6550 50  0001 C CNN
	1    700  6550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR101
U 1 1 59C982B1
P 700 6800
F 0 "#PWR101" H 700 6550 50  0001 C CNN
F 1 "GND" H 700 6650 50  0000 C CNN
F 2 "" H 700 6800 50  0001 C CNN
F 3 "" H 700 6800 50  0001 C CNN
	1    700  6800
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  6650 700  6800
Wire Wire Line
	700  6450 700  6050
Connection ~ 1000 6050
Text Label 2950 6600 0    60   ~ 0
VREF
Connection ~ 2900 6600
Wire Wire Line
	9700 5800 10100 5800
Wire Wire Line
	10100 5800 10100 5750
$Comp
L +3.3VA #PWR144
U 1 1 59CBF826
P 10100 5750
F 0 "#PWR144" H 10100 5550 50  0001 C CNN
F 1 "+3.3VA" H 10100 5950 50  0000 C CNN
F 2 "" H 10100 5750 50  0001 C CNN
F 3 "" H 10100 5750 50  0001 C CNN
	1    10100 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 6150 9700 6150
$Comp
L +3.3VA #PWR110
U 1 1 59CC3CA0
P 2200 5850
F 0 "#PWR110" H 2200 5650 50  0001 C CNN
F 1 "+3.3VA" H 2200 6050 50  0000 C CNN
F 2 "" H 2200 5850 50  0001 C CNN
F 3 "" H 2200 5850 50  0001 C CNN
	1    2200 5850
	1    0    0    -1  
$EndComp
$Comp
L +3.3VA #PWR107
U 1 1 59CC3DDA
P 1450 5400
F 0 "#PWR107" H 1450 5200 50  0001 C CNN
F 1 "+3.3VA" H 1450 5600 50  0000 C CNN
F 2 "" H 1450 5400 50  0001 C CNN
F 3 "" H 1450 5400 50  0001 C CNN
	1    1450 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 1200 5450 1300
$Comp
L LED LED101
U 1 1 59CD77A5
P 5500 5250
F 0 "LED101" H 5450 5050 45  0000 L BNN
F 1 "LED" H 5450 4950 45  0000 L BNN
F 2 "a" H 5300 5280 20  0001 C CNN
F 3 "" V 5450 5250 60  0001 C CNN
	1    5500 5250
	0    1    1    0   
$EndComp
$Comp
L R_US R107
U 1 1 59CD7A80
P 5800 5000
F 0 "R107" H 5825 5100 60  0000 C CNN
F 1 "R_US" H 5825 4900 60  0000 C CNN
F 2 "" H 5800 4650 60  0001 C CNN
F 3 "" H 5825 5100 60  0000 C CNN
	1    5800 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 5000 5500 5000
Wire Wire Line
	5500 5000 5500 5100
Wire Wire Line
	6000 5000 6150 5000
Wire Wire Line
	6150 5000 6150 4600
$Comp
L GND #PWR126
U 1 1 59CD82F9
P 5500 5500
F 0 "#PWR126" H 5500 5250 50  0001 C CNN
F 1 "GND" H 5500 5350 50  0000 C CNN
F 2 "" H 5500 5500 50  0001 C CNN
F 3 "" H 5500 5500 50  0001 C CNN
	1    5500 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 5400 5500 5500
$Comp
L SP3003-04 U105
U 1 1 59CEA1F0
P 1350 2150
F 0 "U105" H 1100 2700 60  0000 C CNN
F 1 "SP3003-04" H 1500 2700 60  0000 C CNN
F 2 "" H 1350 1200 60  0001 C CNN
F 3 "" H 1350 1200 60  0001 C CNN
	1    1350 2150
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR102
U 1 1 59CEA1FB
P 750 1850
F 0 "#PWR102" H 750 1700 50  0001 C CNN
F 1 "+3.3V" H 750 1990 50  0000 C CNN
F 2 "" H 750 1850 50  0001 C CNN
F 3 "" H 750 1850 50  0001 C CNN
	1    750  1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  1950 750  1950
Wire Wire Line
	750  1950 750  1850
$Comp
L GND #PWR103
U 1 1 59CEA204
P 750 2400
F 0 "#PWR103" H 750 2150 50  0001 C CNN
F 1 "GND" H 750 2250 50  0000 C CNN
F 2 "" H 750 2400 50  0001 C CNN
F 3 "" H 750 2400 50  0001 C CNN
	1    750  2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  2400 750  2400
Text Label 2000 1850 0    60   ~ 0
IN_0
Text Label 2000 2050 0    60   ~ 0
IN_1
Text Label 2000 2250 0    60   ~ 0
IN_2
Text Label 2000 2450 0    60   ~ 0
IN_3
Wire Wire Line
	1850 1850 2000 1850
Wire Wire Line
	2000 2050 1850 2050
Wire Wire Line
	1850 2250 2000 2250
Wire Wire Line
	2000 2450 1850 2450
Wire Wire Line
	4600 1250 4600 1150
Text Label 1600 850  2    60   ~ 0
AUX_IN_0
$Comp
L +3.3VA #PWR109
U 1 1 59CF98E0
P 1700 700
F 0 "#PWR109" H 1700 500 50  0001 C CNN
F 1 "+3.3VA" H 1700 900 50  0000 C CNN
F 2 "" H 1700 700 50  0001 C CNN
F 3 "" H 1700 700 50  0001 C CNN
	1    1700 700 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 700  1700 750 
$Comp
L GND #PWR112
U 1 1 59CF9B81
P 2500 1250
F 0 "#PWR112" H 2500 1000 50  0001 C CNN
F 1 "GND" H 2500 1100 50  0000 C CNN
F 2 "" H 2500 1250 50  0001 C CNN
F 3 "" H 2500 1250 50  0001 C CNN
	1    2500 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1150 2500 1250
Text Label 1600 950  2    60   ~ 0
AUX_IN_1
Text Label 1600 1050 2    60   ~ 0
AUX_IN_2
Text Label 1600 1150 2    60   ~ 0
AUX_IN_3
Wire Wire Line
	1600 850  1850 850 
Wire Wire Line
	1850 950  1600 950 
Wire Wire Line
	1600 1050 1850 1050
Wire Wire Line
	1850 1150 1600 1150
$Comp
L SP3003-04 U106
U 1 1 59CFD381
P 1350 3800
F 0 "U106" H 1100 4350 60  0000 C CNN
F 1 "SP3003-04" H 1500 4350 60  0000 C CNN
F 2 "" H 1350 2850 60  0001 C CNN
F 3 "" H 1350 2850 60  0001 C CNN
	1    1350 3800
	-1   0    0    1   
$EndComp
$Comp
L +3.3V #PWR104
U 1 1 59CFD387
P 750 3500
F 0 "#PWR104" H 750 3350 50  0001 C CNN
F 1 "+3.3V" H 750 3640 50  0000 C CNN
F 2 "" H 750 3500 50  0001 C CNN
F 3 "" H 750 3500 50  0001 C CNN
	1    750  3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  3600 750  3600
Wire Wire Line
	750  3600 750  3500
$Comp
L GND #PWR105
U 1 1 59CFD38F
P 750 4050
F 0 "#PWR105" H 750 3800 50  0001 C CNN
F 1 "GND" H 750 3900 50  0000 C CNN
F 2 "" H 750 4050 50  0001 C CNN
F 3 "" H 750 4050 50  0001 C CNN
	1    750  4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  4050 750  4050
Text Label 2000 3500 0    60   ~ 0
IN_AUX_0
Text Label 2000 3700 0    60   ~ 0
AUX_IN_1
Text Label 2000 3900 0    60   ~ 0
AUX_IN_2
Text Label 2000 4100 0    60   ~ 0
AUX_IN_3
Wire Wire Line
	1850 3500 2000 3500
Wire Wire Line
	2000 3700 1850 3700
Wire Wire Line
	1850 3900 2000 3900
Wire Wire Line
	2000 4100 1850 4100
Wire Wire Line
	5550 2850 5600 2850
Wire Wire Line
	5600 2850 5600 2350
Wire Wire Line
	4900 3000 4900 3100
Wire Wire Line
	5550 3050 4900 3050
Connection ~ 4900 3050
Wire Wire Line
	4300 1150 4300 1250
Text Label 4250 2300 0    60   ~ 0
SDA
Text Label 4250 2000 0    60   ~ 0
SCK
Wire Wire Line
	4150 2300 4250 2300
Wire Wire Line
	4250 2000 4150 2000
Wire Wire Line
	5550 2850 5550 2950
$EndSCHEMATC
