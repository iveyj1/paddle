EESchema Schematic File Version 4
LIBS:analog-cache
EELAYER 26 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 6 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 8100 3250 2    60   Input ~ 0
SCLK
Text HLabel 8100 3550 2    60   Output ~ 0
SDO
Text HLabel 8100 3400 2    60   Input ~ 0
SDI
Text HLabel 8100 3100 2    60   Input ~ 0
CS*
$Comp
L device:Q_NMOS_GSD Q201
U 1 1 59DECDAE
P 8800 3700
AR Path="/59CF60C9/59DECDAE" Ref="Q201"  Part="1" 
AR Path="/5AA6CD5B/59DECDAE" Ref="Q501"  Part="1" 
AR Path="/5AA70A0F/59DECDAE" Ref="Q601"  Part="1" 
AR Path="/5AA725C2/59DECDAE" Ref="Q701"  Part="1" 
F 0 "Q501" H 9000 3750 50  0000 L CNN
F 1 "DMG3414U" H 9000 3650 50  0000 L CNN
F 2 "paddle:SOT-23" H 9000 3800 50  0001 C CNN
F 3 "" H 8800 3700 50  0001 C CNN
	1    8800 3700
	1    0    0    -1  
$EndComp
Text HLabel 9100 3450 2    60   Output ~ 0
BUSY*
Text HLabel 2250 3650 0    60   Input ~ 0
ANALOG_IN
$Comp
L power:+3.3VA #PWR0207
U 1 1 59DED17B
P 6200 2450
AR Path="/59CF60C9/59DED17B" Ref="#PWR0207"  Part="1" 
AR Path="/5AA6CD5B/59DED17B" Ref="#PWR0507"  Part="1" 
AR Path="/5AA70A0F/59DED17B" Ref="#PWR0607"  Part="1" 
AR Path="/5AA725C2/59DED17B" Ref="#PWR0707"  Part="1" 
F 0 "#PWR0707" H 6200 2250 50  0001 C CNN
F 1 "+3.3VA" H 6200 2650 50  0000 C CNN
F 2 "" H 6200 2450 50  0001 C CNN
F 3 "" H 6200 2450 50  0001 C CNN
	1    6200 2450
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C205
U 1 1 59DED524
P 6400 2600
AR Path="/59CF60C9/59DED524" Ref="C205"  Part="1" 
AR Path="/5AA6CD5B/59DED524" Ref="C505"  Part="1" 
AR Path="/5AA70A0F/59DED524" Ref="C605"  Part="1" 
AR Path="/5AA725C2/59DED524" Ref="C705"  Part="1" 
F 0 "C505" H 6410 2670 50  0000 L CNN
F 1 "10uF" H 6410 2520 50  0000 L CNN
F 2 "paddle:SMD_1206" H 6400 2600 50  0001 C CNN
F 3 "" H 6400 2600 50  0001 C CNN
	1    6400 2600
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C204
U 1 1 59DED56F
P 6200 2600
AR Path="/59CF60C9/59DED56F" Ref="C204"  Part="1" 
AR Path="/5AA6CD5B/59DED56F" Ref="C504"  Part="1" 
AR Path="/5AA70A0F/59DED56F" Ref="C604"  Part="1" 
AR Path="/5AA725C2/59DED56F" Ref="C704"  Part="1" 
F 0 "C504" H 6210 2670 50  0000 L CNN
F 1 "0.1uF" H 6210 2520 50  0000 L CNN
F 2 "paddle:SMD_0805" H 6200 2600 50  0001 C CNN
F 3 "" H 6200 2600 50  0001 C CNN
	1    6200 2600
	-1   0    0    1   
$EndComp
Wire Notes Line
	3100 11600 3200 11600
Wire Wire Line
	7900 3250 8100 3250
Wire Wire Line
	8100 3550 7900 3550
Wire Wire Line
	7900 3400 8100 3400
Wire Wire Line
	8100 3100 7900 3100
Wire Wire Line
	9100 3450 8900 3450
Wire Wire Line
	6200 2500 6200 2450
Wire Wire Line
	6200 2500 6400 2500
Connection ~ 6400 2500
Wire Wire Line
	6200 2700 6200 2750
Wire Wire Line
	5750 3100 5900 3100
