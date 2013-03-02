#include <m8c.h>       											// Part specific constants and Macros
#include "PSoCAPI.h"   											// PSoC API definitions for all User Modules
#include "stdlib.h"
#pragma interrupt_handler Timer16

void I2C_Init(void);
void Write_PCF(char *Port);	
void Read_PCF(char *Pin);
void Read_LM75(char *Temperatur);
void Read_PSoCSlave(char *Button);

char Status = 0x00;
char Zustand_Output = 0x01;
char Zustand_Input = 0x00;
char LM75_Data = 0x00;
char WhichButton = 0x00;

#define PSoC_Addr 0x40
#define PCF_Addr 0x20											// Konstante Variable
#define LM75_Addr 0x9E
																
void main(void)
{
	M8C_EnableGInt;												// Globale Interrupts erlauben
	LCD_Start();                  								// LCD initialisieren
	Timer16_EnableInt();  										// Timer16 Interrupts aktivieren
    Timer16_Start();  											// Timer16 starten
	
	//LCD_Control(0x20);											// Adresse für CGRAM (Character Generator RAM)
	//LCD_Delay50u();												// 50us warten
	//LCD_WriteData(31);
	//LCD_WriteData(24);
	//LCD_WriteData(25);
	//LCD_WriteData(27);
	//LCD_WriteData(31);
	//LCD_WriteData(31);
	//LCD_WriteData(31);
	//LCD_WriteData(32);

	//LCD_Control(0x80);											// Set DDRAM as target of data writes
	//LCD_Position(0,0);											// Set cursor in DDRAM
	//LCD_WriteData(0);											// Display the CGRAM[0] character there
	
	I2C_Init();

	while(1)
	{
		//Write_PCF(&Zustand_Output);	
		//LCD_Position(0,0);
		//LCD_PrCString("Temperatur: ");
		//LCD_Position(1,0);
		//LCD_PrHexInt(LM75_Data);
		
		//Read_PCF(&Zustand_Input);
		//LCD_Position(2,0);
		//LCD_PrCString("Input: ");
		//LCD_Position(3,0);
		//LCD_PrHexInt(Zustand_Input);
		
		//Read_LM75(&LM75_Data);
		Read_PSoCSlave(&WhichButton);
		LCD_Position(0,0);
		LCD_PrCString("Button:");
		LCD_Position(1,0);
		LCD_PrHexInt(WhichButton);
	}
}


void Timer16(void)
{
	Zustand_Output++;
	Timer16_WritePeriod(32768); 
}

void I2C_Init(void)
{
	I2CHW_Start();																	// I²C Modul starten
	I2CHW_EnableInt();																// I²C Interrupts aktivieren
	I2CHW_EnableMstr();																// Modul auf "Master" stellen
}

void Write_PCF(char *Port)
{
	I2CHW_bWriteBytes(PCF_Addr, Port, 1, I2CHW_CompleteXfer);
	while(!(I2CHW_bReadI2CStatus() & I2CHW_WR_COMPLETE));
	I2CHW_ClrWrStatus();														
}

void Read_PCF(char *Pin)
{
	I2CHW_fReadBytes(PCF_Addr, Pin, 1, I2CHW_CompleteXfer);
	while(!(I2CHW_bReadI2CStatus() & I2CHW_RD_COMPLETE));							// Warten bis der Lesevorgang abgeschlossen ist
	I2CHW_ClrRdStatus();
}

void Read_LM75(char *Temperatur)
{
	I2CHW_fReadBytes(LM75_Addr, Temperatur, 1, I2CHW_CompleteXfer);
	while(!(I2CHW_bReadI2CStatus() & I2CHW_RD_COMPLETE));							// Warten bis der Lesevorgang abgeschlossen ist
	I2CHW_ClrRdStatus();
}

void Read_PSoCSlave(char *Button)
{
	I2CHW_fReadBytes(PSoC_Addr, Button, 1, I2CHW_CompleteXfer);
	Status = I2CHW_bReadI2CStatus();
	
	LCD_Position(2,0);
	LCD_PrCString("Status:");
	LCD_Position(3,0);
	LCD_PrHexInt(Status);
	
	while(!(I2CHW_bReadI2CStatus() & I2CHW_RD_COMPLETE));							// Warten bis der Lesevorgang abgeschlossen ist
	I2CHW_ClrRdStatus();
}
