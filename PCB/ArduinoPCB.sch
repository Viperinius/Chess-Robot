EESchema Schematic File Version 2
LIBS:74xgxx
LIBS:74xx
LIBS:ac-dc
LIBS:actel
LIBS:adc-dac
LIBS:allegro
LIBS:Altera
LIBS:analog_devices
LIBS:analog_switches
LIBS:atmel
LIBS:audio
LIBS:battery_management
LIBS:bbd
LIBS:bosch
LIBS:brooktre
LIBS:cmos_ieee
LIBS:cmos4000
LIBS:conn
LIBS:contrib
LIBS:cypress
LIBS:dc-dc
LIBS:device
LIBS:digital-audio
LIBS:diode
LIBS:display
LIBS:dsp
LIBS:elec-unifil
LIBS:ESD_Protection
LIBS:ftdi
LIBS:gennum
LIBS:graphic_symbols
LIBS:hc11
LIBS:infineon
LIBS:intel
LIBS:interface
LIBS:intersil
LIBS:ir
LIBS:Lattice
LIBS:leds
LIBS:LEM
LIBS:linear
LIBS:logic_programmable
LIBS:maxim
LIBS:mechanical
LIBS:memory
LIBS:microchip
LIBS:microchip_dspic33dsc
LIBS:microchip_pic10mcu
LIBS:microchip_pic12mcu
LIBS:microchip_pic16mcu
LIBS:microchip_pic18mcu
LIBS:microchip_pic24mcu
LIBS:microchip_pic32mcu
LIBS:microcontrollers
LIBS:modules
LIBS:motor_drivers
LIBS:motorola
LIBS:motors
LIBS:msp430
LIBS:nordicsemi
LIBS:nxp
LIBS:nxp_armmcu
LIBS:onsemi
LIBS:opto
LIBS:Oscillators
LIBS:philips
LIBS:power
LIBS:Power_Management
LIBS:powerint
LIBS:pspice
LIBS:references
LIBS:regul
LIBS:relays
LIBS:rfcom
LIBS:RFSolutions
LIBS:sensors
LIBS:silabs
LIBS:siliconi
LIBS:stm8
LIBS:stm32
LIBS:supertex
LIBS:switches
LIBS:texas
LIBS:transf
LIBS:transistors
LIBS:triac_thyristor
LIBS:ttl_ieee
LIBS:valves
LIBS:video
LIBS:wiznet
LIBS:Worldsemi
LIBS:Xicor
LIBS:xilinx
LIBS:zetex
LIBS:Zilog
LIBS:arduino_nano
LIBS:lerchetech
LIBS:ArduinoPCB-cache
EELAYER 25 0
EELAYER END
$Descr A3 16535 11693
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
P 6600 6750
F 0 "A1" H 6600 6750 60  0001 C CNN
F 1 "Arduino_Nano" H 6600 6900 60  0000 C CNN
F 2 "KiCAD_libraries:arduino_nano" H 6600 6750 60  0001 C CNN
F 3 "" H 6600 6750 60  0000 C CNN
F 4 "Actuators" H 6600 6750 60  0000 C CNN "Feld4"
	1    6600 6750
	1    0    0    -1  
$EndComp
$Comp
L Arduino_Nano A2
U 1 1 5D6AE6BD
P 1400 1750
F 0 "A2" H 1400 1750 60  0001 C CNN
F 1 "Arduino_Nano" H 1400 1900 60  0000 C CNN
F 2 "KiCAD_libraries:arduino_nano" H 1400 1750 60  0001 C CNN
F 3 "" H 1400 1750 60  0000 C CNN
F 4 "Sensors" H 1400 1750 60  0000 C CNN "Feld4"
	1    1400 1750
	1    0    0    -1  
