"""
    Name:       config.py
    Created:    18.08.2019
    Author:     Viperinius
"""

#####################
# Stockfish settings
#####################
# set path to binary
STOCKFISH_PATH = r"X:\stockfish-10-win\Windows\stockfish_10_x64"

# don't write debug to log
STOCKFISH_LOG = "false"

# no contempt
STOCKFISH_CONTEMPT = 0

# number of threads for calculations
STOCKFISH_THREADS = 2

# hash table size, MB
STOCKFISH_HASH = 16

# disable pondering
STOCKFISH_PONDER = "false"

# output not more than first best move
STOCKFISH_MULTIPV = 1

# set default skill level
STOCKFISH_SKILL = 8

# set delay, ms
STOCKFISH_OVERHEAD = 30

# set minimum thinking time, ms
STOCKFISH_THINKING = 20

# set slow mover
STOCKFISH_SLOW = 80

# disable UCI Chess960
STOCKFISH_CHESS960 = "false"


#####################
# Arduino settings
#####################
# set baud rate
ARDUINO_BAUD = 9600

# set serial ports
#ARDUINO_SENSOR_PORT = '/dev/ttyUSB0'
ARDUINO_SENSOR_PORT = 'com7'
#ARDUINO_ACTUATOR_PORT = '/dev/ttyUSB1'
ARDUINO_ACTUATOR_PORT = 'com5'

# don't use any parity (if set true, uses even parity)
ARDUINO_PARITY = False