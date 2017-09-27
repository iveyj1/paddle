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
Sheet 2 11
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
L R_US R204
U 1 1 59AC28F1
P 3250 3850
AR Path="/59AC068D/59AC28F1" Ref="R204"  Part="1" 
AR Path="/59D2358D/59AC28F1" Ref="R804"  Part="1" 
AR Path="/59D2396F/59AC28F1" Ref="R904"  Part="1" 
AR Path="/59D25B71/59AC28F1" Ref="R1004"  Part="1" 
F 0 "R204" H 3275 3950 60  0000 C CNN
F 1 "250" H 3275 3750 60  0000 C CNN
F 2 "paddle:SMD_0805" H 3250 3500 60  0001 C CNN
F 3 "" H 3275 3950 60  0000 C CNN
	1    3250 3850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR025
U 1 1 59AC28F8
P 3800 4800
AR Path="/59AC068D/59AC28F8" Ref="#PWR025"  Part="1" 
AR Path="/59D2358D/59AC28F8" Ref="#PWR094"  Part="1" 
AR Path="/59D2396F/59AC28F8" Ref="#PWR0106"  Part="1" 
AR Path="/59D25B71/59AC28F8" Ref="#PWR0118"  Part="1" 
F 0 "#PWR025" H 3800 4550 50  0001 C CNN
F 1 "GND" H 3800 4650 50  0000 C CNN
F 2 "" H 3800 4800 50  0001 C CNN
F 3 "" H 3800 4800 50  0001 C CNN
	1    3800 4800
	1    0    0    -1  
$EndComp
$Comp
L R_US R201
U 1 1 59AC28FD
P 1950 4200
AR Path="/59AC068D/59AC28FD" Ref="R201"  Part="1" 
AR Path="/59D2358D/59AC28FD" Ref="R801"  Part="1" 
AR Path="/59D2396F/59AC28FD" Ref="R901"  Part="1" 
AR Path="/59D25B71/59AC28FD" Ref="R1001"  Part="1" 
F 0 "R201" H 1975 4300 60  0000 C CNN
F 1 "10k 0.1%" H 1975 4100 60  0000 C CNN
F 2 "paddle:SMD_0805" H 1950 3850 60  0001 C CNN
F 3 "" H 1975 4300 60  0000 C CNN
	1    1950 4200
	-1   0    0    1   
$EndComp
$Comp
L C_Small C201
U 1 1 59AC28FE
P 2250 4350
AR Path="/59AC068D/59AC28FE" Ref="C201"  Part="1" 
AR Path="/59D2358D/59AC28FE" Ref="C801"  Part="1" 
AR Path="/59D2396F/59AC28FE" Ref="C901"  Part="1" 
AR Path="/59D25B71/59AC28FE" Ref="C1001"  Part="1" 
F 0 "C201" H 2260 4420 50  0000 L CNN
F 1 "0.01uF" H 2260 4270 50  0000 L CNN
F 2 "paddle:SMD_0805" H 2250 4350 50  0001 C CNN
F 3 "" H 2250 4350 50  0001 C CNN
	1    2250 4350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 59AC28FF
P 2250 4500
AR Path="/59AC068D/59AC28FF" Ref="#PWR026"  Part="1" 
AR Path="/59D2358D/59AC28FF" Ref="#PWR095"  Part="1" 
AR Path="/59D2396F/59AC28FF" Ref="#PWR0107"  Part="1" 
AR Path="/59D25B71/59AC28FF" Ref="#PWR0119"  Part="1" 
F 0 "#PWR026" H 2250 4250 50  0001 C CNN
F 1 "GND" H 2250 4350 50  0000 C CNN
F 2 "" H 2250 4500 50  0001 C CNN
F 3 "" H 2250 4500 50  0001 C CNN
	1    2250 4500
	1    0    0    -1  
$EndComp
$Comp
L C_Small C204
U 1 1 59AC2900
P 4200 3350
AR Path="/59AC068D/59AC2900" Ref="C204"  Part="1" 
AR Path="/59D2358D/59AC2900" Ref="C804"  Part="1" 
AR Path="/59D2396F/59AC2900" Ref="C904"  Part="1" 
AR Path="/59D25B71/59AC2900" Ref="C1004"  Part="1" 
F 0 "C204" H 4210 3420 50  0000 L CNN
F 1 "0.1uF" H 4210 3270 50  0000 L CNN
F 2 "paddle:SMD_0805" H 4200 3350 50  0001 C CNN
F 3 "" H 4200 3350 50  0001 C CNN
	1    4200 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 59AC2901