$EndComp
Text GLabel 1050 4200 2    60   UnSpc ~ 0
GND
Text GLabel 1050 4500 2    60   UnSpc ~ 0
SDA
Text GLabel 1050 4600 2    60   UnSpc ~ 0
SCL
Text GLabel 750  1200 0    60   UnSpc ~ 0
5V
Text GLabel 750  2650 0    60   UnSpc ~ 0
GND
Text GLabel 2100 2500 2    60   UnSpc ~ 0
SDA
Text GLabel 2100 2600 2    60   UnSpc ~ 0
SCL
Text GLabel 7300 7500 2    60   UnSpc ~ 0
SDA
Text GLabel 7300 7600 2    60   UnSpc ~ 0
SCL
Text GLabel 5950 7650 0    60   UnSpc ~ 0
GND
NoConn ~ 2100 700 
NoConn ~ 2100 800 
NoConn ~ 2100 900 
NoConn ~ 2100 1000
NoConn ~ 2100 1100
NoConn ~ 2100 1200
NoConn ~ 2100 1300
NoConn ~ 2100 1400
NoConn ~ 2100 1500
NoConn ~ 2100 1600
NoConn ~ 2100 1700
NoConn ~ 2100 1800
NoConn ~ 2100 1900
NoConn ~ 2100 2000
NoConn ~ 2100 2100
NoConn ~ 2100 2200
NoConn ~ 2100 2300
NoConn ~ 2100 2700
NoConn ~ 2100 2800
NoConn ~ 750  1900
NoConn ~ 750  1450
NoConn ~ 750  1100
NoConn ~ 750  2750
$Comp
L MCP23017 U1
U 1 1 5D6FE3D2
P 4550 1750
F 0 "U1" H 4450 2775 50  0000 R CNN
F 1 "MCP23017" H 4450 2700 50  0000 R CNN
F 2 "Housings_DIP:DIP-28_W7.62mm_Socket" H 4600 800 50  0001 L CNN
F 3 "" H 4800 2750 50  0001 C CNN
F 4 "I2C: 0x21" H 4550 1750 60  0000 C CNN "Field4"
	1    4550 1750
	1    0    0    -1  
$EndComp
$Comp
L MCP23017 U2
U 1 1 5D6FE431
P 7500 1750
F 0 "U2" H 7400 2775 50  0000 R CNN
F 1 "MCP23017" H 7400 2700 50  0000 R CNN
F 2 "Housings_DIP:DIP-28_W7.62mm_Socket" H 7550 800 50  0001 L CNN
F 3 "" H 7750 2750 50  0001 C CNN
F 4 "I2C: 0x22" H 7500 1750 60  0000 C CNN "Field4"
	1    7500 1750
	1    0    0    -1  
$EndComp
$Comp
L MCP23017 U3
U 1 1 5D6FE488
P 10500 1750
F 0 "U3" H 10400 2775 50  0000 R CNN
F 1 "MCP23017" H 10400 2700 50  0000 R CNN
F 2 "Housings_DIP:DIP-28_W7.62mm_Socket" H 10550 800 50  0001 L CNN
F 3 "" H 10750 2750 50  0001 C CNN
F 4 "I2C: 0x23" H 10500 1750 60  0000 C CNN "Field4"
	1    10500 1750
	1    0    0    -1  
$EndComp
$Comp
L MCP23017 U4
U 1 1 5D6FE4F7
P 13500 1750
F 0 "U4" H 13400 2775 50  0000 R CNN
F 1 "MCP23017" H 13400 2700 50  0000 R CNN
F 2 "Housings_DIP:DIP-28_W7.62mm_Socket" H 13550 800 50  0001 L CNN
F 3 "" H 13750 2750 50  0001 C CNN
F 4 "I2C: 0x24" H 13500 1750 60  0000 C CNN "Field4"
	1    13500 1750
	1    0    0    -1  
$EndComp
$Comp
L Pololu_Breakout_DRV8825 A3
U 1 1 5D8133BC
P 1900 7200
F 0 "A3" H 1800 7850 50  0000 R CNN
F 1 "Pololu_Breakout_DRV8825" H 1800 7750 50  0000 R CNN
F 2 "Modules:Pololu_Breakout-16_15.2x20.3mm" H 2100 6400 50  0001 L CNN
F 3 "" H 2000 6900 50  0001 C CNN
	1    1900 7200
	1    0    0    -1  
$EndComp
$Comp
L Pololu_Breakout_DRV8825 A4
U 1 1 5D8136ED
P 1900 9400
F 0 "A4" H 1800 10050 50  0000 R CNN
F 1 "Pololu_Breakout_DRV8825" H 1800 9950 50  0000 R CNN
F 2 "Modules:Pololu_Breakout-16_15.2x20.3mm" H 2100 8600 50  0001 L CNN
F 3 "" H 2000 9100 50  0001 C CNN
	1    1900 9400
	1    0    0    -1  
$EndComp
$Comp
L Pololu_Breakout_DRV8825 A6
U 1 1 5D81385C
P 3550 9400
F 0 "A6" H 3450 10050 50  0000 R CNN
F 1 "Pololu_Breakout_DRV8825" H 3450 9950 50  0000 R CNN
F 2 "Modules:Pololu_Breakout-16_15.2x20.3mm" H 3750 8600 50  0001 L CNN
F 3 "" H 3650 9100 50  0001 C CNN
	1    3550 9400
	1    0    0    -1  
