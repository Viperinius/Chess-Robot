/*
 Name:		SensorController.ino
 Created:	18.08.2019 22:03:05
 Author:	Viperinius
*/

/* Board:
	x  x  x  x  x  x  x  x	8	|			MCP78	Pins 8-15
	x  x  x  x  x  x  x  x 	7	| black		MCP78	Pins 0-7
	x  x  x  x  x  x  x  x	6				MCP56	Pins 8-15
	x  x  x  x  x  x  x  x	5				MCP56	Pins 0-7
	x  x  x  x  x  x  x  x	4				MCP34	Pins 8-15
	x  x  x  x  x  x  x  x	3				MCP34	Pins 0-7
	x  x  x  x  x  x  x  x	2	| white		MCP12	Pins 8-15
	x  x  x  x  x  x  x  x	1	|			MCP12	Pins 0-7
	a  b  c  d  e  f  g  h
*/




//-----------------------------------------
//				Includes
//-----------------------------------------

#include <Wire.h>
#include <Adafruit_MCP23017.h>



//-----------------------------------------
//				Defines
//-----------------------------------------

#define BAUD_RATE 9600
#define SLEEP_MS 500
#define SLEEP_MS_NEW_GAME 90000	// = 1.5 min
#define REQUEST_POS 10
#define REQUEST_NEW_GAME 20
#define MODE_BOARD 1
#define MODE_WEB 2

#define REQ_POS_MSG "<SEND_CURR_POS>"
#define REQ_NEW_GAME_MSG "<RESET_GAME>"
#define COMM_READY_MSG "<SENSORS_COMM_READY>"
#define MODE_MSG_BOARD "<MODE_BOARD>"
#define MODE_MSG_WEB "<MODE_WEB>"

//-----------------------------------------
//				Variables
//-----------------------------------------

// I/O extenders, each connected to two rows of the board
Adafruit_MCP23017 mcpRow12;
Adafruit_MCP23017 mcpRow34;
Adafruit_MCP23017 mcpRow56;
Adafruit_MCP23017 mcpRow78;

// keep starting positions at hand for easy copying
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
int iPrevPos[8][8];
int iCurrPos[8][8];

// status if / what serial message received
int iSerialMsg;

// contains detected move with board columns as numbers instead of letters
int iMove;

// "play mode", either board only (MODE_BOARD) or on web page (MODE_WEB)
uint8_t uiMode;

//-----------------------------------------
//				Functions
//-----------------------------------------


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

void copyCurrToPrevPos() {
	for (int i = 0; i < 8; i++)
	{
		for (int j = 0; j < 8; j++)
		{
			iPrevPos[i][j] = iCurrPos[i][j];
		}
	}
}

int generateMoveVar(int iSrcI, int iSrcJ, int iDestI, int iDestJ) {
	//returns move with columns as numbers instead of letters
	return iSrcJ * 1000 + iSrcI * 100 + iDestJ * 10 + iDestI;
}


int comparePositions() {
	int iSrcI;
	int iSrcJ;
	int iDestI;
	int iDestJ;

	for (int i = 0; i < 8; i++)
	{
		for (int j = 0; j < 8; j++)
		{
			//bla blub
		}
	}

	return generateMoveVar(iSrcI + 1, iSrcJ + 1, iDestI + 1, iDestJ + 1);
}




void initMCP() {
	mcpRow12.begin(1);	//I2C: 0x21
	mcpRow34.begin(2);	//I2C: 0x22
	mcpRow56.begin(3);	//I2C: 0x23
	mcpRow78.begin(4);	//I2C: 0x24

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

void readSensors() {
	for (int i = 0; i < 8; i++)
	{
		for (int j = 0; j < 8; j++)
		{
			switch (i)
			{
			case 0:
				iCurrPos[i][j] = mcpRow12.digitalRead(j);
				break;
			case 1:
				iCurrPos[i][j] = mcpRow12.digitalRead(j + 8);
				break;
			case 2:
				iCurrPos[i][j] = mcpRow34.digitalRead(j);
				break;
			case 3:
				iCurrPos[i][j] = mcpRow34.digitalRead(j + 8);
				break;
			case 4:
				iCurrPos[i][j] = mcpRow56.digitalRead(j);
				break;
			case 5:
				iCurrPos[i][j] = mcpRow56.digitalRead(j + 8);
				break;
			case 6:
				iCurrPos[i][j] = mcpRow78.digitalRead(j);
				break;
			case 7:
				iCurrPos[i][j] = mcpRow78.digitalRead(j + 8);
				break;
			default:
				break;
			}
		}
	}
}


int readSerial() {
	char cRead;
	String sContent = "";

	if (Serial.available()) {
		cRead = Serial.read();
		sContent.concat(cRead);
	}
	else {
		return -1;
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


//-----------------------------------------
//				Main Functions
//-----------------------------------------


void setup() {
	Serial.begin(BAUD_RATE);
	Serial.println(COMM_READY_MSG);

	initMCP();

	resetBoardArr();

	iSerialMsg = 0;
	//set default mode to board only
	uiMode = MODE_BOARD;
}

void loop() {
	//check if server sent a request
	iSerialMsg = readSerial();
	if (iSerialMsg > 0) {
		//valid message received
		if (iSerialMsg == REQUEST_POS) {
			iMove = comparePositions();

			//send latest move
			Serial.println(iMove);
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

		delay(SLEEP_MS);
	}

}