//==============================================================================
/// @file ActuatorController.ino
///
/// @brief Implements movement control
///
/// @version 1.1
///
/// @author Viperinius
///
/// @date 11.10.2019
//==============================================================================


//------------------------------------------------------------------------------
//                                    Includes
//------------------------------------------------------------------------------

#include <avr/interrupt.h>


//------------------------------------------------------------------------------
//                                    Defines
//------------------------------------------------------------------------------

#define BAUD_RATE 9600                          ///< set the baud raute used to communicate
#define SLEEP_MS 500                            ///< set how much delay is in between loop cycles
#define COMM_READY_MSG "<SENSORS_COMM_READY>"   ///< message to send that communication is ready

#define PIN_END_STOP_1 10                       ///< pin of the x end stop
#define PIN_END_STOP_2 11                       ///< pin of the y end stop
#define PIN_END_STOP_3 12                       ///< pin of the z end stop


//------------------------------------------------------------------------------
//                                    Variables
//------------------------------------------------------------------------------

volatile uint8_t uiIsrValue;                    ///< holds value if or which end stop triggered an interrupt



//------------------------------------------------------------------------------
//                                    Functions
//------------------------------------------------------------------------------

//==============================================================================
/// @brief Initialise the end stop pins
///
/// @details
/// Set pin mode
//==============================================================================
void initEndStops() {
    pinMode(PIN_END_STOP_1, INPUT);
    pinMode(PIN_END_STOP_2, INPUT);
    pinMode(PIN_END_STOP_3, INPUT);
}

//==============================================================================
/// @brief Initialise the PCI
///
/// @details
/// Enables pin change interrupts for the end stops
//==============================================================================
void initPCI() {

    uiIsrValue = 0;

    cli();
    // enable port B PCI
    PCICR |= 0b00000001;
    // enable interrupt on D10, D11 and D12
    PCMSK0 |= 0b00011100;

    sei();
}




//------------------------------------------------------------------------------
//                                    Main Functions
//------------------------------------------------------------------------------

//==============================================================================
/// @brief Prepare loop
///
/// @details
/// Initialises needed things
//==============================================================================
void setup() {
    Serial.begin(BAUD_RATE);
    pinMode(LED_BUILTIN, OUTPUT);
    Serial.println(COMM_READY_MSG);

    initPCI();
    initEndStops();
    
}

//==============================================================================
/// @brief Main loop
///
/// @details
/// Main loop
//==============================================================================
void loop() {
    





    delayMicroseconds(SLEEP_MS);
}



ISR(PCINT0_vect) {
    // sets bits according to end stop states:
    // 0 -> no end stop active
    // 1 -> end stop 1 triggered
    // 2 -> end stop 2 triggered
    // 3 -> end stop 1 and 2 active
    // 4 -> end stop 3 triggered
    // 5 -> end stop 1 and 3 active
    // 6 -> end stop 2 and 3 triggered
    // 7 -> all end stops active
    uiIsrValue = !digitalRead(PIN_END_STOP_1) | (!digitalRead(PIN_END_STOP_2) << 1) | (!digitalRead(PIN_END_STOP_3) << 2);
}