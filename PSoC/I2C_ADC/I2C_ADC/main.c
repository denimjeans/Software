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
	LCD_Start();																	// LCD Modul aktivieren
	PGA_Start(PGA_LOWPOWER);														// PGA aktivieren
	ADCINC_Start(ADCINC_HIGHPOWER);       											// ADC aktivieren 
	ADCINC_GetSamples(0);                 											// Free-Run Modus aktivieren 

	
	LCD_Position(0,0); 
	LCD_PrCString("PSoC I2C Slave");
	
	EzI2Cs_SetRamBuffer(10, 10, (char *)&Wert);										// I²C Buffer setzen, 10 Byte Größe, 10 Byte Schreib/Lesbar
	
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
	EzI2Cs_Start();																	// I²C Modul starten
	EzI2Cs_EnableInt();																// I²C Interrupts aktivieren
}