$Comp
L paddle:R_US R205
U 1 1 59F5CA97
P 5550 3100
AR Path="/59CF60C9/59F5CA97" Ref="R205"  Part="1" 
AR Path="/5AA6CD5B/59F5CA97" Ref="R505"  Part="1" 
AR Path="/5AA70A0F/59F5CA97" Ref="R605"  Part="1" 
AR Path="/5AA725C2/59F5CA97" Ref="R705"  Part="1" 
F 0 "R505" H 5575 3200 60  0000 C CNN
F 1 "10.0k" H 5500 3000 60  0000 C CNN
F 2 "paddle:SMD_0805" H 5550 2750 60  0001 C CNN
F 3 "" H 5575 3200 60  0000 C CNN
	1    5550 3100
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C203
U 1 1 59F5CA9E
P 5900 3250
AR Path="/59CF60C9/59F5CA9E" Ref="C203"  Part="1" 
AR Path="/5AA6CD5B/59F5CA9E" Ref="C503"  Part="1" 
AR Path="/5AA70A0F/59F5CA9E" Ref="C603"  Part="1" 
AR Path="/5AA725C2/59F5CA9E" Ref="C703"  Part="1" 
F 0 "C503" H 5910 3320 50  0000 L CNN
F 1 "100pF" H 5910 3170 50  0000 L CNN
F 2 "paddle:SMD_0805" H 5900 3250 50  0001 C CNN
F 3 "" H 5900 3250 50  0001 C CNN
	1    5900 3250
	1    0    0    -1  
$EndComp
$Comp
L device:C_Small C201
U 1 1 59F5CABF
P 3050 3900
AR Path="/59CF60C9/59F5CABF" Ref="C201"  Part="1" 
AR Path="/5AA6CD5B/59F5CABF" Ref="C501"  Part="1" 
AR Path="/5AA70A0F/59F5CABF" Ref="C601"  Part="1" 
AR Path="/5AA725C2/59F5CABF" Ref="C701"  Part="1" 
F 0 "C501" H 3060 3970 50  0000 L CNN
F 1 "100pF" H 3060 3820 50  0000 L CNN
F 2 "paddle:SMD_0805" H 3050 3900 50  0001 C CNN
F 3 "" H 3050 3900 50  0001 C CNN
	1    3050 3900
	-1   0    0    1   
$EndComp
$Comp
L paddle:R_US R201
U 1 1 59F5CACC
P 2550 3650
AR Path="/59CF60C9/59F5CACC" Ref="R201"  Part="1" 
AR Path="/5AA6CD5B/59F5CACC" Ref="R501"  Part="1" 
AR Path="/5AA70A0F/59F5CACC" Ref="R601"  Part="1" 
AR Path="/5AA725C2/59F5CACC" Ref="R701"  Part="1" 
F 0 "R501" H 2575 3750 60  0000 C CNN
F 1 "10.0k" H 2500 3550 60  0000 C CNN
F 2 "paddle:SMD_0805" H 2550 3300 60  0001 C CNN
F 3 "" H 2575 3750 60  0000 C CNN
	1    2550 3650
	-1   0    0    1   
$EndComp
$Comp
L paddle:LTC2052 U201
U 1 1 59F5CAE8
P 3800 3750
AR Path="/59CF60C9/59F5CAE8" Ref="U201"  Part="1" 
AR Path="/5AA6CD5B/59F5CAE8" Ref="U501"  Part="1" 
AR Path="/5AA70A0F/59F5CAE8" Ref="U601"  Part="1" 
AR Path="/5AA725C2/59F5CAE8" Ref="U701"  Part="1" 
F 0 "U501" H 3800 3950 50  0000 L CNN
F 1 "LTC2052" H 3800 3550 50  0000 L CNN
F 2 "paddle:TSSOP-8_3x3mm_Pitch0.65mm" H 3800 3750 50  0001 C CNN
F 3 "" H 3800 3750 50  0001 C CNN
	1    3800 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 3750 4200 3750
Wire Wire Line
	5900 3350 5900 3400
Wire Wire Line
	5900 3150 5900 3100
Connection ~ 5900 3100
Wire Wire Line
	3350 3850 3350 4300
Wire Wire Line
	3050 3650 3050 3800
Connection ~ 3050 3650
Wire Wire Line
	3050 4000 3050 4050
Connection ~ 4200 3750
Wire Wire Line
	4200 3750 4200 4300
Wire Wire Line
	2750 3650 3050 3650
