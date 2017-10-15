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
$Descr A4 11693 8268
encoding utf-8
Sheet 12 12
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
L CP2104 U203
U 1 1 59C7A894
P 5400 3300
F 0 "U203" H 5400 2000 60  0000 C CNN
F 1 "CP2102N" H 5400 1900 60  0000 C CNN
F 2 "paddle:QFN-24-1EP_4x4mm_Pitch0.5mm" H 5450 2350 60  0001 C CNN
F 3 "" H 5450 2350 60  0001 C CNN
	1    5400 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0129
U 1 1 59C7A89B
P 4500 2850
F 0 "#PWR0129" H 4500 2600 50  0001 C CNN
F 1 "GND" H 4500 2700 50  0000 C CNN
F 2 "" H 4500 2850 50  0001 C CNN
F 3 "" H 4500 2850 50  0001 C CNN
	1    4500 2850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C202
U 1 1 59C7A8A4
P 4400 2350
F 0 "C202" H 4410 2420 50  0000 L CNN
F 1 "0.1uF" H 4410 2270 50  0000 L CNN
F 2 "paddle:SMD_0805" H 4400 2350 50  0001 C CNN
F 3 "" H 4400 2350 50  0001 C CNN
	1    4400 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0130
U 1 1 59C7A8AB
P 4400 2500
F 0 "#PWR0130" H 4400 2250 50  0001 C CNN
F 1 "GND" H 4400 2350 50  0000 C CNN
F 2 "" H 4400 2500 50  0001 C CNN
F 3 "" H 4400 2500 50  0001 C CNN
	1    4400 2500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C201
U 1 1 59C7A8B1
P 4150 2350
F 0 "C201" H 4160 2420 50  0000 L CNN
F 1 "10uF" H 4160 2270 50  0000 L CNN
F 2 "paddle:SMD_1206" H 4150 2350 50  0001 C CNN
F 3 "" H 4150 2350 50  0001 C CNN
	1    4150 2350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0131
U 1 1 59C7A8B8
P 4150 2500
F 0 "#PWR0131" H 4150 2250 50  0001 C CNN
F 1 "GND" H 4150 2350 50  0000 C CNN
F 2 "" H 4150 2500 50  0001 C CNN
F 3 "" H 4150 2500 50  0001 C CNN
	1    4150 2500
	1    0    0    -1  
$EndComp
NoConn ~ 4650 4050
NoConn ~ 4650 4200
$Comp
L NPN_BEC_SOT-23 Q201
U 1 1 59C7A8C7
P 7900 5150
F 0 "Q201" H 8100 5225 50  0000 L CNN
F 1 "MMBT4401" H 8100 5150 50  0000 L CNN
F 2 "paddle:SOT-23" H 8100 5075 50  0001 L CIN
F 3 "" H 7900 5150 50  0001 L CNN
	1    7900 5150
	1    0    0    -1  
$EndComp
$Comp
L NPN_BEC_SOT-23 Q202
U 1 1 59C7A8CE
P 7950 3600
F 0 "Q202" H 8150 3675 50  0000 L CNN
F 1 "MMBT4401" H 8150 3600 50  0000 L CNN
F 2 "paddle:SOT-23" H 8150 3525 50  0001 L CIN
F 3 "" H 7950 3600 50  0001 L CNN
	1    7950 3600
	1    0    0    -1  
$EndComp
$Comp
L R_US R205
U 1 1 59C7A8D5
P 7300 5150
F 0 "R205" H 7325 5250 60  0000 C CNN
F 1 "10k" H 7325 5050 60  0000 C CNN
F 2 "paddle:SMD_0805" H 7300 4800 60  0001 C CNN
F 3 "" H 7325 5250 60  0000 C CNN
	1    7300 5150
	-1   0    0    1   
$EndComp
$Comp
L R_US R204
U 1 1 59C7A8DC
P 7250 3600
F 0 "R204" H 7275 3700 60  0000 C CNN
F 1 "10k" H 7275 3500 60  0000 C CNN
F 2 "paddle:SMD_0805" H 7250 3250 60  0001 C CNN
F 3 "" H 7275 3700 60  0000 C CNN
	1    7250 3600
	-1   0    0    -1  
