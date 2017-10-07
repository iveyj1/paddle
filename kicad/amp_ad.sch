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
Sheet 7 12
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
L LTC2440 U702
U 1 1 59D598D6
P 6550 3650
AR Path="/59CF5101/59CF60C9/59D598D6" Ref="U702"  Part="1" 
AR Path="/59CF5101/59CF612C/59D598D6" Ref="U802"  Part="1" 
AR Path="/59CF5101/59CF614A/59D598D6" Ref="U902"  Part="1" 
AR Path="/59CF5101/59CF6168/59D598D6" Ref="U1002"  Part="1" 
F 0 "U702" H 6550 2550 60  0000 C CNN
F 1 "LTC2440" H 6550 2450 60  0000 C CNN
F 2 "" H 6450 2300 60  0001 C CNN
F 3 "" H 6450 2300 60  0001 C CNN
	1    6550 3650
	1    0    0    -1  
$EndComp
$Comp
L OPA388D U701
U 1 1 59D59F62
P 4750 3500
AR Path="/59CF5101/59CF60C9/59D59F62" Ref="U701"  Part="1" 
AR Path="/59CF5101/59CF612C/59D59F62" Ref="U801"  Part="1" 
AR Path="/59CF5101/59CF614A/59D59F62" Ref="U901"  Part="1" 
AR Path="/59CF5101/59CF6168/59D59F62" Ref="U1001"  Part="1" 
F 0 "U701" H 4750 3750 50  0000 L CNN
F 1 "OPA388D" H 4750 3650 50  0000 L CNN
F 2 "" H 4800 3550 50  0001 C CNN
F 3 "" H 4900 3650 50  0001 C CNN
	1    4750 3500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