P 4200 3500
AR Path="/59AC068D/59AC2901" Ref="#PWR027"  Part="1" 
AR Path="/59D2358D/59AC2901" Ref="#PWR096"  Part="1" 
AR Path="/59D2396F/59AC2901" Ref="#PWR0108"  Part="1" 
AR Path="/59D25B71/59AC2901" Ref="#PWR0120"  Part="1" 
F 0 "#PWR027" H 4200 3250 50  0001 C CNN
F 1 "GND" H 4200 3350 50  0000 C CNN
F 2 "" H 4200 3500 50  0001 C CNN
F 3 "" H 4200 3500 50  0001 C CNN
	1    4200 3500
	1    0    0    -1  
$EndComp
$Comp
L R_US R202
U 1 1 59AC2916
P 2200 3500
AR Path="/59AC068D/59AC2916" Ref="R202"  Part="1" 
AR Path="/59D2358D/59AC2916" Ref="R802"  Part="1" 
AR Path="/59D2396F/59AC2916" Ref="R902"  Part="1" 
AR Path="/59D25B71/59AC2916" Ref="R1002"  Part="1" 
F 0 "R202" H 2225 3600 60  0000 C CNN
F 1 "20k 0.1%" H 2225 3400 60  0000 C CNN
F 2 "paddle:SMD_0805" H 2200 3150 60  0001 C CNN
F 3 "" H 2225 3600 60  0000 C CNN
	1    2200 3500
	-1   0    0    1   
$EndComp
$Comp
L R_US R203
U 1 1 59AC2917
P 3200 3250
AR Path="/59AC068D/59AC2917" Ref="R203"  Part="1" 
AR Path="/59D2358D/59AC2917" Ref="R803"  Part="1" 
AR Path="/59D2396F/59AC2917" Ref="R903"  Part="1" 
AR Path="/59D25B71/59AC2917" Ref="R1003"  Part="1" 
F 0 "R203" H 3225 3350 60  0000 C CNN
F 1 "1.0M" H 3225 3150 60  0000 C CNN
F 2 "paddle:SMD_0805" H 3200 2900 60  0001 C CNN
F 3 "" H 3225 3350 60  0000 C CNN
	1    3200 3250
	0    -1   -1   0   
$EndComp
$Comp
L POT_US P201
U 1 1 59AC291A
P 3550 2700
AR Path="/59AC068D/59AC291A" Ref="P201"  Part="1" 
AR Path="/59D2358D/59AC291A" Ref="P801"  Part="1" 
AR Path="/59D2396F/59AC291A" Ref="P901"  Part="1" 
AR Path="/59D25B71/59AC291A" Ref="P1001"  Part="1" 
F 0 "P201" H 3700 2700 60  0000 C CNN
F 1 "100k" H 3700 2600 60  0000 C CNN
F 2 "paddle:TT_model_23_pot_smd_4mm" H 3550 2350 60  0001 C CNN
F 3 "" V 3450 2725 60  0000 C CNN
	1    3550 2700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR028
U 1 1 59AC291B
P 3550 2950
AR Path="/59AC068D/59AC291B" Ref="#PWR028"  Part="1" 
AR Path="/59D2358D/59AC291B" Ref="#PWR097"  Part="1" 
AR Path="/59D2396F/59AC291B" Ref="#PWR0109"  Part="1" 
AR Path="/59D25B71/59AC291B" Ref="#PWR0121"  Part="1" 
F 0 "#PWR028" H 3550 2700 50  0001 C CNN
F 1 "GND" H 3550 2800 50  0000 C CNN
F 2 "" H 3550 2950 50  0001 C CNN
F 3 "" H 3550 2950 50  0001 C CNN
	1    3550 2950
	1    0    0    -1  
