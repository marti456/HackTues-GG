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
L Sensor_Temperature:DS18B20 U?
U 1 1 604C4234
P 3100 5600
F 0 "U?" H 2870 5646 50  0000 R CNN
F 1 "DS18B20" H 2870 5555 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 2100 5350 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS18B20.pdf" H 2950 5850 50  0001 C CNN
	1    3100 5600
	-1   0    0    -1  
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
$Comp
L KiCad-scheme-rescue:InfraRed-Sensor_Distance U?
U 1 1 604BD4C7
P 3400 5250
F 0 "U?" H 3729 5659 50  0000 C CNN
F 1 "InfraRed" H 3729 5576 39  0000 C CNN
F 2 "" H 3400 5250 50  0001 C CNN
F 3 "" H 3400 5250 50  0001 C CNN
	1    3400 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5050 2300 5050
Wire Wire Line
	3400 4900 3100 4900
Wire Wire Line
	3100 4900 3100 5300
Wire Wire Line
	3100 5300 3400 5300
Wire Wire Line
	3400 5300 3400 5150
Wire Wire Line
	3400 4300 3400 4900
Wire Wire Line
	3400 5100 2500 5100
Wire Wire Line
	2500 5100 2500 6800
Connection ~ 2500 6800
Wire Wire Line
	2500 6800 1800 6800
Connection ~ 3100 5300
Wire Wire Line
	2300 5150 2800 5150
Wire Wire Line
	2800 5150 2800 5600
Wire Wire Line
	3100 5900 3100 6800
Wire Wire Line
	3100 6800 2500 6800
Wire Wire Line
	3400 4300 1700 4300
Wire Wire Line
	1700 4300 1700 4450
$EndSCHEMATC