$EndComp
$Comp
L Pololu_Breakout_DRV8825 A5
U 1 1 5D8138A7
P 3550 7200
F 0 "A5" H 3450 7850 50  0000 R CNN
F 1 "Pololu_Breakout_DRV8825" H 3450 7750 50  0000 R CNN
F 2 "Modules:Pololu_Breakout-16_15.2x20.3mm" H 3750 6400 50  0001 L CNN
F 3 "" H 3650 6900 50  0001 C CNN
	1    3550 7200
	1    0    0    -1  
$EndComp
NoConn ~ 2100 2400
$Comp
L Conn_01x16 J6
U 1 1 5D8143CE
P 3100 700
F 0 "J6" H 3100 1500 50  0000 C CNN
F 1 "Reed1" H 3100 -200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.54mm" H 3100 700 50  0001 C CNN
F 3 "" H 3100 700 50  0001 C CNN
	1    3100 700 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2400 900  2400 1850
Wire Wire Line
	2400 1850 4050 1850
Wire Wire Line
	4050 1950 2500 1950
Wire Wire Line
	2500 1950 2500 900 
Wire Wire Line
	2600 900  2600 2050
Wire Wire Line
	2600 2050 4050 2050
Wire Wire Line
	2700 900  2700 2150
Wire Wire Line
	2700 2150 4050 2150
Wire Wire Line
	2800 900  2800 2250
Wire Wire Line
	2800 2250 4050 2250
Wire Wire Line
	2900 900  2900 2350
Wire Wire Line
	2900 2350 4050 2350
Wire Wire Line
	3000 900  3000 2450
Wire Wire Line
	3000 2450 4050 2450
Wire Wire Line
	3100 900  3100 2550
Wire Wire Line
	3100 2550 4050 2550
Wire Wire Line
	3200 900  3200 950 
Wire Wire Line
	3200 950  4050 950 
Wire Wire Line
	3300 900  3300 1050
Wire Wire Line
	3300 1050 4050 1050
Wire Wire Line
	3400 900  3400 1150
Wire Wire Line
	3400 1150 4050 1150
Wire Wire Line
	3500 900  3500 1250
Wire Wire Line
	3500 1250 4050 1250
Wire Wire Line
	3600 900  3600 1350
Wire Wire Line
	3600 1350 4050 1350
Wire Wire Line
	3700 900  3700 1450
Wire Wire Line
	3700 1450 4050 1450
Wire Wire Line
	3800 900  3800 1550
Wire Wire Line
	3800 1550 4050 1550
Wire Wire Line
	3900 900  3900 1650
Wire Wire Line
	3900 1650 4050 1650
$Comp
L Conn_01x16 J10
U 1 1 5D814C79
P 6050 700
F 0 "J10" H 6050 1500 50  0000 C CNN
F 1 "Reed2" H 6050 -200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.54mm" H 6050 700 50  0001 C CNN
F 3 "" H 6050 700 50  0001 C CNN
	1    6050 700 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5350 900  5350 1850
Wire Wire Line
	5350 1850 7000 1850
Wire Wire Line
	5450 900  5450 1950
Wire Wire Line
	5450 1950 7000 1950
Wire Wire Line
	5550 900  5550 2050
Wire Wire Line
	5550 2050 7000 2050
Wire Wire Line
	5650 900  5650 2150
Wire Wire Line
	5650 2150 7000 2150
Wire Wire Line
	5750 900  5750 2250
Wire Wire Line
	5750 2250 7000 2250
Wire Wire Line
	5850 900  5850 2350
Wire Wire Line
	5850 2350 7000 2350
Wire Wire Line
	5950 900  5950 2450
Wire Wire Line
	5950 2450 7000 2450
Wire Wire Line
	6050 900  6050 2550
Wire Wire Line
	6050 2550 7000 2550
Wire Wire Line
	6150 900  6150 950 
Wire Wire Line
	6150 950  7000 950 
Wire Wire Line
	6250 900  6250 1050
Wire Wire Line
	6250 1050 7000 1050
Wire Wire Line
	6350 900  6350 1150
Wire Wire Line
	6350 1150 7000 1150
Wire Wire Line
	6450 900  6450 1250
Wire Wire Line
	6450 1250 7000 1250
Wire Wire Line
	6550 900  6550 1350
Wire Wire Line
	6550 1350 7000 1350
Wire Wire Line
	6650 900  6650 1450
Wire Wire Line
	6650 1450 7000 1450
Wire Wire Line
	6750 900  6750 1550
Wire Wire Line
	6750 1550 7000 1550
Wire Wire Line
	6850 900  6850 1650
Wire Wire Line
	6850 1650 7000 1650
