//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>       
#include "PSoCAPI.h"

struct I2C_Regs 
{
	int ADC;     
	int PWM_Freq;
	int PWM_Pulse;
}I2C;

void main(void)
{
	EzI2Cs_SetRamBuffer(10, 10, (char *)&I2C);	

	M8C_EnableGInt;
	EzI2Cs_Start();																	// I²C Modul starten
	EzI2Cs_EnableInt();																// I²C Interrupts aktivieren
	LCD_Start();
	PWM16_Start();
		
	I2C.ADC = 0x0800;
	I2C.PWM_Freq = 0x1650;
	I2C.PWM_Pulse = 0x1000;
	
	while(1)
	{
		LCD_Position(0,0);
		LCD_PrHexInt(I2C.ADC);
		LCD_Position(1,0);
		LCD_PrHexInt(I2C.PWM_Freq);
		LCD_Position(2,0);
		LCD_PrHexInt(I2C.PWM_Pulse);
		
		PWM16_WritePeriod(I2C.PWM_Freq);
    	PWM16_WritePulseWidth(I2C.PWM_Pulse);

	}
}