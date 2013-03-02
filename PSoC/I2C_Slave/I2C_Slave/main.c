//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        															// Part specific constants and macros
#include "PSoCAPI.h"    															// PSoC API definitions for all User Modules

// Variablen
char Wert = 150;

// Funktionen
void I2C_Init(void);

void main(void)
{
	M8C_EnableGInt; 
	LCD_Start();																	// LCD Modul aktivieren
	
	LCD_Position(0,0); 
	LCD_PrCString("PSoC I2C Slave");
	
	EzI2Cs_SetRamBuffer(1, 1, (char *)&Wert);										// I²C Buffer setzen, 1 Byte Größe, 1 Byte Schreib/Lesbar
	
	I2C_Init();
	
	while(1)
	{
		LCD_Position(1,0); 
		LCD_PrCString("Wert:");
		LCD_Position(2,0);
		LCD_PrHexInt(Wert);
	}
}

void I2C_Init(void)
{
	EzI2Cs_Start();																	// I²C Modul starten
	EzI2Cs_EnableInt();																// I²C Interrupts aktivieren
}