$Comp
L Conn_01x16 J14
U 1 1 5D81539C
P 9050 700
F 0 "J14" H 9050 1500 50  0000 C CNN
F 1 "Reed3" H 9050 -200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.54mm" H 9050 700 50  0001 C CNN
F 3 "" H 9050 700 50  0001 C CNN
	1    9050 700 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8350 900  8350 1850
Wire Wire Line
	8450 900  8450 1950
Wire Wire Line
	8550 900  8550 2050
Wire Wire Line
	8650 900  8650 2150
Wire Wire Line
	8750 900  8750 2250
Wire Wire Line
	8850 900  8850 2350
Wire Wire Line
	8950 900  8950 2450
Wire Wire Line
	9050 900  9050 2550
Wire Wire Line
	9150 900  9150 950 
Wire Wire Line
	9250 900  9250 1050
Wire Wire Line
	9350 900  9350 1150
Wire Wire Line
	9450 900  9450 1250
Wire Wire Line
	9550 900  9550 1350
Wire Wire Line
	9650 900  9650 1450
Wire Wire Line
	9750 900  9750 1550
Wire Wire Line
	9850 900  9850 1650
Wire Wire Line
	9050 2550 10000 2550
Wire Wire Line
	8950 2450 10000 2450
Wire Wire Line
	8850 2350 10000 2350
Wire Wire Line
	8750 2250 10000 2250
Wire Wire Line
	8650 2150 10000 2150
Wire Wire Line
	8550 2050 10000 2050
Wire Wire Line
	8450 1950 10000 1950
Wire Wire Line
	8350 1850 10000 1850
Wire Wire Line
	9850 1650 10000 1650
Wire Wire Line
	9750 1550 10000 1550
Wire Wire Line
	9650 1450 10000 1450
Wire Wire Line
	9550 1350 10000 1350
Wire Wire Line
	9450 1250 10000 1250
Wire Wire Line
	9350 1150 10000 1150
Wire Wire Line
	9250 1050 10000 1050
Wire Wire Line
	9150 950  10000 950 
$Comp
L Conn_01x16 J15
U 1 1 5D816315
P 12050 700
F 0 "J15" H 12050 1500 50  0000 C CNN
F 1 "Reed4" H 12050 -200 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x16_Pitch2.54mm" H 12050 700 50  0001 C CNN
F 3 "" H 12050 700 50  0001 C CNN
	1    12050 700 
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11350 900  11350 1850
Wire Wire Line
	11350 1850 13000 1850
Wire Wire Line
	13000 1950 11450 1950
Wire Wire Line
	11450 1950 11450 900 
Wire Wire Line
	11550 900  11550 2050
Wire Wire Line
	11550 2050 13000 2050
Wire Wire Line
	13000 2150 11650 2150
Wire Wire Line
	11650 2150 11650 900 
Wire Wire Line
	11750 900  11750 2250
Wire Wire Line
	11750 2250 13000 2250
Wire Wire Line
	13000 2350 11850 2350
Wire Wire Line
	11850 2350 11850 900 
Wire Wire Line
	11950 900  11950 2450
Wire Wire Line
	11950 2450 13000 2450
Wire Wire Line
	12050 900  12050 2550
Wire Wire Line
	12050 2550 13000 2550
Wire Wire Line
	12150 900  12150 950 
Wire Wire Line
	12150 950  13000 950 
Wire Wire Line
	13000 1050 12250 1050
Wire Wire Line
	12250 1050 12250 900 
Wire Wire Line
	13000 1150 12350 1150
Wire Wire Line
	12350 1150 12350 900 
Wire Wire Line
	12450 900  12450 1250
Wire Wire Line
	12450 1250 13000 1250
Wire Wire Line
	12550 900  12550 1350
Wire Wire Line
	12550 1350 13000 1350
Wire Wire Line
	12650 900  12650 1450
Wire Wire Line
	12650 1450 13000 1450
Wire Wire Line
	12750 900  12750 1550
Wire Wire Line
	12750 1550 13000 1550
Wire Wire Line
	12850 900  12850 1650
Wire Wire Line
	12850 1650 13000 1650
