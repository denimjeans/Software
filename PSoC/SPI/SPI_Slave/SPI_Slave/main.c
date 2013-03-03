//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        													// Part specific constants and macros
#include "PSoCAPI.h"    													// PSoC API definitions for all User Modules

int ADWandler = 0x00;

void main(void)
{
	M8C_EnableGInt;
	LED7SEG_Start(); 
	SPIS_Start(SPIS_SPIS_MODE_0 | SPIS_SPIS_MSB_FIRST);
	
	while (1)
	{
		PRT2DR ^= 0x01;										
       	while(!(SPIS_bReadStatus() & SPIS_SPIS_SPI_COMPLETE));
        ADWandler = SPIS_bReadRxData();
        LED7SEG_DispInt(ADWandler,1,4);
	}
}