$EndComp
$Comp
L INA333 U201
U 1 1 59AC28EF
P 3750 3850
AR Path="/59AC068D/59AC28EF" Ref="U201"  Part="1" 
AR Path="/59D2358D/59AC28EF" Ref="U801"  Part="1" 
AR Path="/59D2396F/59AC28EF" Ref="U901"  Part="1" 
AR Path="/59D25B71/59AC28EF" Ref="U1001"  Part="1" 
F 0 "U201" H 3450 3250 60  0000 C CNN
F 1 "INA333" H 3450 3150 60  0000 C CNN
F 2 "paddle:S-PDSO-G8" H 3600 4050 60  0001 C CNN
F 3 "" H 3600 4050 60  0001 C CNN
	1    3750 3850
	1    0    0    -1  
$EndComp
Text Label 4050 4500 0    60   ~ 0
Vref
Text Label 2000 3500 2    60   ~ 0
Vref
Text HLabel 1600 3500 0    60   Input ~ 0
Vref
Text HLabel 1600 4200 0    60   Input ~ 0
Analog_in
$Comp
L ADS1115 U202
U 1 1 59AD96BC
P 6950 4000
AR Path="/59AC068D/59AD96BC" Ref="U202"  Part="1" 
AR Path="/59D2358D/59AD96BC" Ref="U802"  Part="1" 
AR Path="/59D2396F/59AD96BC" Ref="U902"  Part="1" 
AR Path="/59D25B71/59AD96BC" Ref="U1002"  Part="1" 
F 0 "U202" H 6950 3000 60  0000 C CNN
F 1 "ADS1115" H 6950 2900 60  0000 C CNN
F 2 "paddle:VSSOP10-S-PDSO-G10" H 6625 3900 60  0001 C CNN
F 3 "" H 6625 3900 60  0001 C CNN
	1    6950 4000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 59ADD237
P 6150 3700
AR Path="/59AC068D/59ADD237" Ref="#PWR029"  Part="1" 
AR Path="/59D2358D/59ADD237" Ref="#PWR098"  Part="1" 
AR Path="/59D2396F/59ADD237" Ref="#PWR0110"  Part="1" 
AR Path="/59D25B71/59ADD237" Ref="#PWR0122"  Part="1" 
F 0 "#PWR029" H 6150 3450 50  0001 C CNN
F 1 "GND" H 6150 3750 50  0000 C CNN
F 2 "" H 6150 3700 50  0001 C CNN
F 3 "" H 6150 3700 50  0001 C CNN
	1    6150 3700
	1    0    0    -1  
$EndComp
Text HLabel 7900 3050 2    60   Input ~ 0
ADDR
Text HLabel 7900 3500 2    60   BiDi ~ 0
SCK
$Comp
L C_Small C206
U 1 1 59AE003D
P 5750 4650
AR Path="/59AC068D/59AE003D" Ref="C206"  Part="1" 
AR Path="/59D2358D/59AE003D" Ref="C806"  Part="1" 
AR Path="/59D2396F/59AE003D" Ref="C906"  Part="1" 
AR Path="/59D25B71/59AE003D" Ref="C1006"  Part="1" 
F 0 "C206" H 5760 4720 50  0000 L CNN
F 1 "0.22uF" H 5760 4570 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5750 4650 50  0001 C CNN
F 3 "" H 5750 4650 50  0001 C CNN
	1    5750 4650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR030
U 1 1 59AE0138
P 5750 4800
AR Path="/59AC068D/59AE0138" Ref="#PWR030"  Part="1" 
AR Path="/59D2358D/59AE0138" Ref="#PWR099"  Part="1" 
AR Path="/59D2396F/59AE0138" Ref="#PWR0111"  Part="1" 
AR Path="/59D25B71/59AE0138" Ref="#PWR0123"  Part="1" 
F 0 "#PWR030" H 5750 4550 50  0001 C CNN
F 1 "GND" H 5750 4650 50  0000 C CNN
F 2 "" H 5750 4800 50  0001 C CNN
F 3 "" H 5750 4800 50  0001 C CNN
	1    5750 4800
	1    0    0    -1  
$EndComp
$Comp
L TEST TP201
U 1 1 59B77F8A
P 5000 3700
AR Path="/59AC068D/59B77F8A" Ref="TP201"  Part="1" 
AR Path="/59D2358D/59B77F8A" Ref="TP801"  Part="1" 
AR Path="/59D2396F/59B77F8A" Ref="TP901"  Part="1" 
AR Path="/59D25B71/59B77F8A" Ref="TP1001"  Part="1" 
F 0 "TP201" H 5000 4000 50  0000 C BNN
F 1 "AN1" H 5000 3950 50  0000 C CNN
F 2 "paddle:tp_th_1mm" H 5000 3700 50  0001 C CNN
F 3 "" H 5000 3700 50  0001 C CNN
	1    5000 3700
	1    0    0    -1  
