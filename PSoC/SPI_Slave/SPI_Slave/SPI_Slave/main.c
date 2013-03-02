//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        													// Part specific constants and macros
#include "PSoCAPI.h"    													// PSoC API definitions for all User Modules

BYTE SPI_Status = 0;
BYTE SPI_Data;

void Display_SPI_Status(BYTE Status)
{
	LED7SEG_PutHex(SPI_Status & 0x0f,2);			// Display Status lower nibble
	LED7SEG_PutHex((SPI_Status>>4) & 0x0f,1);		// Display upper nibble
}

void main(void)
{
	M8C_EnableGInt;
	LED7SEG_Start(); 
	SPIS_Start(SPIS_SPIS_MODE_0 | SPIS_SPIS_MSB_FIRST);
	
	while (1)
	{
		PRT2DR ^= 0x01;														//LED_Empfangen togglen
       	while(((SPI_Status = SPIS_bReadStatus()) &0x68) == 0);				// Wait for something happened checking only relevant bits
        SPI_Data = SPIS_bReadRxData();						// Data is not used yet
		Display_SPI_Status(SPI_Status);
	}
}