Wire Wire Line
	3500 3850 3350 3850
Wire Wire Line
	4200 4300 3350 4300
Text HLabel 4850 3450 0    60   Input ~ 0
VREF
Wire Wire Line
	2250 3650 2350 3650
Wire Wire Line
	3050 3650 3250 3650
Wire Wire Line
	4200 3750 4300 3750
$Comp
L paddle:R_US R203
U 1 1 5A9CCC42
P 3600 4650
AR Path="/59CF60C9/5A9CCC42" Ref="R203"  Part="1" 
AR Path="/5AA6CD5B/5A9CCC42" Ref="R503"  Part="1" 
AR Path="/5AA70A0F/5A9CCC42" Ref="R603"  Part="1" 
AR Path="/5AA725C2/5A9CCC42" Ref="R703"  Part="1" 
F 0 "R503" H 3625 4750 60  0000 C CNN
F 1 "DNP" H 3550 4550 60  0000 C CNN
F 2 "paddle:SMD_0805" H 3600 4300 60  0001 C CNN
F 3 "" H 3625 4750 60  0000 C CNN
	1    3600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4650 4300 4650
Wire Wire Line
	4300 4650 4300 3750
Connection ~ 4300 3750
Wire Wire Line
	3400 4650 3250 4650
Wire Wire Line
	3250 4650 3250 3650
Connection ~ 3250 3650
Wire Wire Line
	3250 3650 3500 3650
Wire Wire Line
	7900 3700 8600 3700
Connection ~ 6200 2500
Wire Wire Line
	7000 2500 7000 2700
Wire Wire Line
	6400 2500 7000 2500
$Comp
L device:C_Small C206
U 1 1 5AA1D367
P 7550 2600
AR Path="/59CF60C9/5AA1D367" Ref="C206"  Part="1" 
AR Path="/5AA6CD5B/5AA1D367" Ref="C506"  Part="1" 
AR Path="/5AA70A0F/5AA1D367" Ref="C606"  Part="1" 
AR Path="/5AA725C2/5AA1D367" Ref="C706"  Part="1" 
F 0 "C506" H 7560 2670 50  0000 L CNN
F 1 "0.1uF" H 7560 2520 50  0000 L CNN
F 2 "paddle:SMD_0805" H 7550 2600 50  0001 C CNN
F 3 "" H 7550 2600 50  0001 C CNN
	1    7550 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	7550 2500 7400 2500
Wire Wire Line
	7400 2500 7400 2700
Wire Wire Line
	7400 2500 7000 2500
Connection ~ 7400 2500
Connection ~ 7000 2500
Wire Wire Line
	5900 3100 6500 3100
Wire Wire Line
	8900 3450 8900 3500
Wire Wire Line
	8100 4000 8100 3950
Wire Wire Line
	8100 3950 7900 3950
Wire Wire Line
	4300 3750 6500 3750
Wire Wire Line
	5350 3100 5250 3100
$Comp
L power:+3.3VA #PWR0205
U 1 1 5AA23513
P 5250 2450
AR Path="/59CF60C9/5AA23513" Ref="#PWR0205"  Part="1" 
AR Path="/5AA6CD5B/5AA23513" Ref="#PWR0505"  Part="1" 
AR Path="/5AA70A0F/5AA23513" Ref="#PWR0605"  Part="1" 
AR Path="/5AA725C2/5AA23513" Ref="#PWR0705"  Part="1" 
F 0 "#PWR0705" H 5250 2250 50  0001 C CNN
F 1 "+3.3VA" H 5250 2650 50  0000 C CNN
F 2 "" H 5250 2450 50  0001 C CNN
F 3 "" H 5250 2450 50  0001 C CNN
	1    5250 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2450 5250 3100
Text HLabel 2250 5050 0    50   Input ~ 0
BRIDGE_COMP
Wire Wire Line
	5650 3900 6500 3900
Wire Wire Line
	5100 3600 5100 3450
Wire Wire Line
	4850 3450 5100 3450
Wire Wire Line
	5100 3600 6500 3600
