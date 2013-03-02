#include <m8c.h>       											// Part specific constants and macros
#include "PSoCAPI.h"   											// PSoC API definitions for all User Modules

void Write_Symbol_Heart(void);
void Write_Symbol_Smiley(void);

void main(void)
{
	M8C_EnableGInt;
	LCD_1_Start();                  							// Initialisieren des LCDs

	Write_Symbol_Heart();
	Write_Symbol_Smiley();

	LCD_1_Position(0,0);
	LCD_1_PrCString("Ich liebe dich");
	LCD_1_Position(1,0);
	LCD_1_PrCString("Baby");
	LCD_1_Position(1,5);										// Cursor setzen
	LCD_1_WriteData(0);											// Anzeigen von Zeichen[0]
	LCD_1_Position(2,0);										// Cursor setzen
	LCD_1_WriteData(1);											// Anzeigen von Zeichen[1]
	
	LCD_1_Position(2,0);										// Cursor In zeile 2 Position 0 setzen
	LCD_1_Control(0xF);											// Schreibt 00001110 in das Controlregister, aktiviert 
																// das Display und den Cursor, lässt den Cursor blinken
																// DB7     DB6     DB5     DB4     DB3     DB2     DB1     DB0
																//  0       0       0       0       1       1       1       0
																//						         Display  Cursor  Blinken 
																//								 On/Off   On/Off  On/Off
																//							 	  1/0      1/0     1/0
	
	while(1)
	{
	}
}

void Write_Symbol_Heart(void)									// Unterprogramm zum erstellen eines Herzens
{
	LCD_1_Control(0x40);										// Adresse für CGRAM (Character Generator RAM), 8 Bit pro Zeichen
	LCD_1_Delay50u();											// 50us warten
	LCD_1_WriteData(32);
	LCD_1_WriteData(32);
	LCD_1_WriteData(10);
	LCD_1_WriteData(21);
	LCD_1_WriteData(17);
	LCD_1_WriteData(10);
	LCD_1_WriteData(4);
	LCD_1_WriteData(32);
	LCD_1_Control(0x80);										// Adresse des DDRAM
}

void Write_Symbol_Smiley(void)	
{
	LCD_1_Control(0x48);										// Adresse für CGRAM (Character Generator RAM), 8 Bit pro Zeichen
	LCD_1_Delay50u();											// 50us warten
	LCD_1_WriteData(32);
	LCD_1_WriteData(32);
	LCD_1_WriteData(10);
	LCD_1_WriteData(32);
	LCD_1_WriteData(17);
	LCD_1_WriteData(14);
	LCD_1_WriteData(32);
	LCD_1_WriteData(32);
	LCD_1_Control(0x80);	
}