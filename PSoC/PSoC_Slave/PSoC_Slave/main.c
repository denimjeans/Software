//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>       
#include "PSoCAPI.h"

// Struct für den I²C-Buffer
struct I2C_Regs 
{
	int ADC;     
	int PWM_Freq;
	int PWM_Pulse;
	char Temperatur;
}I2C;

void main(void)
{
	EzI2Cs_SetRamBuffer(10, 10, (char *)&I2C);										// I²C Buffer setzen

	M8C_EnableGInt;
	
	EzI2Cs_Start();																	// I²C Modul starten
	EzI2Cs_EnableInt();																// I²C Interrupts aktivieren
	PWM16_Start();																	// PWM Modul aktivieren
	
	ADC10_Start(ADC10_FULLRANGE);      												// ADC Modul aktivieren 
	ADC10_iCal(119, ADC10_CAL_VBG);  // 1.3V = 333 counts 
	ADC10_StartADC();																// Sampling starten
	
	// Startwerte setzen
	I2C.PWM_Freq = 32767;												
	I2C.PWM_Pulse = 16383;
	
	while(1)
	{
		PWM16_WritePeriod(I2C.PWM_Freq);
    	PWM16_WritePulseWidth(I2C.PWM_Pulse);
		
		while(0 == ADC10_fIsDataAvailable());  
   		I2C.ADC = ADC10_iGetDataClearFlag(); 
	}
}