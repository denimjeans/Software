//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // Part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules

void main(void)
{
	M8C_EnableGInt;
	PWM16_EnableInt();    
  	PWM16_Start(); 
	
	while(1)
	{
	
	}
}