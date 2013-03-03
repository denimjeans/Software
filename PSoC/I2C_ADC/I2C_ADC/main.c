//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        															// Part specific constants and macros
#include "PSoCAPI.h"    															// PSoC API definitions for all User Modules

// Variablen
int Wert = 0;
char Adresse = 0;

// Funktionen
void I2C_Init(void);

void main(void)
{
	M8C_EnableGInt; 
	LCD_Start();																	// Start LCD
	PGA_Start(PGA_LOWPOWER);														// Start PGA
	ADCINC_Start(ADCINC_HIGHPOWER);       											// Start ADC
	ADCINC_GetSamples(0);                 											// Starting Free-Run Modus

	
	LCD_Position(0,0); 
	LCD_PrCString("PSoC I2C Slave");
	
	EzI2Cs_SetRamBuffer(10, 10, (char *)&Wert);										// Start I²C Buffer, Size of 10 Byte, Allowing 10 Byte to Write/Read
	
	I2C_Init();
	
	Adresse = EzI2Cs_GetAddr();

	
	while(1)
	{
		while(ADCINC_fIsDataAvailable() == 0);    
		Wert = ADCINC_iClearFlagGetData();              

		LCD_Position(1,0); 
		LCD_PrCString("ADC:");
		LCD_Position(1,5);
		LCD_PrHexInt(Wert);
		LCD_Position(2,0); 
		LCD_PrCString("Adresse:");
		LCD_Position(2,9);
		LCD_PrHexInt(Adresse);
	}
}

void I2C_Init(void)
{
	EzI2Cs_Start();																	
	EzI2Cs_EnableInt();														
}