$Comp
L power:+3.3VA #PWR0203
U 1 1 5AA635D2
P 3800 3250
AR Path="/59CF60C9/5AA635D2" Ref="#PWR0203"  Part="1" 
AR Path="/5AA6CD5B/5AA635D2" Ref="#PWR0503"  Part="1" 
AR Path="/5AA70A0F/5AA635D2" Ref="#PWR0603"  Part="1" 
AR Path="/5AA725C2/5AA635D2" Ref="#PWR0703"  Part="1" 
F 0 "#PWR0703" H 3800 3050 50  0001 C CNN
F 1 "+3.3VA" H 3800 3450 50  0000 C CNN
F 2 "" H 3800 3250 50  0001 C CNN
F 3 "" H 3800 3250 50  0001 C CNN
	1    3800 3250
	1    0    0    -1  
$EndComp
$Comp
L paddle:ADS1220 U202
U 1 1 5AA64A6D
P 7200 3600
AR Path="/59CF60C9/5AA64A6D" Ref="U202"  Part="1" 
AR Path="/5AA6CD5B/5AA64A6D" Ref="U502"  Part="1" 
AR Path="/5AA70A0F/5AA64A6D" Ref="U602"  Part="1" 
AR Path="/5AA725C2/5AA64A6D" Ref="U702"  Part="1" 
F 0 "U502" H 7200 4678 50  0000 C CNN
F 1 "ADS1220" H 7200 4587 50  0000 C CNN
F 2 "paddle:TSSOP-16-1EP_4.4x5mm_Pitch0.65mm" H 7850 2700 50  0001 C CNN
F 3 "" H 7850 2700 50  0001 C CNN
	1    7200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3900 8900 4000
Wire Wire Line
	6300 3250 6500 3250
Wire Wire Line
	7400 4650 7400 4500
Wire Wire Line
	6500 4050 6250 4050
Wire Wire Line
	6250 4050 6250 4200
$Comp
L power:GND #PWR0201
U 1 1 5AA868FF
P 3050 4050
AR Path="/59CF60C9/5AA868FF" Ref="#PWR0201"  Part="1" 
AR Path="/5AA6CD5B/5AA868FF" Ref="#PWR0501"  Part="1" 
AR Path="/5AA70A0F/5AA868FF" Ref="#PWR0601"  Part="1" 
AR Path="/5AA725C2/5AA868FF" Ref="#PWR0701"  Part="1" 
F 0 "#PWR0701" H 3050 3800 50  0001 C CNN
F 1 "GND" H 3055 3877 50  0000 C CNN
F 2 "" H 3050 4050 50  0001 C CNN
F 3 "" H 3050 4050 50  0001 C CNN
	1    3050 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0204
U 1 1 5AA86963
P 3800 3950
AR Path="/59CF60C9/5AA86963" Ref="#PWR0204"  Part="1" 
AR Path="/5AA6CD5B/5AA86963" Ref="#PWR0504"  Part="1" 
AR Path="/5AA70A0F/5AA86963" Ref="#PWR0604"  Part="1" 
AR Path="/5AA725C2/5AA86963" Ref="#PWR0704"  Part="1" 
F 0 "#PWR0704" H 3800 3700 50  0001 C CNN
F 1 "GND" H 3805 3777 50  0000 C CNN
F 2 "" H 3800 3950 50  0001 C CNN
F 3 "" H 3800 3950 50  0001 C CNN
	1    3800 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0212
U 1 1 5AA869C7
P 7000 4650
AR Path="/59CF60C9/5AA869C7" Ref="#PWR0212"  Part="1" 
AR Path="/5AA6CD5B/5AA869C7" Ref="#PWR0512"  Part="1" 
AR Path="/5AA70A0F/5AA869C7" Ref="#PWR0612"  Part="1" 
AR Path="/5AA725C2/5AA869C7" Ref="#PWR0712"  Part="1" 
F 0 "#PWR0712" H 7000 4400 50  0001 C CNN
F 1 "GND" H 7005 4477 50  0000 C CNN
F 2 "" H 7000 4650 50  0001 C CNN
F 3 "" H 7000 4650 50  0001 C CNN
	1    7000 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0213
U 1 1 5AA86A0A
P 7400 4650
AR Path="/59CF60C9/5AA86A0A" Ref="#PWR0213"  Part="1" 
AR Path="/5AA6CD5B/5AA86A0A" Ref="#PWR0513"  Part="1" 
AR Path="/5AA70A0F/5AA86A0A" Ref="#PWR0613"  Part="1" 
AR Path="/5AA725C2/5AA86A0A" Ref="#PWR0713"  Part="1" 
F 0 "#PWR0713" H 7400 4400 50  0001 C CNN
F 1 "GND" H 7405 4477 50  0000 C CNN
F 2 "" H 7400 4650 50  0001 C CNN
F 3 "" H 7400 4650 50  0001 C CNN
	1    7400 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0215
