//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        												// Part specific constants and macros
#include "PSoCAPI.h"    												// PSoC API definitions for all User Modules
#pragma interrupt_handler Timer16

// Unterprogramme
void Read_Register(const char *Adresse);
void Write_Register(const char *Daten, const char * Adresse);
void MCP2515_Init(void);
void Bitmodify(void);

char Canin = 0x00;

// Befehle
const char SPI_read = 0x03;
const char SPI_write = 0x02;
const char SPI_reset = 0xC0;
const char SPI_rts0 = 0x81;
const char SPI_bitmodify = 0x05;

// Registeradressen
const char Cnf1 = 0x2A;
const char Cnf2 = 0x29;
const char Cnf3 = 0x28;
const char Canctrl = 0x0F;
const char Caninte = 0x2B;
const char Txb0ctrl = 0x30;                                       		// Transmit Buffer 0 Control Register
const char Txb0sidh = 0x31;                                       		// Transmit Buffer 0 Std Identifier High
const char Txb0sidl = 0x32;                                       		// Transmit Buffer 0 Std Identifier Low
const char Txb0eid8 = 0x33;                                       		// Transmit Buffer 0 Ext Identifier High
const char Txb0eid0 = 0x34;                                       		// Transmit Buffer 0 Ext Identifier Low
const char Txb0dlc = 0x35;                                        		// Transmit Buffer 0 Data Length Code
const char Txb0d0 = 0x36;                                        		// Transmit Buffer 0 Data Byte 0
const char Txb0d1 = 0x37;                                         		// Transmit Buffer 0 Data Byte 1
const char Txb0d2 = 0x38;                                         		// Transmit Buffer 0 Data Byte 2
const char Txb0d3 = 0x39;                                         		// Transmit Buffer 0 Data Byte 3
const char Txb0d4 = 0x3A;                                         		// Transmit Buffer 0 Data Byte 4
const char Txb0d5 = 0x3B;                                         		// Transmit Buffer 0 Data Byte 5
const char Txb0d6 = 0x3C;                                         		// Transmit Buffer 0 Data Byte 6
const char Txb0d7 = 0x3D;                                         		// Transmit Buffer 0 Data Byte 7
const char Rxm0sidh = 0x20;                                				// Receive Buffer 0 Std Identifier High
const char Rxm0sidl = 0x21;                                				// Receive Buffer 0 Std Identifier Low
const char Rxm0eid8 = 0x22;                                				// Receive Buffer 0 Ext Identifier High
const char Rxm0eid0 = 0x23;                                				// Receive Buffer 0 Ext Identifier low
const char Rxm1sidh = 0x24;                                				// Receive Buffer 1 Std Identifier High
const char Rxm1sidl = 0x25;                                				// Receive Buffer 1 Std Identifier Low
const char Rxm1eid8 = 0x26;                                				// Receive Buffer 1 Ext Identifier High
const char Rxm1eid0 = 0x27;                                				// Receive Buffer 1 Ext Identifier low
const char Rxb0ctrl = 0x60;
const char Rxb1ctrl = 0x70;

const char Settings_Canctrl = 0x88;

void main(void)
{
	M8C_EnableGInt; 													// Global Interrupts erlauben
	TX8SW_Start();
	SPIM_Start(SPIM_SPIM_MODE_0 | SPIM_SPIM_MSB_FIRST);
	Timer16_EnableInt();  
    Timer16_Start(); 
		
	PRT1DR |= 0x02;     												// P0[1] setzen
	//MCP2515_Init();
	
	Write_Register(&Canctrl, &Settings_Canctrl);
	Read_Register(&Canctrl);
	
	  	TX8SW_CPutString("Registerinhalte:");
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		SPIM_SendTxData(Canin);
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
	
	while(1)
	{
	}
}

void Read_Register(const char *Adresse)
{
	PRT0DR &= ~0x02;
	
	while(!(SPIM_bReadStatus() & SPIM_SPIM_TX_BUFFER_EMPTY));
	SPIM_SendTxData(SPI_read);
		
	while(!(SPIM_bReadStatus() & SPIM_SPIM_TX_BUFFER_EMPTY));
	SPIM_SendTxData(*Adresse);
		
	while(!(SPIM_bReadStatus() & SPIM_SPIM_RX_BUFFER_FULL));
	Canin = SPIM_bReadRxData();
		
		TX8SW_CPutString("Lesen:");	
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_CPutString("SPI Read");
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_SendData(SPI_read);
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_CPutString("Adresse");
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_SendData(*Adresse);
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
	PRT1DR |= 0x02;     												// P0[1] setzen		
}

void Write_Register(const char *Adresse, const char *Daten)
{
	PRT0DR &= ~0x02;
	
	while(!(SPIM_bReadStatus() & SPIM_SPIM_TX_BUFFER_EMPTY));
	SPIM_SendTxData(SPI_write);
		
	while(!(SPIM_bReadStatus() & SPIM_SPIM_TX_BUFFER_EMPTY));
	SPIM_SendTxData(*Adresse);
		
	while(!(SPIM_bReadStatus() & SPIM_SPIM_TX_BUFFER_EMPTY));
	SPIM_SendTxData(*Daten);
		
		TX8SW_CPutString("Schreiben:");
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_CPutString("SPI Write:");
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_SendData(SPI_write);
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_CPutString("Adresse:");
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_SendData(*Adresse);
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_CPutString("Daten:");
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		TX8SW_SendData(*Daten);
		TX8SW_SendData(0x0D);
		TX8SW_SendData(0x0A);
		
	PRT1DR |= 0x02;     												// P0[1] setzen		
}

void MCP2515_Init(void)
{
	PRT0DR &= ~0x02;													// P1[1] löschen
	SPIM_SendTxData(SPI_reset);
	while(!(SPIM_bReadStatus() & SPIM_SPIM_TX_BUFFER_EMPTY));
	PRT1DR |= 0x02;     												// P0[1] setzen

}

void Bitmodify(void)
{

}

void Timer16(void)
{
}