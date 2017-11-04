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
Sheet 1 13
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
L R_US R101
U 1 1 59CCA424
P 3400 2850
F 0 "R101" H 3425 2950 60  0000 C CNN
F 1 "10k" H 3425 2750 60  0000 C CNN
F 2 "paddle:SMD_0805" H 3400 2500 60  0001 C CNN
F 3 "" H 3425 2950 60  0000 C CNN
	1    3400 2850
	0    1    1    0   
$EndComp
$Comp
L +3.3V #PWR105
U 1 1 59CCDE94
P 3400 2650
F 0 "#PWR105" H 3400 2500 50  0001 C CNN
F 1 "+3.3V" H 3400 2790 50  0000 C CNN
F 2 "" H 3400 2650 50  0001 C CNN
F 3 "" H 3400 2650 50  0001 C CNN
	1    3400 2650
	1    0    0    -1  
$EndComp
Text Label 3400 3200 0    60   ~ 0
BUSY*
Text Label 1500 3500 2    60   ~ 0
+V_UNREG_SW
Text Label 1500 3950 2    60   ~ 0
ENABLE_+3.3VA
Wire Wire Line
	3400 3200 3400 3050
Wire Wire Line
	1500 3500 1550 3500
Wire Wire Line
	1500 3950 1550 3950
Text Label 3300 3400 0    60   ~ 0
SDO_SPI
Text Label 3300 3800 0    60   ~ 0
SCLK_SPI
Text Label 3300 3600 0    60   ~ 0
SDO_SPI
Text Label 3300 4000 0    60   ~ 0
AN0_CS
Text Label 3300 4200 0    60   ~ 0
AN1_CS*
Text Label 3300 4400 0    60   ~ 0
AN2_CS*
Text Label 3300 4600 0    60   ~ 0
AN3_CS*
Text Label 1500 4350 2    60   ~ 0
AN_REFSEL
Wire Wire Line
	1500 4350 1550 4350
$Sheet
S 6250 2950 1350 2650
U 59FE1414
F0 "digital" 60
F1 "digital.sch" 60
F2 "BUSY*" I L 6250 3100 60 
F3 "CS_AN1*" O R 7600 3300 60 
F4 "CS_AN2*" O R 7600 3500 60 
F5 "CS_AN0*" O R 7600 3100 60 
F6 "I2C_SCK" B R 7600 3900 60 
F7 "I2C_SDA" B R 7600 4100 60 
F8 "SPI_SDI" I R 7600 4500 60 
F9 "SPI_SCLK" O R 7600 4300 60 
F10 "SPI_SDO" O R 7600 4700 60 
F11 "CS_AN3*" O R 7600 3700 60 
$EndSheet
Text Label 7950 1550 0    60   ~ 0
BUSY*
Text Label 7950 1650 0    60   ~ 0
SCLK_SPI
Text Label 7950 1750 0    60   ~ 0
SDO
Text Label 7950 1850 0    60   ~ 0
SDI
$Comp
L GND #PWR?
U 1 1 59FE79CA
P 6250 1600
F 0 "#PWR?" H 6250 1350 50  0001 C CNN
F 1 "GND" H 6250 1450 50  0000 C CNN
F 2 "" H 6250 1600 50  0001 C CNN
F 3 "" H 6250 1600 50  0001 C CNN
	1    6250 1600
	1    0    0    -1  
$EndComp
Text HLabel 7000 2050 0    60   Input ~ 0
CS0*
Text HLabel 7000 1950 0    60   Input ~ 0
CS1*
Text HLabel 7000 1850 0    60   Input ~ 0
CS2*
Text HLabel 7000 1750 0    60   Input ~ 0
CS3*
Text HLabel 7000 1650 0    60   Input ~ 0
AN_REFSEL
Wire Wire Line
	7550 1550 7950 1550
Wire Wire Line
	7550 1650 7950 1650
Wire Wire Line
	7550 1750 7950 1750
Wire Wire Line
	7550 1850 7950 1850
Wire Wire Line
	7050 1550 6250 1550
Wire Wire Line
	6250 1550 6250 1600
Wire Wire Line
	7000 1650 7050 1650
Wire Wire Line
	7050 1750 7000 1750
Wire Wire Line
	7000 1850 7050 1850
Wire Wire Line
	7050 1950 7000 1950
Wire Wire Line
	7000 2050 7050 2050
Text HLabel 7650 2050 2    60   Input ~ 0
+V_UNREG_SW
Wire Wire Line
	7550 2050 7650 2050