U 1 1 5AA86A8F
P 8100 4000
AR Path="/59CF60C9/5AA86A8F" Ref="#PWR0215"  Part="1" 
AR Path="/5AA6CD5B/5AA86A8F" Ref="#PWR0515"  Part="1" 
AR Path="/5AA70A0F/5AA86A8F" Ref="#PWR0615"  Part="1" 
AR Path="/5AA725C2/5AA86A8F" Ref="#PWR0715"  Part="1" 
F 0 "#PWR0715" H 8100 3750 50  0001 C CNN
F 1 "GND" H 8105 3827 50  0000 C CNN
F 2 "" H 8100 4000 50  0001 C CNN
F 3 "" H 8100 4000 50  0001 C CNN
	1    8100 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0216
U 1 1 5AA86AC7
P 8900 4000
AR Path="/59CF60C9/5AA86AC7" Ref="#PWR0216"  Part="1" 
AR Path="/5AA6CD5B/5AA86AC7" Ref="#PWR0516"  Part="1" 
AR Path="/5AA70A0F/5AA86AC7" Ref="#PWR0616"  Part="1" 
AR Path="/5AA725C2/5AA86AC7" Ref="#PWR0716"  Part="1" 
F 0 "#PWR0716" H 8900 3750 50  0001 C CNN
F 1 "GND" H 8905 3827 50  0000 C CNN
F 2 "" H 8900 4000 50  0001 C CNN
F 3 "" H 8900 4000 50  0001 C CNN
	1    8900 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0208
U 1 1 5AA86B4C
P 6200 2750
AR Path="/59CF60C9/5AA86B4C" Ref="#PWR0208"  Part="1" 
AR Path="/5AA6CD5B/5AA86B4C" Ref="#PWR0508"  Part="1" 
AR Path="/5AA70A0F/5AA86B4C" Ref="#PWR0608"  Part="1" 
AR Path="/5AA725C2/5AA86B4C" Ref="#PWR0708"  Part="1" 
F 0 "#PWR0708" H 6200 2500 50  0001 C CNN
F 1 "GND" H 6205 2577 50  0000 C CNN
F 2 "" H 6200 2750 50  0001 C CNN
F 3 "" H 6200 2750 50  0001 C CNN
	1    6200 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0211
U 1 1 5AA86B84
P 6400 2750
AR Path="/59CF60C9/5AA86B84" Ref="#PWR0211"  Part="1" 
AR Path="/5AA6CD5B/5AA86B84" Ref="#PWR0511"  Part="1" 
AR Path="/5AA70A0F/5AA86B84" Ref="#PWR0611"  Part="1" 
AR Path="/5AA725C2/5AA86B84" Ref="#PWR0711"  Part="1" 
F 0 "#PWR0711" H 6400 2500 50  0001 C CNN
F 1 "GND" H 6405 2577 50  0000 C CNN
F 2 "" H 6400 2750 50  0001 C CNN
F 3 "" H 6400 2750 50  0001 C CNN
	1    6400 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0210
U 1 1 5AA86BC7
P 6300 3250
AR Path="/59CF60C9/5AA86BC7" Ref="#PWR0210"  Part="1" 
AR Path="/5AA6CD5B/5AA86BC7" Ref="#PWR0510"  Part="1" 
AR Path="/5AA70A0F/5AA86BC7" Ref="#PWR0610"  Part="1" 
AR Path="/5AA725C2/5AA86BC7" Ref="#PWR0710"  Part="1" 
F 0 "#PWR0710" H 6300 3000 50  0001 C CNN
F 1 "GND" H 6305 3077 50  0000 C CNN
F 2 "" H 6300 3250 50  0001 C CNN
F 3 "" H 6300 3250 50  0001 C CNN
	1    6300 3250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0206