$EndComp
NoConn ~ 6150 2950
NoConn ~ 6150 3100
NoConn ~ 6150 2500
NoConn ~ 6150 2350
Text HLabel 9300 3900 2    60   Input ~ 0
TXD
Text HLabel 9000 4050 2    60   Input ~ 0
RXD
Text HLabel 8050 3100 2    60   Input ~ 0
RESET*
Text HLabel 8000 4700 2    60   Input ~ 0
BOOTLOAD*
Text HLabel 3950 3250 2    60   Input ~ 0
+VBUS
$Comp
L LED LED202
U 1 1 59C748D3
P 7300 2950
F 0 "LED202" H 7250 2750 45  0000 L BNN
F 1 "LED" H 7100 2750 45  0000 L BNN
F 2 "paddle:SMD_D_0805" H 7100 2980 20  0001 C CNN
F 3 "" V 7250 2950 60  0001 C CNN
	1    7300 2950
	1    0    0    -1  
$EndComp
$Comp
L R_US R203
U 1 1 59C74976
P 6800 2950
F 0 "R203" H 6825 3050 60  0000 C CNN
F 1 "330" H 6825 2850 60  0000 C CNN
F 2 "paddle:R_0805" H 6800 2600 60  0001 C CNN
F 3 "" H 6825 3050 60  0000 C CNN
	1    6800 2950
	1    0    0    -1  
$EndComp
$Comp
L LED LED201
U 1 1 59C74B26
P 7300 2650
F 0 "LED201" H 7250 2450 45  0000 L BNN
F 1 "LED" H 7100 2450 45  0000 L BNN
F 2 "paddle:SMD_D_0805" H 7100 2680 20  0001 C CNN
F 3 "" V 7250 2650 60  0001 C CNN
	1    7300 2650
	1    0    0    -1  
$EndComp
$Comp
L R_US R202
U 1 1 59C74B2C
P 6800 2650
F 0 "R202" H 6825 2750 60  0000 C CNN
F 1 "330" H 6825 2550 60  0000 C CNN
F 2 "paddle:R_0805" H 6800 2300 60  0001 C CNN
F 3 "" H 6825 2750 60  0000 C CNN
	1    6800 2650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0132
U 1 1 59C74BF4
P 7650 2750
F 0 "#PWR0132" H 7650 2500 50  0001 C CNN
F 1 "GND" H 7650 2600 50  0000 C CNN
F 2 "" H 7650 2750 50  0001 C CNN
F 3 "" H 7650 2750 50  0001 C CNN
	1    7650 2750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0133
U 1 1 59C74C20
P 7600 3050
F 0 "#PWR0133" H 7600 2800 50  0001 C CNN
F 1 "GND" H 7600 2900 50  0000 C CNN
F 2 "" H 7600 3050 50  0001 C CNN
F 3 "" H 7600 3050 50  0001 C CNN
	1    7600 3050
	1    0    0    -1  
$EndComp
$Comp
L R_US R201
U 1 1 59C74D40
P 6500 2200
F 0 "R201" H 6525 2300 60  0000 C CNN
F 1 "1k" H 6525 2100 60  0000 C CNN
F 2 "paddle:R_0805" H 6500 1850 60  0001 C CNN
F 3 "" H 6525 2300 60  0000 C CNN
	1    6500 2200
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR0134
U 1 1 59C74D81
P 3900 2100
F 0 "#PWR0134" H 3900 1950 50  0001 C CNN
F 1 "+3.3V" H 3900 2240 50  0000 C CNN
F 2 "" H 3900 2100 50  0001 C CNN
F 3 "" H 3900 2100 50  0001 C CNN
	1    3900 2100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR0135
U 1 1 59C74E3F
P 6900 2100
F 0 "#PWR0135" H 6900 1950 50  0001 C CNN
F 1 "+3.3V" H 6900 2240 50  0000 C CNN
F 2 "" H 6900 2100 50  0001 C CNN
F 3 "" H 6900 2100 50  0001 C CNN
	1    6900 2100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0136
U 1 1 59CE40B1
P 2500 4350
F 0 "#PWR0136" H 2500 4100 50  0001 C CNN
F 1 "GND" H 2500 4200 50  0000 C CNN
F 2 "" H 2500 4350 50  0001 C CNN
F 3 "" H 2500 4350 50  0001 C CNN
	1    2500 4350
	1    0    0    -1  
