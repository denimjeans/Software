//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        													// Part specific constants and macros
#include "PSoCAPI.h"    													// PSoC API definitions for all User Modules
#pragma interrupt_handler Timer16

void Sample(void);
void SPI_Send(char *Senden);

char ADWandler = 0x05;
char SPI = 0x00;

void main(void)
{
	M8C_EnableGInt; 
	PGA_Start(PGA_MEDPOWER);
	LCD_Start();  
	SPIM_Start(SPIM_SPIM_MODE_0 | SPIM_SPIM_MSB_FIRST);
	ADCINC_Start(ADCINC_HIGHPOWER);       
  	ADCINC_GetSamples(0); 
	Timer16_EnableInt();  										
    Timer16_Start();  	

	while (1)
	{
		if(SPI)
		{
			SPI_Send(&ADWandler);
			SPI = 0x00;
		}
		
		//Sample();
		LCD_Position(0,0);
		LCD_PrCString("AD-Wert:");
		LCD_Position(1,0);
		LCD_PrHexByte(ADWandler);
	}

}

void Sample(void)
{	
	while(ADCINC_fIsDataAvailable() == 0);   
    ADWandler = ADCINC_iClearFlagGetData();              
}

void SPI_Send(char *Senden)
{
			while(!(SPIM_bReadStatus() & SPIM_SPIM_TX_BUFFER_EMPTY));
    		{ 
    			SPIM_SendTxData(*Senden);
				PRT2DR ^= 0x02;												//LED_SPI togglen
			}
}

void Timer16(void)
{	
	SPI = 0x01;
	Timer16_WritePeriod(32768);
	PRT2DR ^= 0x01;															//LED_Timer togglen
}