Text GLabel 5050 950  2    60   UnSpc ~ 0
Pullup
Text GLabel 8000 950  2    60   UnSpc ~ 0
Pullup
Text GLabel 11000 950  2    60   UnSpc ~ 0
Pullup2
Text GLabel 14000 950  2    60   UnSpc ~ 0
Pullup2
Text GLabel 11000 2050 2    60   UnSpc ~ 0
SCL
Text GLabel 11000 2150 2    60   UnSpc ~ 0
SDA
Text GLabel 14000 2050 2    60   UnSpc ~ 0
SCL
Text GLabel 14000 2150 2    60   UnSpc ~ 0
SDA
Text GLabel 8000 2050 2    60   UnSpc ~ 0
SCL
Text GLabel 8000 2150 2    60   UnSpc ~ 0
SDA
Text GLabel 5050 2050 2    60   UnSpc ~ 0
SCL
Text GLabel 5050 2150 2    60   UnSpc ~ 0
SDA
Text GLabel 4550 750  1    60   UnSpc ~ 0
5V
Text GLabel 7500 750  1    60   UnSpc ~ 0
5V
Text GLabel 10500 750  1    60   UnSpc ~ 0
5V
Text GLabel 13500 750  1    60   UnSpc ~ 0
5V
Text GLabel 4550 2750 3    60   UnSpc ~ 0
GND
Text GLabel 7500 2750 3    60   UnSpc ~ 0
GND
Text GLabel 10500 2750 3    60   UnSpc ~ 0
GND
Text GLabel 13500 2750 3    60   UnSpc ~ 0
GND
NoConn ~ 5050 1350
NoConn ~ 5050 1450
NoConn ~ 8000 1350
NoConn ~ 8000 1450
NoConn ~ 11000 1350
NoConn ~ 11000 1450
NoConn ~ 14000 1350
NoConn ~ 14000 1450
Text GLabel 5050 2350 2    60   UnSpc ~ 0
5V
Text GLabel 5050 2450 2    60   UnSpc ~ 0
GND
Text GLabel 5050 2550 2    60   UnSpc ~ 0
GND
Text GLabel 8000 2350 2    60   UnSpc ~ 0
GND
Text GLabel 8000 2550 2    60   UnSpc ~ 0
GND
Text GLabel 8000 2450 2    60   UnSpc ~ 0
5V
Text GLabel 11000 2350 2    60   UnSpc ~ 0
5V
Text GLabel 11000 2450 2    60   UnSpc ~ 0
5V
Text GLabel 11000 2550 2    60   UnSpc ~ 0
GND
Text GLabel 14000 2350 2    60   UnSpc ~ 0
GND
Text GLabel 14000 2450 2    60   UnSpc ~ 0
GND
Text GLabel 14000 2550 2    60   UnSpc ~ 0
5V
Text GLabel 2150 4100 2    60   UnSpc ~ 0
5V
$Comp
L R R1
U 1 1 5D81809F
P 1350 3900
F 0 "R1" V 1430 3900 50  0000 C CNN
F 1 "10k" V 1350 3900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1280 3900 50  0001 C CNN
F 3 "" H 1350 3900 50  0001 C CNN
	1    1350 3900
	1    0    0    -1  
$EndComp
Text GLabel 1400 3700 2    60   UnSpc ~ 0
Pullup
Wire Wire Line
	1050 5050 1500 5050
Wire Wire Line
	1050 5350 1500 5350
Text GLabel 1200 5000 1    60   UnSpc ~ 0
8V+
Connection ~ 1200 5050
Text GLabel 1200 5400 3    60   UnSpc ~ 0
8V_GND
Connection ~ 1200 5350
Text GLabel 1900 6600 1    60   UnSpc ~ 0
8V+
Text GLabel 2000 8000 3    60   UnSpc ~ 0
8V_GND
Text GLabel 1900 8000 3    60   UnSpc ~ 0
GND
$Comp
L Conn_01x04 J4
U 1 1 5D81A1ED
P 2750 7250
F 0 "J4" H 2750 7450 50  0000 C CNN
F 1 "Stepper1" H 2750 6950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 2750 7250 50  0001 C CNN
F 3 "" H 2750 7250 50  0001 C CNN
	1    2750 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 7150 2450 7150
Wire Wire Line
	2450 7150 2450 7100
Wire Wire Line
	2450 7100 2300 7100
Wire Wire Line
	2300 7200 2450 7200
Wire Wire Line
	2450 7200 2450 7250
Wire Wire Line
	2450 7250 2550 7250
Wire Wire Line
	2550 7350 2450 7350
Wire Wire Line
	2450 7350 2450 7400
Wire Wire Line
	2450 7400 2300 7400
Wire Wire Line
	2300 7500 2450 7500
Wire Wire Line
	2450 7500 2450 7450
Wire Wire Line
	2450 7450 2550 7450
