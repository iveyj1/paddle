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
L OPA333 U1202
U 1 1 59CEDDF0
P 6000 3550
F 0 "U1202" H 6000 3800 60  0000 L CNN
F 1 "OPA333" H 6000 3700 60  0000 L CNN
F 2 "paddle:sot23-5" H 6000 3400 30  0001 L CNN
F 3 "" H 6000 3550 60  0000 C CNN
	1    6000 3550
	1    0    0    -1  
$EndComp
$Comp
L C_Small C1202
U 1 1 59CEDE0B
P 6400 3000
F 0 "C1202" H 6410 3070 50  0000 L CNN
F 1 "0.1uF" H 6410 2920 50  0000 L CNN
F 2 "paddle:SMD_0805" H 6400 3000 50  0001 C CNN
F 3 "" H 6400 3000 50  0001 C CNN
	1    6400 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1205
U 1 1 59CEDE12
P 6400 3250
F 0 "#PWR1205" H 6400 3000 50  0001 C CNN
F 1 "GND" H 6400 3100 50  0000 C CNN
F 2 "" H 6400 3250 50  0001 C CNN
F 3 "" H 6400 3250 50  0001 C CNN
	1    6400 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1204
U 1 1 59CEDE18
P 5950 3900
F 0 "#PWR1204" H 5950 3650 50  0001 C CNN
F 1 "GND" H 5950 3750 50  0000 C CNN
F 2 "" H 5950 3900 50  0001 C CNN
F 3 "" H 5950 3900 50  0001 C CNN
	1    5950 3900
	1    0    0    -1  
$EndComp
$Comp
L TEST TP1201
U 1 1 59CEDE1E
P 6800 3450
F 0 "TP1201" H 6800 3750 50  0000 C BNN
F 1 "AN1" H 6800 3700 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 6800 3450 50  0001 C CNN
F 3 "" H 6800 3450 50  0001 C CNN
	1    6800 3450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1202
U 1 1 59CEDE2C
P 5200 3950
F 0 "#PWR1202" H 5200 3700 50  0001 C CNN
F 1 "GND" H 5200 3800 50  0000 C CNN
F 2 "" H 5200 3950 50  0001 C CNN
F 3 "" H 5200 3950 50  0001 C CNN
	1    5200 3950
	1    0    0    -1  
$EndComp
$Comp
L +3.3VA #PWR1203
U 1 1 59CEDE47
P 5950 2550
F 0 "#PWR1203" H 5950 2350 50  0001 C CNN
F 1 "+3.3VA" H 5950 2750 50  0000 C CNN
F 2 "" H 5950 2550 50  0001 C CNN
F 3 "" H 5950 2550 50  0001 C CNN
	1    5950 2550
	1    0    0    -1  
$EndComp
$Comp
L +3.3VA #PWR1201
U 1 1 59CEDE4D
P 5200 2400
F 0 "#PWR1201" H 5200 2200 50  0001 C CNN
F 1 "+3.3VA" H 5200 2600 50  0000 C CNN
F 2 "" H 5200 2400 50  0001 C CNN
F 3 "" H 5200 2400 50  0001 C CNN
	1    5200 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2450 5200 2400
Wire Wire Line
	6350 3550 6850 3550
Connection ~ 6350 3550
Connection ~ 5950 2800
Wire Wire Line
	5950 3850 5950 3900
Wire Wire Line
	5950 2800 6400 2800
Wire Wire Line
	6400 2800 6400 2900
Wire Wire Line
	6400 3100 6400 3250
Wire Wire Line
	5950 2550 5950 3250
Wire Wire Line
	6350 4150 6350 3550
Wire Wire Line
	5650 4150 6350 4150
Wire Wire Line
	5650 3650 5650 4150
Wire Wire Line
	6800 3550 6800 3450
Wire Wire Line
	5500 3450 5650 3450
Connection ~ 6800 3550
Text HLabel 6850 3550 2    60   Input ~ 0
VREF
$EndSCHEMATC