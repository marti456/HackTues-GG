EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
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
L Device:Solar_Cell SP
U 1 1 604C0D38
P 1100 4650
F 0 "SP" H 750 4800 50  0000 L CNN
F 1 "Solar_panel" H 550 4700 50  0000 L CNN
F 2 "" V 1100 4710 50  0001 C CNN
F 3 "~" V 1100 4710 50  0001 C CNN
	1    1100 4650
	1    0    0    -1  
$EndComp
$Comp
L MCU_Module:Arduino_UNO_R3 ESP8266
U 1 1 604CB79C
P 1800 5450
F 0 "ESP8266" H 1800 5600 50  0000 C CNN
F 1 "ESP8266MOD" H 1800 5500 50  0000 C CNN
F 2 "Module:Arduino_UNO_R3" H 1800 5450 50  0001 C CIN
F 3 "https://www.arduino.cc/en/Main/arduinoBoardUno" H 1800 5450 50  0001 C CNN
	1    1800 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1700 6550 1800 6550
Connection ~ 1800 6550
Wire Wire Line
	1800 6550 1900 6550
Wire Wire Line
	1100 4750 1100 6800
Wire Wire Line
	1100 6800 1800 6800
Wire Wire Line
	1800 6800 1800 6550
Wire Wire Line
	1100 4450 1100 4200
Wire Wire Line
	1100 4200 1900 4200
Wire Wire Line
	1900 4200 1900 4450
Connection ~ 1800 6800
Wire Wire Line
	1700 4300 1700 4450
$Comp
L Device:LED D?
U 1 1 604D96B0
P 3900 5150
F 0 "D?" H 3893 4895 50  0000 C CNN
F 1 "LED" H 3893 4986 50  0000 C CNN
F 2 "" H 3900 5150 50  0001 C CNN
F 3 "~" H 3900 5150 50  0001 C CNN
	1    3900 5150
	-1   0    0    1   
$EndComp
Wire Wire Line
	1800 6800 2500 6800
$Comp
L Sensor_Motion:Light U?
U 1 1 604DC9C1
P 2800 5000
F 0 "U?" H 3100 5050 50  0000 L CNN
F 1 "Light" H 3100 4850 50  0000 L CNN
F 2 "" H 3150 5000 50  0001 C CNN
F 3 "" H 3150 5000 50  0001 C CNN
	1    2800 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 4300 2750 4300
Wire Wire Line
	2750 4300 2750 5100
Wire Wire Line
	2750 5150 2500 5150
Wire Wire Line
	2500 5150 2500 6800
Connection ~ 2500 6800
Wire Wire Line
	2750 5200 2450 5200
Wire Wire Line
	2450 5200 2450 4950
Wire Wire Line
	2450 4950 2300 4950
Wire Wire Line
	4050 5150 4050 6800
Wire Wire Line
	2500 6800 4050 6800
Wire Wire Line
	3750 5150 3750 5650
Wire Wire Line
	3750 5650 2300 5650
$EndSCHEMATC