$EndComp
$Comp
L USB_B_Socket U201
U 1 1 59CE57D2
P 1750 3800
F 0 "U201" H 1700 3150 60  0000 C CNN
F 1 "USB_B_Socket" H 1750 3050 60  0000 C CNN
F 2 "paddle:USB_micro_B_FCI_10104110" H 1700 3150 60  0001 C CNN
F 3 "" H 1700 3150 60  0001 C CNN
	1    1750 3800
	1    0    0    -1  
$EndComp
NoConn ~ 2150 3900
$Comp
L SP3003-04 U202
U 1 1 59CE7D75
P 3500 4850
F 0 "U202" V 3500 4250 60  0000 C CNN
F 1 "SP3003-04" V 3750 4050 60  0000 C CNN
F 2 "paddle:SMD_SC70-6" H 3500 3900 60  0001 C CNN
F 3 "" H 3500 3900 60  0001 C CNN
	1    3500 4850
	0    1    1    0   
$EndComp
NoConn ~ 3800 4350
$Comp
L +3.3V #PWR0137
U 1 1 59CE83A8
P 3000 5450
F 0 "#PWR0137" H 3000 5300 50  0001 C CNN
F 1 "+3.3V" H 3000 5590 50  0000 C CNN
F 2 "" H 3000 5450 50  0001 C CNN
F 3 "" H 3000 5450 50  0001 C CNN
	1    3000 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0138
U 1 1 59CE8429
P 3750 5450
F 0 "#PWR0138" H 3750 5200 50  0001 C CNN
F 1 "GND" H 3750 5300 50  0000 C CNN
F 2 "" H 3750 5450 50  0001 C CNN
F 3 "" H 3750 5450 50  0001 C CNN
	1    3750 5450
	1    0    0    -1  
$EndComp
$Comp
L TEST TP202
U 1 1 59D07069
P 9300 3900
F 0 "TP202" H 9300 4200 50  0000 C BNN
F 1 "TXD" H 9300 4150 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 9300 3900 50  0001 C CNN
F 3 "" H 9300 3900 50  0001 C CNN
	1    9300 3900
	1    0    0    -1  
$EndComp
$Comp
L TEST TP201
U 1 1 59D07090
P 9000 4050
F 0 "TP201" H 9000 4350 50  0000 C BNN
F 1 "RXD" H 9000 4300 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 9000 4050 50  0001 C CNN
F 3 "" H 9000 4050 50  0001 C CNN
	1    9000 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 2850 4500 2800
Wire Wire Line
	4500 2800 4650 2800
Wire Wire Line
	4650 2200 4650 2350
Wire Wire Line
	4650 2350 4650 2500
Wire Wire Line
	4400 2450 4400 2500
Wire Wire Line
	4400 2200 4400 2250
Wire Wire Line
	4150 2450 4150 2500
Wire Wire Line
	3900 2200 4150 2200
Wire Wire Line
	4150 2200 4400 2200
Wire Wire Line
	4400 2200 4650 2200
Connection ~ 4400 2200
Connection ~ 4650 2350
Connection ~ 4650 2200
Connection ~ 6900 3600
Wire Wire Line
	8000 4700 8000 4900
Wire Wire Line
	8000 4900 8000 4950
Wire Wire Line
	8050 4200 8050 3800
Wire Wire Line
	6150 3600 6900 3600
Wire Wire Line
	6900 3600 7050 3600
Wire Wire Line
	6900 5500 8000 5500
Wire Wire Line
	8000 5500 8000 5350
Wire Wire Line
	7500 5150 7700 5150
Wire Wire Line
	7450 3600 7750 3600
Wire Wire Line
	6900 3600 6900 5500
Wire Wire Line
	6150 4200 6350 4200
Wire Wire Line
	6350 4200 8050 4200
Wire Wire Line
	6350 4200 6350 5150
Wire Wire Line
	8050 3100 8050 3300
Wire Wire Line
	8050 3300 8050 3400
Connection ~ 6350 4200
Wire Wire Line
	6350 5150 7100 5150
Wire Wire Line
	4150 2250 4150 2200
Connection ~ 4150 2200
Wire Wire Line
	6150 2650 6600 2650
Wire Wire Line
	7000 2650 7150 2650
Wire Wire Line
	6150 2800 6450 2800
Wire Wire Line
	6450 2800 6450 2950
Wire Wire Line
	6450 2950 6600 2950
Wire Wire Line
	7000 2950 7150 2950
Wire Wire Line
	7450 2650 7650 2650
Wire Wire Line
	7650 2650 7650 2750
Wire Wire Line
	7450 2950 7600 2950
