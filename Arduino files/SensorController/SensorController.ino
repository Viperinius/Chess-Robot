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


//-----------------------------------------
//				Variables
//-----------------------------------------

// I/O extenders, each connected to two rows of the board
Adafruit_MCP23017 mcpRow12;
Adafruit_MCP23017 mcpRow34;
Adafruit_MCP23017 mcpRow56;
Adafruit_MCP23017 mcpRow78;


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

int iPrevPos[8][8];
int iCurrPos[8][8];

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

String generateMoveString(int iSrcI, int iSrcJ, int iDestI, int iDestJ) {
	return String(letterFromNum(iSrcJ)) + String(iSrcI) + String(letterFromNum(iDestJ)) + String(iDestI);
}

char letterFromNum(int iNum) {
	return "abcdefgh"[iNum - 1];
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




//-----------------------------------------
//				Main Functions
//-----------------------------------------


void setup() {
	Serial.begin(BAUD_RATE);
	Serial.println("SENSORS_COMM_READY");

	initMCP();

	resetBoardArr();
}

void loop() {

}