$EndComp
Text HLabel 5250 2350 1    60   Input ~ 0
Aux_in
$Comp
L C_Small C205
U 1 1 59BDFF71
P 5550 3200
AR Path="/59AC068D/59BDFF71" Ref="C205"  Part="1" 
AR Path="/59D2358D/59BDFF71" Ref="C805"  Part="1" 
AR Path="/59D2396F/59BDFF71" Ref="C905"  Part="1" 
AR Path="/59D25B71/59BDFF71" Ref="C1005"  Part="1" 
F 0 "C205" H 5560 3270 50  0000 L CNN
F 1 "0.01uF" H 5560 3120 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5550 3200 50  0001 C CNN
F 3 "" H 5550 3200 50  0001 C CNN
	1    5550 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR031
U 1 1 59BDFFDB
P 5550 3450
AR Path="/59AC068D/59BDFFDB" Ref="#PWR031"  Part="1" 
AR Path="/59D2358D/59BDFFDB" Ref="#PWR0100"  Part="1" 
AR Path="/59D2396F/59BDFFDB" Ref="#PWR0112"  Part="1" 
AR Path="/59D25B71/59BDFFDB" Ref="#PWR0124"  Part="1" 
F 0 "#PWR031" H 5550 3200 50  0001 C CNN
F 1 "GND" H 5550 3300 50  0000 C CNN
F 2 "" H 5550 3450 50  0001 C CNN
F 3 "" H 5550 3450 50  0001 C CNN
	1    5550 3450
	1    0    0    -1  
$EndComp
$Comp
L R_US R207
U 1 1 59BE0627
P 5900 3250
AR Path="/59AC068D/59BE0627" Ref="R207"  Part="1" 
AR Path="/59D2358D/59BE0627" Ref="R807"  Part="1" 
AR Path="/59D2396F/59BE0627" Ref="R907"  Part="1" 
AR Path="/59D25B71/59BE0627" Ref="R1007"  Part="1" 
F 0 "R207" H 5925 3350 60  0000 C CNN
F 1 "DNP 100k" H 5925 3150 60  0000 C CNN
F 2 "paddle:SMD_0805" H 5900 2900 60  0001 C CNN
F 3 "" H 5925 3350 60  0000 C CNN
	1    5900 3250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR032
U 1 1 59BE0685
P 5900 3450
AR Path="/59AC068D/59BE0685" Ref="#PWR032"  Part="1" 
AR Path="/59D2358D/59BE0685" Ref="#PWR0101"  Part="1" 
AR Path="/59D2396F/59BE0685" Ref="#PWR0113"  Part="1" 
AR Path="/59D25B71/59BE0685" Ref="#PWR0125"  Part="1" 
F 0 "#PWR032" H 5900 3200 50  0001 C CNN
F 1 "GND" H 5900 3300 50  0000 C CNN
F 2 "" H 5900 3450 50  0001 C CNN
F 3 "" H 5900 3450 50  0001 C CNN
	1    5900 3450
	1    0    0    -1  
$EndComp
$Comp
L R_US R205
U 1 1 59C33C44
P 3800 4600
AR Path="/59AC068D/59C33C44" Ref="R205"  Part="1" 
AR Path="/59D2358D/59C33C44" Ref="R805"  Part="1" 
AR Path="/59D2396F/59C33C44" Ref="R905"  Part="1" 
AR Path="/59D25B71/59C33C44" Ref="R1005"  Part="1" 
F 0 "R205" H 3825 4700 60  0000 C CNN
F 1 "0" H 3825 4500 60  0000 C CNN
F 2 "paddle:SMD_0805" H 3800 4250 60  0001 C CNN
F 3 "" H 3825 4700 60  0000 C CNN
	1    3800 4600
	0    -1   -1   0   
