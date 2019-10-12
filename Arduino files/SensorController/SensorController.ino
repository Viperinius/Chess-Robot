//==============================================================================
/// @file SensorController.ino
///
/// @brief Implements reed switch reading and move recognition
///
/// @version 1.2
///
/// @author Viperinius
///
/// @date 11.10.2019
//==============================================================================


/* Board:
    x  x  x  x  x  x  x  x    8    |            MCP78   Pins 8-15
    x  x  x  x  x  x  x  x    7    | black      MCP78   Pins 0-7
    x  x  x  x  x  x  x  x    6                 MCP56   Pins 8-15
    x  x  x  x  x  x  x  x    5                 MCP56   Pins 0-7
    x  x  x  x  x  x  x  x    4                 MCP34   Pins 8-15
    x  x  x  x  x  x  x  x    3                 MCP34   Pins 0-7
    x  x  x  x  x  x  x  x    2    | white      MCP12   Pins 8-15
    x  x  x  x  x  x  x  x    1    |            MCP12   Pins 0-7
    a  b  c  d  e  f  g  h                              Pin number increased from left/a to right/h
*/




//------------------------------------------------------------------------------
//                                    Includes
//------------------------------------------------------------------------------

#include <Wire.h>
#include <Adafruit_MCP23017.h>



//------------------------------------------------------------------------------
//                                    Defines
//------------------------------------------------------------------------------
#define DEBUG 1                                 ///< enables or disables certain code for debugging


#define BAUD_RATE 9600                          ///< set the baud raute used to communicate
#define SLEEP_MS 1500                           ///< set how much delay is in between a loop cycle
#define SLEEP_MS_NEW_GAME 90000                 ///< set how much time a player has between requesting a new game and the actual game start
#define REQUEST_POS 10                          ///< message code for a current positions request
#define REQUEST_NEW_GAME 20                     ///< message code for a new game requested
#define MODE_BOARD 1                            ///< code for play mode board only
#define MODE_WEB 2                              ///< code for play mode web

#define REQ_POS_MSG "<SEND_CURR_POS>"           ///< message to expect to recognise a current positions request
#define REQ_NEW_GAME_MSG "<RESET_GAME>"         ///< message to expect to recognise a new game request
#define COMM_READY_MSG "<SENSORS_COMM_READY>"   ///< message to send that communication is ready
#define MODE_MSG_BOARD "<MODE_BOARD>"           ///< message to expect to set play mode to board only
#define MODE_MSG_WEB "<MODE_WEB>"               ///< message to expect to set play mode to web

//------------------------------------------------------------------------------
//                                    Variables
//------------------------------------------------------------------------------

// I/O extenders, each connected to two rows of the board
Adafruit_MCP23017 mcpRow12;        ///< I/O extender for first and second row
Adafruit_MCP23017 mcpRow34;        ///< I/O extender for third and fourth row
Adafruit_MCP23017 mcpRow56;        ///< I/O extender for fifth and sixth row
Adafruit_MCP23017 mcpRow78;        ///< I/O extender for seventh and eighth row

// keep starting positions at hand for easy copying
/// backup of the starting positions
const int iStartPos[8][8] = {
    { 1,1,1,1,1,1,1,1 },
    { 1,1,1,1,1,1,1,1 },
    { 0,0,0,0,0,0,0,0 },
    { 0,0,0,0,0,0,0,0 },
    { 0,0,0,0,0,0,0,0 },
    { 0,0,0,0,0,0,0,0 },
    { 1,1,1,1,1,1,1,1 },
    { 1,1,1,1,1,1,1,1 }
};

// arrays to save read positions
int iPrevPos[8][8];     ///< array to store the previous positions
int iCurrPos[8][8];     ///< array to store the current positions

// status if / what serial message received
int iSerialMsg;         ///< contains the message read from serial

// contains detected move with board columns as numbers instead of letters
int iMove;              ///< contains unformatted detected move

// status if comparePositions has detected a move
bool bMoveDetected;     ///< indicates if comparePostions detected a move

// "play mode", either board only (MODE_BOARD) or on web page (MODE_WEB)
uint8_t uiMode;         ///< contains current play mode

//------------------------------------------------------------------------------
//                                    Functions
//------------------------------------------------------------------------------

//==============================================================================
/// @brief Resets the position arrays
///
/// @details
/// Fill the board position arrays with initial values
//==============================================================================
void resetBoardArr() {
    for (int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 8; j++)
        {
            iCurrPos[i][j] = iStartPos[i][j];
            iPrevPos[i][j] = iStartPos[i][j];
        }
    }
}

//==============================================================================
/// @brief Copy current position array to previous position array
///
/// @details
/// Copies all current positions from their array to the previous one.
//==============================================================================
void copyCurrToPrevPos() {
    for (int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 8; j++)
        {
            iPrevPos[i][j] = iCurrPos[i][j];
        }
    }
}

//==============================================================================
/// @brief Generate unformatted move
///
/// @details
/// Generates the variable containing the unformatted move (move with numbers only)
///
/// @param [in] iSrcI    origin row
/// @param [in] iSrcJ    origin column
/// @param [in] iDestI    destination row
/// @param [in] iDestJ    destination column
///
/// @return The unformatted move as int
//==============================================================================
int generateMoveVar(int iSrcI, int iSrcJ, int iDestI, int iDestJ) {
    //returns move with columns as numbers instead of letters
    return iSrcJ * 1000 + iSrcI * 100 + iDestJ * 10 + iDestI;
}

