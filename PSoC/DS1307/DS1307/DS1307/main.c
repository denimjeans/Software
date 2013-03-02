// Write a value 0x10 to the control register of the RTC
// This will set the clock SQW/OUT to 1Hz and enable the output
// SQWE = 1 and output freq is set as 1Hz.
// OUT  0   0    SQWE   0   0   RS1   RS0
//  0   0   0     1     0   0    0     0 => 0001 0000 (0x10)
//
//	RS1   RS0   SQW/OUT O/P    SQWE   OUT
//   0     0      1Hz           1      X
//   0     1      4.096KHz      1      X
//   1	   0      8.192KHz		1      X
//	 1	   1	 32.768KHz      1      X
//	 X	   X	  0             0      0
//	 X	   X	  1             0      0
	
#include <m8c.h>       																// Part specific constants and macros
#include "PSoCAPI.h"    															// PSoC API definitions for all User Modules
#pragma interrupt_handler RTC_Read_ISR												// Declares the interrupt handler for the timer interrupt 

typedef struct{																		// Deffiniert einen Variablentypen vom Aufbau eines Structs
	BYTE Address;																	// welche 8 Variablen enthält und "RTC_Struct" heißt
	BYTE Seconds;
	BYTE Minutes;
	BYTE Hours;
	BYTE Day;
	BYTE Date;
	BYTE Month;
	BYTE Year;
}RTC_Struct;

// Funktionen deklarieren
void I2C_Init(void);
void RTC_WriteReg(BYTE RegAddress, BYTE RegData);									// Deffiniert eine Funktion. Diese erwartet als Übergabewerte zwei Bytes
void RTC_SetRegAddress(BYTE RegAddress);
void RTC_ReadTime(RTC_Struct *pTime);
void RTC_SetTime(RTC_Struct *pTime);												// Deffiniert eine Funktion wo ein Pointer rein übergeben wird der vom Typ "RTC_Struct" ist
void Print_Time(RTC_Struct *pTime);

unsigned char bRTC_RegPointer ;														// Contains the address of the register from/to which data has to be read/written
unsigned char fReadRTC;																// Flags used to indicate occurence of various events

RTC_Struct Time;																	// Erzeugt eine Variable mit Namen "Time" vom Typen RTC_Struct
RTC_Struct SetTime;																	// Erzeugt eine Variable mit Namen "SetTime" vom Typen RTC_Struct

#define RTC_Addr 0x68																// Konstante Variable
#define TIME_LEN sizeof(Time)														// Konstante Variable die die Größe von der Variable "Time" enthält

void main(void)
{
    M8C_EnableGInt;																	// Globale Interrupts aktivieren
	LCD_Start();																	// LCD starten und initialisieren
	I2C_Init();																		// I²C Modul starten und initialisieren
	
	RTC_WriteReg(0x07, 0x11);														// Ruft die Funktion "RTC_WriteReg" auf und übergibt die Zahl 0x07 als "RegAdress"
																					// sowie die Zahl 0x10 als RegData
	SetTime.Address = 0x00;															// Schreibt in das Struct "SetTime" eine 0x00 in die Variable "Adress"
	
	// Hier wird die Zeit und das Datum eingestellt
	SetTime.Seconds = 0x00; 														// Setzt die Sekunden (BCD Format)	
	
	SetTime.Minutes = 0x20;															// Setzt die Minuten (BCD Format) 
	
	SetTime.Hours = 0x10;															// Setzt die Uhr in den 12-Stunden Modus und aktiviert PM. Setzt die Stunden
																					//  0     12/24     10 Hour/(PM/AM)  10 Hour     Hours
																					//  0     1(12)         1(PM)           0       0 1 0 0 => 0110 0100 (0x64)
	
	SetTime.Day = 0x07;																// Setzt den Wochentag. 1 = Sonntag und 7 = Samstag
	
	SetTime.Date = 0x30;															// Setzt den Tag als Datum  (BCD Format)
	
	SetTime.Month = 0x07;															// Setzt den Monat (BCD Format 1 = Januar und 12 = Dezember
	
	SetTime.Year = 0x11;															// setzt das Jahr (BCD Format)
	
	RTC_SetTime(&SetTime);														// Ruft die Funktion "RTC_SetTime" auf. Übergibt die Adresse von "SetTime" in die Funktion
		
	M8C_EnableIntMask(INT_MSK0, INT_MSK0_GPIO);										// GPIO Interrupts aktivieren

	while(1)
	{
		if(fReadRTC)																// If interrupt has occured
		{
			fReadRTC = 0x00;														// Clear the Read Flag
			RTC_ReadTime(&Time);													// Ruft die Funktion "RTC_ReadTime" auf und übergibt die Adresse von "Time" in die Funktion
		}
	}
}


void I2C_Init(void)																	// Funktion um das I²C Modul zu initialisieren
{
	I2CHW_Start();																	// I²C Modul starten
	I2CHW_EnableInt();																// I²C Interrupts aktivieren
	I2CHW_EnableMstr();																// Modul auf "Master" stellen
}