$EndComp
Text HLabel 7900 2850 2    60   3State ~ 0
ALERT
$Comp
L C_Small C202
U 1 1 59C8A983
P 2500 3700
AR Path="/59AC068D/59C8A983" Ref="C202"  Part="1" 
AR Path="/59D2358D/59C8A983" Ref="C802"  Part="1" 
AR Path="/59D2396F/59C8A983" Ref="C902"  Part="1" 
AR Path="/59D25B71/59C8A983" Ref="C1002"  Part="1" 
F 0 "C202" H 2510 3770 50  0000 L CNN
F 1 "0.01uF" H 2510 3620 50  0000 L CNN
F 2 "paddle:SMD_0805" H 2500 3700 50  0001 C CNN
F 3 "" H 2500 3700 50  0001 C CNN
	1    2500 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 59C8A989
P 2500 3850
AR Path="/59AC068D/59C8A989" Ref="#PWR033"  Part="1" 
AR Path="/59D2358D/59C8A989" Ref="#PWR0102"  Part="1" 
AR Path="/59D2396F/59C8A989" Ref="#PWR0114"  Part="1" 
AR Path="/59D25B71/59C8A989" Ref="#PWR0126"  Part="1" 
F 0 "#PWR033" H 2500 3600 50  0001 C CNN
F 1 "GND" H 2500 3700 50  0000 C CNN
F 2 "" H 2500 3850 50  0001 C CNN
F 3 "" H 2500 3850 50  0001 C CNN
	1    2500 3850
	1    0    0    -1  
$EndComp
$Comp
L C_Small C203
U 1 1 59C8ADEB
P 2800 3850
AR Path="/59AC068D/59C8ADEB" Ref="C203"  Part="1" 
AR Path="/59D2358D/59C8ADEB" Ref="C803"  Part="1" 
AR Path="/59D2396F/59C8ADEB" Ref="C903"  Part="1" 
AR Path="/59D25B71/59C8ADEB" Ref="C1003"  Part="1" 
F 0 "C203" H 2810 3920 50  0000 L CNN
F 1 "DNP 0.01uF" H 2810 3770 50  0000 L CNN
F 2 "paddle:SMD_0805" H 2800 3850 50  0001 C CNN
F 3 "" H 2800 3850 50  0001 C CNN
	1    2800 3850
	1    0    0    -1  
$EndComp
$Comp
L R_US R206
U 1 1 59C8C282
P 5250 2650
AR Path="/59AC068D/59C8C282" Ref="R206"  Part="1" 
AR Path="/59D2358D/59C8C282" Ref="R806"  Part="1" 
AR Path="/59D2396F/59C8C282" Ref="R906"  Part="1" 
AR Path="/59D25B71/59C8C282" Ref="R1006"  Part="1" 
F 0 "R206" H 5275 2750 60  0000 C CNN
F 1 "10k" H 5275 2550 60  0000 C CNN
F 2 "paddle:SMD_0805" H 5250 2300 60  0001 C CNN
F 3 "" H 5275 2750 60  0000 C CNN
	1    5250 2650
	0    -1   -1   0   
$EndComp
Text HLabel 7900 3950 2    60   BiDi ~ 0
SDA
$Comp
L +3.3VA #PWR034
U 1 1 59CC5252
P 3550 2450
AR Path="/59AC068D/59CC5252" Ref="#PWR034"  Part="1" 
AR Path="/59D2358D/59CC5252" Ref="#PWR0103"  Part="1" 
AR Path="/59D2396F/59CC5252" Ref="#PWR0115"  Part="1" 
AR Path="/59D25B71/59CC5252" Ref="#PWR0127"  Part="1" 
F 0 "#PWR034" H 3550 2250 50  0001 C CNN
F 1 "+3.3VA" H 3550 2650 50  0000 C CNN
F 2 "" H 3550 2450 50  0001 C CNN
F 3 "" H 3550 2450 50  0001 C CNN
	1    3550 2450
	1    0    0    -1  
$EndComp
$Comp
L +3.3VA #PWR035
U 1 1 59CC530A
P 5550 4400
AR Path="/59AC068D/59CC530A" Ref="#PWR035"  Part="1" 
AR Path="/59D2358D/59CC530A" Ref="#PWR0104"  Part="1" 
AR Path="/59D2396F/59CC530A" Ref="#PWR0116"  Part="1" 
AR Path="/59D25B71/59CC530A" Ref="#PWR0128"  Part="1" 
F 0 "#PWR035" H 5550 4200 50  0001 C CNN
F 1 "+3.3VA" H 5550 4600 50  0000 C CNN
F 2 "" H 5550 4400 50  0001 C CNN
F 3 "" H 5550 4400 50  0001 C CNN
	1    5550 4400
	1    0    0    -1  