U 1 1 5AA86C15
P 5900 3400
AR Path="/59CF60C9/5AA86C15" Ref="#PWR0206"  Part="1" 
AR Path="/5AA6CD5B/5AA86C15" Ref="#PWR0506"  Part="1" 
AR Path="/5AA70A0F/5AA86C15" Ref="#PWR0606"  Part="1" 
AR Path="/5AA725C2/5AA86C15" Ref="#PWR0706"  Part="1" 
F 0 "#PWR0706" H 5900 3150 50  0001 C CNN
F 1 "GND" H 5905 3227 50  0000 C CNN
F 2 "" H 5900 3400 50  0001 C CNN
F 3 "" H 5900 3400 50  0001 C CNN
	1    5900 3400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0209
U 1 1 5AA86C4D
P 6250 4200
AR Path="/59CF60C9/5AA86C4D" Ref="#PWR0209"  Part="1" 
AR Path="/5AA6CD5B/5AA86C4D" Ref="#PWR0509"  Part="1" 
AR Path="/5AA70A0F/5AA86C4D" Ref="#PWR0609"  Part="1" 
AR Path="/5AA725C2/5AA86C4D" Ref="#PWR0709"  Part="1" 
F 0 "#PWR0709" H 6250 3950 50  0001 C CNN
F 1 "GND" H 6255 4027 50  0000 C CNN
F 2 "" H 6250 4200 50  0001 C CNN
F 3 "" H 6250 4200 50  0001 C CNN
	1    6250 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0214
U 1 1 5AA86DAD
P 7550 2700
AR Path="/59CF60C9/5AA86DAD" Ref="#PWR0214"  Part="1" 
AR Path="/5AA6CD5B/5AA86DAD" Ref="#PWR0514"  Part="1" 
AR Path="/5AA70A0F/5AA86DAD" Ref="#PWR0614"  Part="1" 
AR Path="/5AA725C2/5AA86DAD" Ref="#PWR0714"  Part="1" 
F 0 "#PWR0714" H 7550 2450 50  0001 C CNN
F 1 "GND" H 7555 2527 50  0000 C CNN
F 2 "" H 7550 2700 50  0001 C CNN
F 3 "" H 7550 2700 50  0001 C CNN
	1    7550 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 4650 7000 4500
Wire Wire Line
	6400 2750 6400 2700
$Comp
L device:C_Small C202
U 1 1 5AA8D6EA
P 3050 5300
AR Path="/59CF60C9/5AA8D6EA" Ref="C202"  Part="1" 
AR Path="/5AA6CD5B/5AA8D6EA" Ref="C502"  Part="1" 
AR Path="/5AA70A0F/5AA8D6EA" Ref="C602"  Part="1" 
AR Path="/5AA725C2/5AA8D6EA" Ref="C702"  Part="1" 
F 0 "C502" H 3060 5370 50  0000 L CNN
F 1 "100pF" H 3060 5220 50  0000 L CNN
F 2 "paddle:SMD_0805" H 3050 5300 50  0001 C CNN
F 3 "" H 3050 5300 50  0001 C CNN
	1    3050 5300
	-1   0    0    1   
$EndComp
$Comp
L paddle:R_US R202
U 1 1 5AA8D6F1
P 2550 5050
AR Path="/59CF60C9/5AA8D6F1" Ref="R202"  Part="1" 
AR Path="/5AA6CD5B/5AA8D6F1" Ref="R502"  Part="1" 
AR Path="/5AA70A0F/5AA8D6F1" Ref="R602"  Part="1" 
AR Path="/5AA725C2/5AA8D6F1" Ref="R702"  Part="1" 
F 0 "R502" H 2575 5150 60  0000 C CNN
F 1 "20.0k" H 2500 4950 60  0000 C CNN
F 2 "paddle:SMD_0805" H 2550 4700 60  0001 C CNN
F 3 "" H 2575 5150 60  0000 C CNN
	1    2550 5050
	-1   0    0    1   
$EndComp
$Comp
L paddle:LTC2052 U201
U 2 1 5AA8D6F8
P 3800 5150
AR Path="/59CF60C9/5AA8D6F8" Ref="U201"  Part="2" 
AR Path="/5AA6CD5B/5AA8D6F8" Ref="U501"  Part="2" 
AR Path="/5AA70A0F/5AA8D6F8" Ref="U601"  Part="2" 
AR Path="/5AA725C2/5AA8D6F8" Ref="U701"  Part="2" 
F 0 "U501" H 3800 5350 50  0000 L CNN
F 1 "LTC2052" H 3800 4950 50  0000 L CNN
F 2 "paddle:TSSOP-8_3x3mm_Pitch0.65mm" H 3800 5150 50  0001 C CNN
F 3 "" H 3800 5150 50  0001 C CNN
	2    3800 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 5150 4200 5150