Text GLabel 1500 7000 0    60   UnSpc ~ 0
5V_2
Text GLabel 1500 6900 0    60   UnSpc ~ 0
5V_2
NoConn ~ 1500 7600
NoConn ~ 1500 7700
NoConn ~ 1500 7800
NoConn ~ 1500 6800
NoConn ~ 1500 7200
NoConn ~ 1500 9000
NoConn ~ 1500 9400
NoConn ~ 1500 9800
NoConn ~ 1500 9900
NoConn ~ 1500 10000
NoConn ~ 3150 10000
NoConn ~ 3150 9900
NoConn ~ 3150 9800
NoConn ~ 3150 9400
NoConn ~ 3150 9000
NoConn ~ 3150 6800
NoConn ~ 3150 7200
NoConn ~ 3150 7600
NoConn ~ 3150 7700
NoConn ~ 3150 7800
Text GLabel 1900 8800 1    60   UnSpc ~ 0
8V+
Text GLabel 3550 8800 1    60   UnSpc ~ 0
8V+
Text GLabel 3550 6600 1    60   UnSpc ~ 0
8V+
Text GLabel 1900 10200 3    60   UnSpc ~ 0
GND
Text GLabel 3550 10200 3    60   UnSpc ~ 0
GND
Text GLabel 3550 8000 3    60   UnSpc ~ 0
GND
Text GLabel 2000 10200 3    60   UnSpc ~ 0
8V_GND
Text GLabel 3650 10200 3    60   UnSpc ~ 0
8V_GND
Text GLabel 3650 8000 3    60   UnSpc ~ 0
8V_GND
$Comp
L Conn_01x04 J5
U 1 1 5D8265C4
P 2750 9450
F 0 "J5" H 2750 9650 50  0000 C CNN
F 1 "Stepper2" H 2750 9150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 2750 9450 50  0001 C CNN
F 3 "" H 2750 9450 50  0001 C CNN
	1    2750 9450
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J8
U 1 1 5D826695
P 4400 9450
F 0 "J8" H 4400 9650 50  0000 C CNN
F 1 "Stepper3" H 4400 9150 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 4400 9450 50  0001 C CNN
F 3 "" H 4400 9450 50  0001 C CNN
	1    4400 9450
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x04 J7
U 1 1 5D826805
P 4400 7250
F 0 "J7" H 4400 7450 50  0000 C CNN
F 1 "Stepper4" H 4400 6950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 4400 7250 50  0001 C CNN
F 3 "" H 4400 7250 50  0001 C CNN
	1    4400 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 7150 4050 7150
Wire Wire Line
	4050 7150 4050 7100
Wire Wire Line
	4050 7100 3950 7100
Wire Wire Line
	3950 7200 4050 7200
Wire Wire Line
	4050 7200 4050 7250
Wire Wire Line
	4050 7250 4200 7250
Wire Wire Line
	4200 7350 4050 7350
Wire Wire Line
	4050 7350 4050 7400
Wire Wire Line
	4050 7400 3950 7400
Wire Wire Line
	3950 7500 4050 7500
Wire Wire Line
	4050 7500 4050 7450
Wire Wire Line
	4050 7450 4200 7450
Wire Wire Line
	2300 9300 2400 9300
Wire Wire Line
	2400 9300 2400 9350
Wire Wire Line
	2400 9350 2550 9350
Wire Wire Line
	2300 9400 2400 9400
Wire Wire Line
	2400 9400 2400 9450
Wire Wire Line
	2400 9450 2550 9450
Wire Wire Line
	2300 9600 2400 9600
Wire Wire Line
	2400 9600 2400 9550
Wire Wire Line
	2400 9550 2550 9550
Wire Wire Line
	2300 9700 2400 9700
Wire Wire Line
	2400 9700 2400 9650
Wire Wire Line
	2400 9650 2550 9650
Wire Wire Line
	3950 9300 4050 9300
Wire Wire Line
	4050 9300 4050 9350
Wire Wire Line
	4050 9350 4200 9350
Wire Wire Line
	3950 9400 4050 9400
Wire Wire Line
	4050 9400 4050 9450
Wire Wire Line
	4050 9450 4200 9450
Wire Wire Line
	3950 9600 4050 9600
Wire Wire Line
	4050 9600 4050 9550
Wire Wire Line
	4050 9550 4200 9550
Wire Wire Line
	3950 9700 4050 9700
Wire Wire Line
	4050 9700 4050 9650
Wire Wire Line
	4050 9650 4200 9650
Text GLabel 3150 6900 0    60   UnSpc ~ 0
5V_2
Text GLabel 3150 7000 0    60   UnSpc ~ 0
5V_2
Text GLabel 1500 9100 0    60   UnSpc ~ 0
5V_2
Text GLabel 1500 9200 0    60   UnSpc ~ 0
5V_2
Text GLabel 3150 9100 0    60   UnSpc ~ 0
5V_2
Text GLabel 3150 9200 0    60   UnSpc ~ 0
5V_2
Wire Wire Line
	2950 7300 3150 7300
Wire Wire Line
	2950 7300 2950 5550
