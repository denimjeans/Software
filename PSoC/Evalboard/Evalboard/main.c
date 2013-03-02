//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#pragma interrupt_handler Timer;

volatile char Wert = 100;
char Port = 1;

void main(void)
{
	M8C_EnableIntMask(INT_MSK0, INT_MSK0_GPIO);											// Interrupts an den I/O-Ports aktivieren
    M8C_EnableGInt;  
	LCD_Start();
	LCD_InitBG(LCD_SOLID_BG);
    Timer16_Start();																
	Timer16_EnableInt(); 
	I2CM_Start();   
	
	I2CM_fSendStart(0x20, I2CM_WRITE);
	I2CM_fWrite(0x00);
	I2CM_fSendRepeatStart(0x20,I2CM_WRITE);  
	I2CM_fWrite(Port);
	I2CM_SendStop();

	while(1)
	{     
	LCD_Position(0,0);
	LCD_PrHexInt(Wert);
	LCD_DrawBG(1,0,16,0);
	
	}
}

void Timer(void) 
{
    Wert++;
}