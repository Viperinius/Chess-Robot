"""
    Name:       arduinoBridge.py
    Created:    25.08.2019
    Author:     Viperinius
"""

import config
import serial

if config.ARDUINO_PARITY:
    parity = serial.PARITY_ODD
else:
    parity = serial.PARITY_NONE

sensorConn = None
actuatorConn = None

def initComms():
    sensorConn = serial.Serial(
        port = config.ARDUINO_SENSOR_PORT,
        baudrate = config.ARDUINO_BAUD,
        parity = parity,
        stopbits = serial.STOPBITS_ONE,
        bytesize = serial.EIGHTBITS,
        timeout = 0.25
    )
    #actuatorConn = serial.Serial(
    #    port = config.ARDUINO_ACTUATOR_PORT,
    #    baudrate = config.ARDUINO_BAUD,
    #    parity = parity,
    #    stopbits = serial.STOPBITS_ONE,
    #    bytesize = serial.EIGHTBITS,
    #    timeout = 0.25
    #)
    return sensorConn#, actuatorConn

def closeComms():
    closeComm("sensor")
    closeComm("actuator")

def closeComm(connection):
    if connection == "sensor":
        sensorConn.close()
    elif connection == "actuator":
        actuatorConn.close()
    else:
        pass

def printSerial(conn):
    print(conn.readline())


def changeMode(newMode):
    if newMode != "BOARD" and newMode != "WEB":
        return
    config.SET_MODE = newMode
    
    if newMode == "BOARD":
        sensorConn.write(config.SENSORS_MODE_MSG_BOARD)
    elif newMode == "WEB":
        sensorConn.write(config.SENSORS_MODE_MSG_WEB)

def newGame():
    # whatever needs to be done on py side

    sensorConn.write(config.SENSOR_REQ_NEW_GAME_MSG)


#############
# following for testing purposes only
#############

import time

#sensorConn, actuatorConn = initComms()
sensorConn = initComms()
printSerial(sensorConn)
print("Enter something:")
while True:
    rInput = input()
    print("Entered: " + rInput)

    sensorConn.write(rInput.encode())

    time.sleep(2)
    printSerial(sensorConn)