Wire Wire Line
	2950 5550 7500 5550
Wire Wire Line
	7500 5550 7500 6100
Wire Wire Line
	7500 6100 7300 6100
Wire Wire Line
	3150 7400 2900 7400
Wire Wire Line
	2900 7400 2900 5500
Wire Wire Line
	2900 5500 7550 5500
Wire Wire Line
	7550 5500 7550 6200
Wire Wire Line
	7550 6200 7300 6200
Wire Wire Line
	1500 7300 1300 7300
Wire Wire Line
	1300 7300 1300 6300
Wire Wire Line
	1300 6300 2850 6300
Wire Wire Line
	2850 6300 2850 5450
Wire Wire Line
	2850 5450 7400 5450
Wire Wire Line
	7400 5450 7400 5900
Wire Wire Line
	7400 5900 7300 5900
Wire Wire Line
	1500 7400 1250 7400
Wire Wire Line
	1250 7400 1250 6250
Wire Wire Line
	1250 6250 2800 6250
Wire Wire Line
	2800 6250 2800 5400
Wire Wire Line
	2800 5400 7450 5400
Wire Wire Line
	7450 5400 7450 6000
Wire Wire Line
	7450 6000 7300 6000
Wire Wire Line
	7300 6300 7600 6300
Wire Wire Line
	7600 6300 7600 5350
Wire Wire Line
	7600 5350 5100 5350
Wire Wire Line
	5100 5350 5100 8400
Wire Wire Line
	5100 8400 1300 8400
Wire Wire Line
	1300 8400 1300 9500
Wire Wire Line
	1300 9500 1500 9500
Wire Wire Line
	7300 6400 7650 6400
Wire Wire Line
	7650 6400 7650 5300
Wire Wire Line
	7650 5300 5050 5300
Wire Wire Line
	5050 5300 5050 8350
Wire Wire Line
	5050 8350 1250 8350
Wire Wire Line
	1250 8350 1250 9600
Wire Wire Line
	1250 9600 1500 9600
Wire Wire Line
	7300 6500 7700 6500
Wire Wire Line
	7700 6500 7700 5250
Wire Wire Line
	7700 5250 5150 5250
Wire Wire Line
	5150 5250 5150 8450
Wire Wire Line
	5150 8450 2900 8450
Wire Wire Line
	2900 8450 2900 9500
Wire Wire Line
	2900 9500 3150 9500
Wire Wire Line
	7300 6600 7750 6600
Wire Wire Line
	7750 6600 7750 5200
Wire Wire Line
	7750 5200 5200 5200
Wire Wire Line
	5200 5200 5200 8500
Wire Wire Line
	5200 8500 2950 8500
Wire Wire Line
	2950 8500 2950 9600
Wire Wire Line
	2950 9600 3150 9600
$Comp
L Conn_01x03 J9
U 1 1 5D82905F
P 5750 9250
F 0 "J9" H 5750 9450 50  0000 C CNN
F 1 "EndStop1" H 5750 9050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5750 9250 50  0001 C CNN
F 3 "" H 5750 9250 50  0001 C CNN
	1    5750 9250
	0    -1   1    0   
$EndComp
$Comp
L Conn_01x03 J11
U 1 1 5D8291F9
P 6300 9250
F 0 "J11" H 6300 9450 50  0000 C CNN
F 1 "EndStop2" H 6300 9050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6300 9250 50  0001 C CNN
F 3 "" H 6300 9250 50  0001 C CNN
	1    6300 9250
	0    -1   1    0   
$EndComp
$Comp
L Conn_01x03 J13
U 1 1 5D82925D
P 6850 9250
F 0 "J13" H 6850 9450 50  0000 C CNN
F 1 "EndStop3" H 6850 9050 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 6850 9250 50  0001 C CNN
F 3 "" H 6850 9250 50  0001 C CNN
	1    6850 9250
	0    -1   1    0   
$EndComp
Text GLabel 5850 9050 1    60   UnSpc ~ 0
GND
Text GLabel 6400 9050 1    60   UnSpc ~ 0
GND
Text GLabel 6950 9050 1    60   UnSpc ~ 0
GND
Text GLabel 5750 9050 1    60   UnSpc ~ 0
5V_2
Text GLabel 6300 9050 1    60   UnSpc ~ 0
5V_2
Text GLabel 6850 9050 1    60   UnSpc ~ 0
5V_2
Wire Wire Line
	5650 9050 5650 8350
Wire Wire Line
	5650 8350 7600 8350
Wire Wire Line
	7600 8350 7600 6700
Wire Wire Line
	7600 6700 7300 6700
Wire Wire Line
	6200 9050 6200 8400