$EndComp
$Comp
L +3.3VA #PWR036
U 1 1 59CC5348
P 3800 3100
AR Path="/59AC068D/59CC5348" Ref="#PWR036"  Part="1" 
AR Path="/59D2358D/59CC5348" Ref="#PWR0105"  Part="1" 
AR Path="/59D2396F/59CC5348" Ref="#PWR0117"  Part="1" 
AR Path="/59D25B71/59CC5348" Ref="#PWR0129"  Part="1" 
F 0 "#PWR036" H 3800 2900 50  0001 C CNN
F 1 "+3.3VA" H 3800 3300 50  0000 C CNN
F 2 "" H 3800 3100 50  0001 C CNN
F 3 "" H 3800 3100 50  0001 C CNN
	1    3800 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 4200 2250 4250
Wire Wire Line
	2150 4200 3250 4200
Wire Wire Line
	2250 4500 2250 4450
Wire Wire Line
	1600 4200 1750 4200
Wire Wire Line
	4200 3500 4200 3450
Wire Wire Line
	4200 3200 4200 3250
Wire Wire Line
	3800 3200 4200 3200
Connection ~ 2250 4200
Wire Wire Line
	2400 3500 3250 3500
Wire Wire Line
	1600 3500 2000 3500
Wire Wire Line
	3300 2700 3200 2700
Wire Wire Line
	3200 2700 3200 3050
Wire Wire Line
	3200 3500 3200 3450
Connection ~ 3200 3500
Wire Wire Line
	3550 2900 3550 2950
Wire Notes Line
	3100 11600 3200 11600
Wire Wire Line
	5550 4450 6350 4450
Wire Wire Line
	6150 5400 7750 5400
Wire Wire Line
	7750 5400 7750 3950
Wire Wire Line
	7750 3950 7900 3950
Wire Wire Line
	6350 5300 7550 5300
Wire Wire Line
	7550 5300 7550 3500
Wire Wire Line
	7550 3500 7900 3500
Wire Wire Line
	6200 3050 7900 3050
Wire Wire Line
	5750 4550 5750 4450
Connection ~ 5750 4450
Wire Wire Line
	5750 4750 5750 4800
Wire Wire Line
	4700 4150 6350 4150
Wire Wire Line
	3800 3100 3800 3300
Connection ~ 3800 3200
Wire Wire Line
	6150 3700 6350 3700
Wire Wire Line
	6350 4750 6350 5300
Wire Wire Line
	6350 4600 6150 4600
Wire Wire Line
	6150 4600 6150 5400
Wire Wire Line
	4050 4300 6350 4300
Wire Wire Line
	6200 3050 6200 3400
Wire Wire Line
	6200 3400 6350 3400
Wire Wire Line
	3550 2450 3550 2500
Wire Wire Line
	5550 4400 5550 4450
Wire Wire Line
	5250 3000 5900 3000
Connection ~ 5250 3000
Wire Wire Line
	5550 3300 5550 3450
Wire Wire Line
	5550 3000 5550 3100
Wire Wire Line
	5900 3000 5900 3050
Connection ~ 5550 3000
Wire Wire Line
	5250 2850 5250 3850
Wire Wire Line
	6350 3550 6100 3550
Wire Wire Line
	6100 3550 6100 2850
Wire Wire Line
	6100 2850 7900 2850
Wire Wire Line
	4600 3850 4700 3850
Wire Wire Line
	4700 3850 4700 4150
Wire Wire Line
	5250 3850 6350 3850
Wire Wire Line
	5000 3700 5000 4000
Wire Wire Line
	5000 4000 6350 4000
Connection ~ 4050 4300
Wire Wire Line
	4050 4250 4050 4500
Wire Wire Line
	2500 3850 2500 3800
Wire Wire Line
	2500 3600 2500 3500
Connection ~ 2500 3500
Wire Wire Line
	2800 3750 2800 3500
Connection ~ 2800 3500
Wire Wire Line
	2800 3950 2800 4200
Connection ~ 2800 4200
Wire Wire Line
	5250 2450 5250 2350
$EndSCHEMATC
