//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        																// Part specific constants and macros
#include "PSoCAPI.h"    																// PSoC API definitions for all User Modules

int Position_X_Achse = 0x00;
int Position_Y_Achse = 0x00;

void main(void)
{
	M8C_EnableGInt; 
	LCD_Start();                  														// LCD initialisieren
	PGA_X_Achse_Start(PGA_X_Achse_MEDPOWER);											// PGA für X-Achse starten
	PGA_Y_Achse_Start(PGA_Y_Achse_MEDPOWER);											// PGA für Y-Achse starten
	DUALADC_Start(DUALADC_HIGHPOWER);     												// ADC starten
   	DUALADC_SetResolution(10);            												// Auflösung setzen
   	DUALADC_GetSamples(0);                												// ADC auf permanente Wandlung stellen

	while(1)
	{
    	while(DUALADC_fIsDataAvailable() == 0);  										// Warten bis Daten bereit sind
    		Position_X_Achse = DUALADC_iGetData2();          						 
    		Position_Y_Achse = DUALADC_iGetData1ClearFlag(); 						
	
			LCD_Position(0,0);            
   			LCD_PrCString("X-Achse:");  
			LCD_Position(2,0);   
			LCD_PrCString("Y-Achse");  
			LCD_Position(1,0);     
   			LCD_PrHexInt(Position_X_Achse); 
			LCD_Position(3,0);            
   			LCD_PrHexInt(Position_Y_Achse); 
	}
}