//==============================================================================
/// @brief Check if move happened
///
/// @details
/// Compares position arrays to check if a piece changed position
///
/// @return -1 if no move detected, unformatted move otherwise
//==============================================================================
int comparePositions() {
    int iSrcI = -1;
    int iSrcJ = -1;
    int iDestI = -1;
    int iDestJ = -1;

    for (int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 8; j++)
        {
            if (iCurrPos[i][j] != iPrevPos[i][j]) {
                if (iCurrPos[i][j] == 1) {
                    //piece appeared

                    iDestI = i;
                    iDestJ = j;
                }
                else if (iCurrPos[i][j] == 0) {
                    //piece disappeared

                    iSrcI = i;
                    iSrcJ = j;
                }
            }
        }
    }

    //return the move if all parts valid, else -1 (no actual move seen)
    if (iSrcI >= 0 && iSrcJ >= 0 && iDestI >= 0 && iDestJ >= 0) {
        bMoveDetected = true;
        return generateMoveVar(iSrcI + 1, iSrcJ + 1, iDestI + 1, iDestJ + 1);
    }
    bMoveDetected = false;
    return -1;
}

//==============================================================================
/// @brief Initialise the MCP23017
///
/// @details
/// Initialises the four port extenders
//==============================================================================
void initMCP() {
    mcpRow12.begin(1);    //I2C: 0x21
    mcpRow34.begin(2);    //I2C: 0x22
    mcpRow56.begin(3);    //I2C: 0x23
    mcpRow78.begin(4);    //I2C: 0x24

    for (int i = 0; i < 16; i++)
    {
        mcpRow12.pinMode(i, INPUT);
        mcpRow34.pinMode(i, INPUT);
        mcpRow56.pinMode(i, INPUT);
        mcpRow78.pinMode(i, INPUT);

        mcpRow12.pullUp(i, HIGH);
        mcpRow34.pullUp(i, HIGH);
        mcpRow56.pullUp(i, HIGH);
        mcpRow78.pullUp(i, HIGH);
    }
}

//==============================================================================
/// @brief Read all reed switches
///
/// @details
/// Reads all inputs of the I/O extenders and fills position arrays
//==============================================================================
void readSensors() {
    int iTemp = 0;
    for (int i = 0; i < 8; i++)
    {
        for (int j = 0; j < 8; j++)
        {
            switch (i)
            {
            case 0:
                iTemp = mcpRow12.digitalRead(j);
                break;
            case 1:
                iTemp = mcpRow12.digitalRead(j + 8);
                break;
            case 2:
                iTemp = mcpRow34.digitalRead(j);
                break;
            case 3:
                iTemp = mcpRow34.digitalRead(j + 8);
                break;
            case 4:
                iTemp = mcpRow56.digitalRead(j);
                break;
            case 5:
                iTemp = mcpRow56.digitalRead(j + 8);
                break;
            case 6:
                iTemp = mcpRow78.digitalRead(j);
                break;
            case 7:
                iTemp = mcpRow78.digitalRead(j + 8);
                break;
            default:
                break;
            }

            // invert actual value because of pullup in mcp / reed switches gnd
            if (iTemp == 1)
            {
                iCurrPos[i][j] = 0;
            }
            else
            {
                iCurrPos[i][j] = 1;
            }
        }
    }    
}

//==============================================================================
/// @brief Read serial
///
/// @details
/// Checks if new serial message available and reads it
///
/// @return -1 if no or incompatible message received, otherwise message codes
//==============================================================================
int readSerial() {
    char cRead;
    String sContent = "";

    if (!Serial.available()) {
        return -1;
    }
    while (Serial.available()) {
        cRead = Serial.read();
        sContent.concat(cRead);
    }
    
    if (sContent == REQ_POS_MSG) {
        return REQUEST_POS;
    }
    else if (sContent == REQ_NEW_GAME_MSG) {
        return REQUEST_NEW_GAME;
    }
    else if (sContent == MODE_MSG_BOARD) {
        return MODE_BOARD;
    }
    else if (sContent == MODE_MSG_WEB) {
        return MODE_WEB;
    }
    else {
        return -1;
    }
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

    initMCP();

    resetBoardArr();

    iSerialMsg = 0;
    bMoveDetected = false;
    //set default mode to board only
    uiMode = MODE_BOARD;

#ifdef DEBUG
    Serial.println("SETUP DONE");
#endif // DEBUG

}

//==============================================================================
/// @brief Main loop
///
/// @details
/// Main loop
//==============================================================================
void loop() {
    //check if server sent a request
    iSerialMsg = readSerial();
    if (iSerialMsg > 0) {
        //valid message received
        if (iSerialMsg == REQUEST_POS) {
            iMove = comparePositions();

            if (bMoveDetected) {
                //send latest move
                Serial.println(iMove);
            }
        }
        else if (iSerialMsg == REQUEST_NEW_GAME) {
            resetBoardArr();

            //pause loop to allow players to reposition the pieces back
            delay(SLEEP_MS_NEW_GAME);
        }
        else if (iSerialMsg == MODE_BOARD || iSerialMsg == MODE_WEB) {
            //change mode to received value
            uiMode = iSerialMsg;
        }
    }
    else
    {
        copyCurrToPrevPos();

        readSensors();

        // testing stuff
        Serial.println("-----------");
        //print curr array
        for (int i = 0; i < 8; i++)
        {
            for (int j = 0; j < 8; j++)
            {
                Serial.print(iCurrPos[i][j]);
                Serial.print(" ");
                if (j == 7) {
                    Serial.print("\r\n");
                }
            }
        }
        digitalWrite(LED_BUILTIN, iCurrPos[4][7]);

        // end testing stuff

        if (uiMode == MODE_BOARD) {
            iMove = comparePositions();

            if (bMoveDetected) {
                //send latest move
                Serial.println(iMove);
            }
        }


        delay(SLEEP_MS);
    }

}