Wire Wire Line
	7600 2950 7600 3050
Wire Wire Line
	3900 2100 3900 2200
Wire Wire Line
	6300 2200 6150 2200
Wire Wire Line
	6900 2100 6900 2200
Wire Wire Line
	6900 2200 6700 2200
Wire Wire Line
	2150 4200 2250 4200
Wire Wire Line
	2250 4200 2500 4200
Wire Wire Line
	2500 4200 2500 4350
Wire Wire Line
	2150 3450 3200 3450
Wire Wire Line
	3200 3450 3900 3450
Wire Wire Line
	3900 3450 4650 3450
Wire Wire Line
	2150 4050 2250 4050
Wire Wire Line
	2250 4050 2250 4200
Connection ~ 2250 4200
Wire Wire Line
	3900 3450 3900 3250
Wire Wire Line
	3900 3250 3950 3250
Connection ~ 3900 3450
Wire Wire Line
	3200 4350 3200 3450
Connection ~ 3200 3450
Wire Wire Line
	3600 4350 3600 3750
Connection ~ 3600 3750
Wire Wire Line
	3300 5350 3300 5600
Wire Wire Line
	3300 5600 3000 5600
Wire Wire Line
	3000 5600 3000 5450
Wire Wire Line
	3750 5350 3750 5450
Wire Wire Line
	8600 3300 8050 3300
Connection ~ 8050 3300
Wire Wire Line
	9000 3300 9150 3300
Wire Wire Line
	9150 3300 9150 3400
Wire Wire Line
	8650 4900 8000 4900
Connection ~ 8000 4900
Wire Wire Line
	9050 4900 9200 4900
Wire Wire Line
	9200 4900 9200 5000
$Comp
L GND #PWR0139
U 1 1 59CC74B7
P 9200 5000
F 0 "#PWR0139" H 9200 4750 50  0001 C CNN
F 1 "GND" H 9200 4850 50  0000 C CNN
F 2 "" H 9200 5000 50  0001 C CNN
F 3 "" H 9200 5000 50  0001 C CNN
	1    9200 5000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR0140
U 1 1 59CC74F8
P 9150 3400
F 0 "#PWR0140" H 9150 3150 50  0001 C CNN
F 1 "GND" H 9150 3250 50  0000 C CNN
F 2 "" H 9150 3400 50  0001 C CNN
F 3 "" H 9150 3400 50  0001 C CNN
	1    9150 3400
	1    0    0    -1  
$EndComp
NoConn ~ 6150 4350
NoConn ~ 6150 3450
NoConn ~ 6150 3300
NoConn ~ 6150 3750
Wire Wire Line
	4650 2800 4650 2950
Connection ~ 4650 2800
Connection ~ 3400 3600
Wire Wire Line
	3400 4350 3400 3600
Wire Wire Line
	2150 3600 2750 3600
Wire Wire Line
	2750 3600 2750 3750
Wire Wire Line
	2750 3750 3600 3750
Wire Wire Line
	3600 3750 4650 3750
Wire Wire Line
	2150 3750 2650 3750
Wire Wire Line
	2650 3750 2650 3700
Wire Wire Line
	2650 3700 2850 3700
Wire Wire Line
	2850 3700 2850 3600
Wire Wire Line
	2850 3600 3400 3600
Wire Wire Line
	3400 3600 4650 3600
$Comp
L SWITCH_PUSHBUTTON SW201
U 1 1 59D20095
P 8800 3300
F 0 "SW201" H 8700 3440 45  0000 L BNN
F 1 "SWITCH_PUSHBUTTON" H 8700 3210 45  0000 L BNN
F 2 "paddle:SW_KMR7" H 9100 3500 20  0001 C CNN
F 3 "" H 8800 3300 60  0001 C CNN
	1    8800 3300
	1    0    0    -1  
$EndComp
$Comp
L SWITCH_PUSHBUTTON SW202
U 1 1 59D200ED
P 8850 4900
F 0 "SW202" H 8750 5040 45  0000 L BNN
F 1 "SWITCH_PUSHBUTTON" H 8750 4810 45  0000 L BNN
F 2 "paddle:SW_KMR7" H 9150 5100 20  0001 C CNN
F 3 "" H 8850 4900 60  0001 C CNN
	1    8850 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 3900 9300 3900
Wire Wire Line
	9000 4050 6150 4050
$EndSCHEMATC
