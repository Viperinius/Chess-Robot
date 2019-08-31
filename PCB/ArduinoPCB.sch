EESchema Schematic File Version 2
LIBS:ArduinoPCB-rescue
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
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
LIBS:arduino_nano
LIBS:ArduinoPCB-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Sensor & Actuator Arduinos"
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Arduino_Nano A1
U 1 1 5D6AE5F9
P 7100 2950
F 0 "A1" H 7100 2950 60  0001 C CNN
F 1 "Arduino_Nano" H 7100 3100 60  0000 C CNN
F 2 "" H 7100 2950 60  0000 C CNN
F 3 "" H 7100 2950 60  0000 C CNN
F 4 "Actuators" H 7100 2950 60  0000 C CNN "Feld4"
	1    7100 2950
	1    0    0    -1  
$EndComp
$Comp
L Arduino_Nano A2
U 1 1 5D6AE6BD
P 2900 2900
F 0 "A2" H 2900 2900 60  0001 C CNN
F 1 "Arduino_Nano" H 2900 3050 60  0000 C CNN
F 2 "" H 2900 2900 60  0000 C CNN
F 3 "" H 2900 2900 60  0000 C CNN
F 4 "Sensors" H 2900 2900 60  0000 C CNN "Feld4"
	1    2900 2900
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J?
U 1 1 5D6ADA21
P 850 4500
F 0 "J?" H 850 4700 50  0000 C CNN
F 1 "Conn_01x04" H 850 4200 50  0000 C CNN
F 2 "" H 850 4500 50  0001 C CNN
F 3 "" H 850 4500 50  0001 C CNN
	1    850  4500
	-1   0    0    -1  
$EndComp
Text GLabel 1050 4400 2    60   UnSpc ~ 0
5V
Text GLabel 1050 4500 2    60   UnSpc ~ 0
GND
Text GLabel 1050 4600 2    60   UnSpc ~ 0
SDA
Text GLabel 1050 4700 2    60   UnSpc ~ 0
SCL
Text GLabel 2250 2350 0    60   UnSpc ~ 0
5V
Text GLabel 2250 3800 0    60   UnSpc ~ 0
GND
Text GLabel 3600 3650 2    60   UnSpc ~ 0
SDA
Text GLabel 3600 3750 2    60   UnSpc ~ 0
SCL
Text GLabel 7800 3700 2    60   UnSpc ~ 0
SDA
Text GLabel 7800 3800 2    60   UnSpc ~ 0
SCL
Text GLabel 6450 3850 0    60   UnSpc ~ 0
GND
NoConn ~ 3600 1850
NoConn ~ 3600 1950
NoConn ~ 3600 2050
NoConn ~ 3600 2150
NoConn ~ 3600 2250
NoConn ~ 3600 2350
NoConn ~ 3600 2450
NoConn ~ 3600 2550
NoConn ~ 3600 2650
NoConn ~ 3600 2750
NoConn ~ 3600 2850
NoConn ~ 3600 2950
NoConn ~ 3600 3050
NoConn ~ 3600 3150
NoConn ~ 3600 3250
NoConn ~ 3600 3350
NoConn ~ 3600 3450
NoConn ~ 3600 3850
NoConn ~ 3600 3950
NoConn ~ 2250 3050
NoConn ~ 2250 2600
NoConn ~ 2250 2250
NoConn ~ 2250 2450
NoConn ~ 2250 3900
NoConn ~ 6450 2300
NoConn ~ 6450 2650
NoConn ~ 6450 3100
NoConn ~ 6450 3950
NoConn ~ 6450 2400
$EndSCHEMATC