Wire Wire Line
	3350 5250 3350 5700
Wire Wire Line
	3050 5050 3050 5200
Connection ~ 3050 5050
Wire Wire Line
	3050 5400 3050 5450
Connection ~ 4200 5150
Wire Wire Line
	4200 5150 4200 5700
Wire Wire Line
	2750 5050 3050 5050
Wire Wire Line
	3500 5250 3350 5250
Wire Wire Line
	4200 5700 3350 5700
Wire Wire Line
	2250 5050 2350 5050
Wire Wire Line
	3050 5050 3250 5050
Wire Wire Line
	4200 5150 4300 5150
$Comp
L paddle:R_US R204
U 1 1 5AA8D70C
P 3600 6050
AR Path="/59CF60C9/5AA8D70C" Ref="R204"  Part="1" 
AR Path="/5AA6CD5B/5AA8D70C" Ref="R504"  Part="1" 
AR Path="/5AA70A0F/5AA8D70C" Ref="R604"  Part="1" 
AR Path="/5AA725C2/5AA8D70C" Ref="R704"  Part="1" 
F 0 "R504" H 3625 6150 60  0000 C CNN
F 1 "DNP" H 3550 5950 60  0000 C CNN
F 2 "paddle:SMD_0805" H 3600 5700 60  0001 C CNN
F 3 "" H 3625 6150 60  0000 C CNN
	1    3600 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 6050 4300 6050
Wire Wire Line
	4300 6050 4300 5150
Wire Wire Line
	3400 6050 3250 6050
Wire Wire Line
	3250 6050 3250 5050
Connection ~ 3250 5050
Wire Wire Line
	3250 5050 3500 5050
$Comp
L power:GND #PWR0202
U 1 1 5AA8D721
P 3050 5450
AR Path="/59CF60C9/5AA8D721" Ref="#PWR0202"  Part="1" 
AR Path="/5AA6CD5B/5AA8D721" Ref="#PWR0502"  Part="1" 
AR Path="/5AA70A0F/5AA8D721" Ref="#PWR0602"  Part="1" 
AR Path="/5AA725C2/5AA8D721" Ref="#PWR0702"  Part="1" 
F 0 "#PWR0702" H 3050 5200 50  0001 C CNN
F 1 "GND" H 3055 5277 50  0000 C CNN
F 2 "" H 3050 5450 50  0001 C CNN
F 3 "" H 3050 5450 50  0001 C CNN
	1    3050 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 5150 4300 5150
Wire Wire Line
	5650 3900 5650 5150
Connection ~ 4300 5150
$Comp
L device:C_Small C207
U 1 1 5AAC9B85
P 4200 3400
AR Path="/59CF60C9/5AAC9B85" Ref="C207"  Part="1" 
AR Path="/5AA6CD5B/5AAC9B85" Ref="C507"  Part="1" 
AR Path="/5AA70A0F/5AAC9B85" Ref="C607"  Part="1" 
AR Path="/5AA725C2/5AAC9B85" Ref="C707"  Part="1" 
F 0 "C507" H 4210 3470 50  0000 L CNN
F 1 "0.1uF" H 4210 3320 50  0000 L CNN
F 2 "paddle:SMD_0805" H 4200 3400 50  0001 C CNN
F 3 "" H 4200 3400 50  0001 C CNN
	1    4200 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3800 3250 3800 3300
Wire Wire Line
	4200 3300 3800 3300
Connection ~ 3800 3300
Wire Wire Line
	3800 3300 3800 3550
$Comp
L power:GND #PWR0217
U 1 1 5AACE164
P 4200 3500
AR Path="/59CF60C9/5AACE164" Ref="#PWR0217"  Part="1" 
AR Path="/5AA6CD5B/5AACE164" Ref="#PWR0517"  Part="1" 
AR Path="/5AA70A0F/5AACE164" Ref="#PWR0617"  Part="1" 
AR Path="/5AA725C2/5AACE164" Ref="#PWR0717"  Part="1" 
F 0 "#PWR0717" H 4200 3250 50  0001 C CNN
F 1 "GND" H 4205 3327 50  0000 C CNN
F 2 "" H 4200 3500 50  0001 C CNN
F 3 "" H 4200 3500 50  0001 C CNN
	1    4200 3500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
