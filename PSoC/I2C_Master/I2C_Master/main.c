//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        													// Part specific constants and macros
#include "PSoCAPI.h"    													// PSoC API definitions for all User Modules
#pragma interrupt_handler Timer16

void I2C_Init(void);
void Read_PSoCSlave(char *Button);

char Zeiger = 0x00;
BYTE Timer = 0x00;
char Button = 0x00;

#define PSoC_Addr 0x40

void main(void)
{
	M8C_EnableGInt; 
	LCD_Start();    
	Timer16_EnableInt();  
    Timer16_Start();  	
	
	I2C_Init();

	while (1)
	{
		Read_PSoCSlave(&Zeiger);
		LCD_Position(0,0);
		LCD_PrHexInt(Zeiger);
		//LCD_Position(Zeiger,15);
		//LCD_WriteData(0x3C);
		//LCD_Position((Zeiger+1),15);
		//LCD_WriteData(0x20);
		//LCD_Position((Zeiger-1),15);
		//LCD_WriteData(0x20);
	}

}

void Timer16(void)
{	
	Read_PSoCSlave(&Zeiger);
	Timer16_WritePeriod(3277);
	PRT2DR ^= 0x01;															//LED_Timer togglen
}

void I2C_Init(void)
{
	I2CHW_Start();																	// I²C Modul starten
	I2CHW_EnableInt();																// I²C Interrupts aktivieren
	I2CHW_EnableMstr();																// Modul auf "Master" stellen
}

void Read_PSoCSlave(char *Button)
{
	I2CHW_fReadBytes(PSoC_Addr, Button, 1, I2CHW_CompleteXfer);	
	while(!(I2CHW_bReadI2CStatus() & I2CHW_RD_COMPLETE));							// Warten bis der Lesevorgang abgeschlossen ist
	I2CHW_ClrRdStatus();

}