#include <m8c.h>        									// Part specific constants and macros
#include "PSoCAPI.h"    									// PSoC API definitions for all User Modules
#pragma interrupt_handler Timer_Int
#pragma interrupt_handler UART_Int

char Buffer[80];
char *p;
char *Zeiger;

void main(void)
{
	M8C_EnableGInt;
	M8C_EnableIntMask(INT_MSK0, INT_MSK0_GPIO);
	LCD_Start();
	Timer16_Start();
	Timer16_EnableInt();
	UART_Start(UART_PARITY_NONE);         					// UART aktivieren
	UART_IntCntl(UART_ENABLE_RX_INT); 						// RX Interrupt aktivieren
	
	while(1)
	{			
		*p = 0;												// Pointer "P" auf 0 setzen
		p = Buffer;											// Zeiger "P" auf das Array "Buffer" zeigen lassen
		while ((*p++ = UART_cGetChar()) != 0x0D);			// Zeichen über UART einlesen und es am die Stelle speichern auf die "P" zeigt. 
															// Den Wert des Pointers "P" erhöhen. Schleife wird bei 0x0D verlassen.
															// Ausgabe des Arrays "Buffer"
		memset (Buffer,' ',16);								// Array "Buffer" leeren
	}
}

void Timer_Int(void)
	{
	}
	
void UART_Int(void)
	{
	PRT0DR ^= 0x01;
	   if(UART_bCmdCheck()) 								// Auf Befehl warten  
	   {                    			
          if(Zeiger = UART_szGetParam()) 					
		  {       
			LCD_Position(0,0);
			LCD_PrCString("Gesendet:");
			LCD_Position(1,0);
			LCD_PrString(Buffer);		 
          } 
       UART_CmdReset();                          			// Befehlsbuffer löschen  
       } 

	}