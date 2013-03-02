//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>       
#include "PSoCAPI.h"  
#pragma interrupt_handler Timer;

char *String; 
int Value = 0x00;

void main(void)
{
    M8C_EnableGInt ;
    UART_CmdReset(); 
	UART_IntCntl(UART_ENABLE_RX_INT);       
    UART_Start(UART_PARITY_NONE);  
	ADC8_Start(ADC8_FULLRANGE); 
	//ADC8_bCal(0x42, ADC8_CAL_VBG);
	ADC8_StartADC();
	Timer8_EnableInt();
    Timer8_Start();
	
   	while(1) 
	{
   		if(UART_bCmdCheck()) 
		{                 
         	if(String = UART_szGetParam()) 
			{       
             	UART_CPutString("Found valid command\r\nCommand =>");  
            	UART_PutString(String);            
            	UART_CPutString("<\r\nParamaters:\r\n");  
				
            	while(String = UART_szGetParam()) 
				{
               		UART_CPutString("   <");  
               		UART_PutString(String);          
               		UART_CPutString(">\r\n");  
            	} 
        	} 
			
   		UART_CmdReset(); 
	  
		}
 	}
} 

void Timer(void) 
{

}