Wire Wire Line
	6200 8400 7650 8400
Wire Wire Line
	7650 8400 7650 6800
Wire Wire Line
	7650 6800 7300 6800
Wire Wire Line
	6750 9050 6750 8450
Wire Wire Line
	6750 8450 7700 8450
Wire Wire Line
	7700 8450 7700 6900
Wire Wire Line
	7700 6900 7300 6900
NoConn ~ 5950 7750
NoConn ~ 5950 6900
NoConn ~ 5950 7000
NoConn ~ 5950 6100
NoConn ~ 5950 6450
Text GLabel 5950 6200 0    60   UnSpc ~ 0
5V_2
Text GLabel 5950 6300 0    60   UnSpc ~ 0
3V3_2
$Comp
L Conn_01x04 J12
U 1 1 5D82AD9A
P 6300 9950
F 0 "J12" H 6300 10150 50  0000 C CNN
F 1 "PCA9685" H 6300 9650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x04_Pitch2.54mm" H 6300 9950 50  0001 C CNN
F 3 "" H 6300 9950 50  0001 C CNN
	1    6300 9950
	1    0    0    -1  
$EndComp
Text GLabel 6100 10150 0    60   UnSpc ~ 0
GND
Text GLabel 6100 10050 0    60   UnSpc ~ 0
3V3_2
Text GLabel 6100 9850 0    60   UnSpc ~ 0
SDA
Text GLabel 6100 9950 0    60   UnSpc ~ 0
SCL
$Comp
L CP C1
U 1 1 5D84F4EB
P 1500 5200
F 0 "C1" H 1525 5300 50  0000 L CNN
F 1 "CP" H 1525 5100 50  0000 L CNN
F 2 "Capacitors_THT:CP_Radial_D6.3mm_P2.50mm" H 1538 5050 50  0001 C CNN
F 3 "" H 1500 5200 50  0001 C CNN
	1    1500 5200
	1    0    0    -1  
$EndComp
Text GLabel 750  1300 0    60   UnSpc ~ 0
3V3
Text GLabel 1050 4000 2    60   UnSpc ~ 0
3V3
$Comp
L Conn_01x07 J1
U 1 1 5D850E75
P 850 4300
F 0 "J1" H 850 4700 50  0000 C CNN
F 1 "Ext. Conn" H 850 3900 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x07_Pitch2.54mm" H 850 4300 50  0001 C CNN
F 3 "" H 850 4300 50  0001 C CNN
	1    850  4300
	-1   0    0    -1  
$EndComp
Text GLabel 1050 4300 2    60   UnSpc ~ 0
GND
Text GLabel 1050 4400 2    60   UnSpc ~ 0
GND
Wire Wire Line
	1400 3700 1350 3700
Wire Wire Line
	1350 3700 1350 3750
Wire Wire Line
	1050 4100 2150 4100
Wire Wire Line
	1350 4050 1350 4100
Connection ~ 1350 4100
$Comp
L Conn_01x01 J2
U 1 1 5D87AD7A
P 850 5050
F 0 "J2" H 850 5150 50  0000 C CNN
F 1 "StepVCC" H 850 4950 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 850 5050 50  0001 C CNN
F 3 "" H 850 5050 50  0001 C CNN
	1    850  5050
	-1   0    0    -1  
$EndComp
$Comp
L Conn_01x01 J3
U 1 1 5D87AEB9
P 850 5350
F 0 "J3" H 850 5450 50  0000 C CNN
F 1 "StepGND" H 850 5250 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x01_Pitch2.54mm" H 850 5350 50  0001 C CNN
F 3 "" H 850 5350 50  0001 C CNN
	1    850  5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1200 5000 1200 5050
Wire Wire Line
	1200 5400 1200 5350
NoConn ~ 7300 5700
NoConn ~ 7300 5800
NoConn ~ 7300 7700
NoConn ~ 7300 7800
NoConn ~ 7300 7400
NoConn ~ 7300 7300
NoConn ~ 7300 7200
NoConn ~ 7300 7100
NoConn ~ 7300 7000
NoConn ~ 750  2000
$Comp
L R R2
U 1 1 5D8A962A
P 2000 3900
F 0 "R2" V 2080 3900 50  0000 C CNN
F 1 "10k" V 2000 3900 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 1930 3900 50  0001 C CNN
F 3 "" H 2000 3900 50  0001 C CNN
	1    2000 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 4050 2000 4100
Connection ~ 2000 4100
Text GLabel 2050 3700 2    60   UnSpc ~ 0
Pullup2
Wire Wire Line
	2000 3750 2000 3700
Wire Wire Line
	2000 3700 2050 3700
$EndSCHEMATC