$Comp
L CONN_02X07 J?
U 1 1 59FE79E2
P 7300 1850
F 0 "J?" H 7300 2250 50  0000 C CNN
F 1 "CONN_02X07" V 7300 1850 50  0000 C CNN
F 2 "" H 7300 650 50  0001 C CNN
F 3 "" H 7300 650 50  0001 C CNN
	1    7300 1850
	1    0    0    -1  
$EndComp
Text HLabel 7000 2150 0    60   BiDi ~ 0
SCK
Wire Wire Line
	7000 2150 7050 2150
Text HLabel 7600 2150 2    60   BiDi ~ 0
SDA
Wire Wire Line
	7600 2150 7550 2150
Text HLabel 3000 1500 2    60   Input ~ 0
SCLK
Text HLabel 3000 1600 2    60   Output ~ 0
SDO
Text HLabel 3000 1700 2    60   Input ~ 0
SDI
Text HLabel 3000 1400 2    60   Output ~ 0
BUSY*
Text Label 2650 1400 0    60   ~ 0
BUSY*
Text Label 2650 1500 0    60   ~ 0
SCLK
Text Label 2650 1600 0    60   ~ 0
SDO
Text Label 2650 1700 0    60   ~ 0
SDI
$Comp
L GND #PWR?
U 1 1 59FE9248
P 1300 1450
F 0 "#PWR?" H 1300 1200 50  0001 C CNN
F 1 "GND" H 1300 1300 50  0000 C CNN
F 2 "" H 1300 1450 50  0001 C CNN
F 3 "" H 1300 1450 50  0001 C CNN
	1    1300 1450
	1    0    0    -1  
$EndComp
Text HLabel 2050 1900 0    60   Input ~ 0
CS0*
Text HLabel 2050 1800 0    60   Input ~ 0
CS1*
Text HLabel 2050 1700 0    60   Input ~ 0
CS2*
Text HLabel 2050 1600 0    60   Input ~ 0
CS3*
Text HLabel 2050 1500 0    60   Input ~ 0
AN_REFSEL
Wire Wire Line
	2600 1400 3000 1400
Wire Wire Line
	2600 1500 3000 1500
Wire Wire Line
	2600 1600 3000 1600
Wire Wire Line
	2600 1700 3000 1700
Wire Wire Line
	2100 1400 1300 1400
Wire Wire Line
	1300 1400 1300 1450
Wire Wire Line
	2050 1500 2100 1500
Wire Wire Line
	2100 1600 2050 1600
Wire Wire Line
	2050 1700 2100 1700
Wire Wire Line
	2100 1800 2050 1800
Wire Wire Line
	2050 1900 2100 1900
Text HLabel 2700 1900 2    60   Input ~ 0
+V_UNREG_SW
Wire Wire Line
	2600 1900 2700 1900
$Comp
L CONN_02X07 J?
U 1 1 59FE9260
P 2350 1700
F 0 "J?" H 2350 2100 50  0000 C CNN
F 1 "CONN_02X07" V 2350 1700 50  0000 C CNN
F 2 "" H 2350 500 50  0001 C CNN
F 3 "" H 2350 500 50  0001 C CNN
	1    2350 1700
	1    0    0    -1  
$EndComp
Text HLabel 2050 2000 0    60   BiDi ~ 0
SCK
Wire Wire Line
	2050 2000 2100 2000
Text HLabel 2650 2000 2    60   BiDi ~ 0
SDA
Wire Wire Line
	2650 2000 2600 2000
$Sheet
S 1550 2950 1650 2350
U 59CF5101
F0 "analog" 60
F1 "analog.sch" 60
F2 "+3.3VA_ENABLE" I L 1550 3950 60 
F3 "+V_UNREG_SW" I L 1550 3500 60 
F4 "SDO" O R 3200 3600 60 
F5 "SDI" I R 3200 3400 60 
F6 "CS0*" I R 3200 4000 60 
F7 "CS1*" I R 3200 4200 60 
F8 "CS2*" I R 3200 4400 60 
F9 "CS3*" I R 3200 4600 60 
F10 "BUSY*" I R 3200 3200 60 
F11 "SCLK" I R 3200 3800 60 
F12 "AN_REFSEL" I L 1550 4350 60 
F13 "SCK" B R 3200 4800 60 
F14 "SDA" B R 3200 5000 60 
$EndSheet
Wire Wire Line
	3200 3400 3300 3400
Wire Wire Line
	3300 3600 3200 3600
Wire Wire Line
	3300 3800 3200 3800
Wire Wire Line
	3300 4000 3200 4000
Wire Wire Line
	3300 4200 3200 4200
Wire Wire Line
	3300 4400 3200 4400
Wire Wire Line
	3300 4600 3200 4600
Wire Wire Line
	3200 3200 3400 3200
$EndSCHEMATC
