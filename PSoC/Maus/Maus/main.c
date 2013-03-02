//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        										// part specific constants and macros
#include "PSoCAPI.h"    										// PSoC API definitions for all User Modules
#pragma interrupt_handler Pause

BOOL Zeit = 0;
BYTE abMouseData[3] = {0,0,0};									// (X,Y,Z)

void main (void)
{
     	M8C_EnableGInt; 										// Enable Global Interrupts
		Timer16_EnableInt();
		Timer16_Start();
	    USBFS_Start(0, USB_5V_OPERATION); 						// Start USBFS Operation using device 0 at 5V 
	    while(!USBFS_bGetConfiguration()); 						// Wait for Device to enumerate
     	USBFS_LoadInEP(1, abMouseData, 3, USB_NO_TOGGLE); 		// Begin initial USB transfers

     	while(1)
	     {
		    if(USBFS_bGetEPAckState(1) != 0) 					// Check and see if ACK has occured
		    {
				USBFS_LoadInEP(1, abMouseData, 3, USB_TOGGLE); 		// Load EP1 with mouse data
			
				if((PRT1DR) & (0x10))
				{
					abMouseData[2] = 0;
				}
			
				if(Zeit)
				{
					abMouseData[1] = 247;
					abMouseData[2] = 247;
					// abMouseData[0] |= 0x02;							// Right Click
					// abMouseData[0] |= 0x01;							// Left Click
					PRT2DR |= 0x20;
				}
				else
				{
					abMouseData[1] = 8;
					abMouseData[2] = 8;	
					PRT2DR &= ~0x20;
		        }
			}
	     }
}

void Pause(void)
{
	Zeit ^= 0x01;

}