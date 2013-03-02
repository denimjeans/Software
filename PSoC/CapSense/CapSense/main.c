//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // Part specific Constants and Macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

char Button = 0x00;

void I2C_Init(void);

void main(void)
{
  M8C_EnableGInt;
  CSD_Start(); 
  CSD_InitializeBaselines();
  CSD_SetDefaultFingerThresholds(); 
  
  I2C_Init();
  
  EzI2Cs_SetRamBuffer(2, 2, (char*)&Button);

  while (1)
 	{
	CSD_ScanAllSensors();
    CSD_UpdateAllBaselines();
		
		// Sensor 1
		if(CSD_bIsSensorActive(0))
		{
			PRT2DR |= 0x01;
			Button = 0x01;
		}
		else
		{	
			PRT2DR &= ~0x01;
		}
		
		// Sensor 2
		if(CSD_bIsSensorActive(1))
		{
			PRT2DR |= 0x02;
			Button = 0x02;								
		}
		else
		{
			PRT2DR &= ~0x02;
		}
		
		// Sensor 3
		if(CSD_bIsSensorActive(2))
		{
			PRT2DR |= 0x04;
			Button = 0x03;							
		}
		else
		{
			PRT2DR &= ~0x04;
		}
		
		// Sensor 4
		if(CSD_bIsSensorActive(3))
		{
			PRT2DR |= 0x08;
			Button = 0x04;								
		}
		else
		{
			PRT2DR &= ~0x08;
		}
	}
}

void I2C_Init(void)
{
	EzI2Cs_Start();																	// I²C Modul starten
	EzI2Cs_EnableInt();																// I²C Interrupts aktivieren
}