// Diese Funktion ließt die Zeit aus dem DS1307 und speichert diese in dem Buffer
// dessen Adresse mit in die Funktion übergeben wurde
void RTC_ReadTime(RTC_Struct *pTime)
{
	RTC_SetRegAddress(0x00);														// Ruft die Funktion "RTC_SetRegAdress" auf und übergibt eine 0x00 (Register für die Sekunden)
	I2CHW_fReadBytes(RTC_Addr, (char*)&(pTime->Seconds), 7, I2CHW_CompleteXfer);	// Ließt 7 Bytes aus der RTC und speichert sie unter pTime, beginnend bei "Seconds"
	while(!(I2CHW_bReadI2CStatus() & I2CHW_RD_COMPLETE));							// Warten bis der Lesevorgang abgeschlossen ist
	I2CHW_ClrRdStatus();															// Löscht das "Read Complete" Flag
}

// Diese Funktion speichert die Zeit und das Datum in der RTC
void RTC_SetTime(RTC_Struct *pTime)
{	
    I2CHW_bWriteBytes(RTC_Addr, (char *)pTime, TIME_LEN, I2CHW_CompleteXfer);		// Schreibt die Daten in die RTC. Das erste Byte von pTime (vom Typ RTC_Struct) 
																					// ist das RTC Regster "Adress" und wird gefolgt von 7 Bytes (Datum und Uhrzeit)
	while(!(I2CHW_bReadI2CStatus() & I2CHW_WR_COMPLETE));							// Warten bis die Übertragung abgeschlossen wurde
	I2CHW_ClrWrStatus();															// Löscht das "Write Complete" Flag
}

// Diese Funktion wird verwendet um ein einzelnes Register der RTC zu beschreiben
void RTC_WriteReg(BYTE RegAddress, BYTE RegData)
{
	BYTE RTCData[2];																// Deffiniert ein lokales Array mit Namen "RTCData". Dieses Feld
																					// ist zwei Byte groß
	RTCData[0] = RegAddress;														// Schreibt an die 1. Stelle (0) des Feldes das was unter "RegAdress" in die Funktion
																					// übergeben wurde
	RTCData[1] = RegData;															// Schreibt an die 2. Stelle (1) des Feldes das was unter "RegData" in die Funktion
																					// übergeben wurde
    I2CHW_bWriteBytes(RTC_Addr, RTCData, 2, I2CHW_CompleteXfer);					// Schreibt den Inhalt des Feldes "RTCData" in die RTC
	while(!(I2CHW_bReadI2CStatus() & I2CHW_WR_COMPLETE));							// Warten bis die Übertragung abgeschlossen wurde
	I2CHW_ClrWrStatus();															// Löscht das "Write Complete" Flag
}

// Diese Funktion wird verwendet um die Registeradresse zu setzen
void RTC_SetRegAddress(BYTE RegAddress)
{
    I2CHW_bWriteBytes(RTC_Addr, &RegAddress, 1, I2CHW_CompleteXfer);				// Schreibt die Registeradresse in die RTC
	while(!(I2CHW_bReadI2CStatus() & I2CHW_WR_COMPLETE));							// Wartet bis die Übertragung abgeschlossen wurde
	I2CHW_ClrWrStatus();															// Löscht das "Write Complete" Flag
}

// Zeit und Datum auf dem LCD anzeigen
void Print_Time(RTC_Struct *pTime)
{
	LCD_Position(0,0);																// Position the cursor on the LCD for displaying data
	if(pTime->Hours & 0x40)															// True if 12 hours format is used and false if 24 hours format is used																				
	{																				// Display Hours on the LCD
		LCD_PrHexByte(pTime->Hours & 0x1F);
	}
	else
	{
		LCD_PrHexByte(pTime->Hours & 0x3F);
	}	
	
	LCD_PrCString(":");																// Zeigt einen ":" an
	
	LCD_PrHexByte(pTime->Minutes);													// Zeigt die Minuten auf dem LCD an
	LCD_PrCString(":");
	
	LCD_PrHexByte(pTime->Seconds);													// Zeigt die Sekunden auf dem LCD an
		
	if(pTime->Hours & 0x40)															// Der Zeiger "pTime" zeigt auf die Stelle "Hours" und es 
	{																				// wird entschieden ob 12h oder 24h Modus
		if(pTime->Hours & 0x20)														// Prüft ob "PM" oder "AM" angezeigt werden muss
		LCD_PrCString(" PM");
		else
		LCD_PrCString(" AM");
	}
	
	// Zeigt das Datum an
	LCD_Position(1,0);
	LCD_PrHexByte(pTime->Date);
	LCD_PrCString("/");
	
	// Zeigt den Monat an
	LCD_PrHexByte(pTime->Month);
	LCD_PrCString("/");
	
	// Zeigt das Jahr an
	LCD_PrHexByte(pTime->Year);
	
	// Zeigt den Wochentag an
	switch(pTime->Day)
	{
		case 1:	LCD_PrCString(" (SUN)");
				break;
				
		case 2:	LCD_PrCString(" (MON)");
				break;
				
		case 3:	LCD_PrCString(" (TUE)");
				break;
				
		case 4:	LCD_PrCString(" (WED)");
				break;
				
		case 5:	LCD_PrCString(" (THU)");
				break;
		
		case 6:	LCD_PrCString(" (FRI)");
				break;
				
		case 7:	LCD_PrCString(" (SAT)");
				break;
				
	}
}

// ISR um die RTC auszulesen
void RTC_Read_ISR(void)
{
	BYTE dummy;
	fReadRTC = 0x01;																	// Event used to read data from RTC 
	dummy = PRT1DR;																		// Ließt Port1 um den "ChangeFromRead" Interrupt auszulösen
	Print_Time(&Time);																	// Ruft die Funktion "Print_Time" auf und übergibt die Adresse
}																						// von dem Struct "Time"