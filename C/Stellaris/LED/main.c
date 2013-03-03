/* Include of StellarisWare */
#include "inc/hw_ints.h"
#include "inc/hw_memmap.h"
#include "inc/hw_types.h"
#include "driverlib/debug.h"
#include "driverlib/fpu.h"
#include "driverlib/gpio.h"
#include "driverlib/interrupt.h"
#include "driverlib/pin_map.h"
#include "driverlib/rom.h"
#include "driverlib/sysctl.h"
#include "driverlib/uart.h"
#include "driverlib/rom.h"
#include "driverlib/i2c.h"

/* Include of standard C Headerfiles */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define SLAVE_ADDRESS 0x3C

//******************************************************************************//
//																				//
// The error routine that is called if the driver library encounters an error.	//
//																				//
//******************************************************************************//

#ifdef DEBUG
void
__error__(char *pcFilename, unsigned long ulLine)
{
}
#endif

//******************************************************************************//
//																				//
// 									Subroutines									//
//																				//
//******************************************************************************//

void Send_UART(char Data[])
{
	int n;																										// Local Variable for the Counter
	size_t Laenge;																								// Local Variable for the Stringlength

	Laenge = strlen(Data);																						// Get length of target String
	for(n = 0; n < Laenge; n++)
	{
		UARTCharPut(UART1_BASE, Data[n]);																		// Print each Character of the target String
	}

	UARTCharPut(UART1_BASE, 0x0A);																				// Send LF
	UARTCharPut(UART1_BASE, 0x0D);																				// Send CR
}

void UARTInit(void)
{
	/* Activating necessary Modules */
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);																// Enable Port B (for UART)
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART1);																// Enable UART1-Module

    /* I/O Configuration */
    GPIOPinConfigure(GPIO_PB1_U1TX);																			// Config PortB1 as Tx
    GPIOPinTypeUART(GPIO_PORTB_BASE, GPIO_PIN_1);																// Config alternative UART Function of PortB1

    /*	UART1 Configuration	*/
	UARTConfigSetExpClk(UART1_BASE, SysCtlClockGet(), 19200,													// Config UART1 to 19200 Baud,
						(UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE |											// 8-Bit, 1 Stopbit,
						UART_CONFIG_PAR_NONE));																	// no Parity
	UARTEnable(UART1_BASE);																						// Enable UART1

}

void I2C_SlaveInit(void)
{
	/* Activating necessary Modules */
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);																// Enable Port E (for I²C)
    SysCtlPeripheralEnable(SYSCTL_PERIPH_I2C2);																	// Enable I²C2-Module

    /* I/O Configuration */
    GPIOPinConfigure(GPIO_PE4_I2C2SCL);																			// Config alternative SCL Function on PortE4
    GPIOPinConfigure(GPIO_PE5_I2C2SDA);																			// Config alternative SDA Function on PortE5
    GPIOPinTypeI2C(GPIO_PORTE_BASE, GPIO_PIN_4 | GPIO_PIN_5);													// Config PortE4 & 5 for I²C

    /* I²C Configuration */
	I2CSlaveEnable(I2C2_SLAVE_BASE);
    I2CSlaveInit(I2C2_SLAVE_BASE, SLAVE_ADDRESS);
}

//******************************************************************************//

void main(void)
{
	/*	Variables	*/
	char String[10];

	/*	System Configuration	*/
	SysCtlClockSet(SYSCTL_SYSDIV_1 | SYSCTL_USE_OSC | SYSCTL_XTAL_16MHZ |										// 16 MHz Clock
					SYSCTL_OSC_MAIN);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);																// Enable Port F (for RGB LED)

    /*	Port Configuration	*/
    GPIOPinTypeGPIOOutput(GPIO_PORTF_BASE, GPIO_PIN_3);															// Set Pin 3 of PortF as an Output

	/* Print out Clock */
	ltoa(SysCtlClockGet(), String);																				// Convert Returnvalue of SysCtlClockGet() into a String
	Send_UART("Systemclock:");
	Send_UART(String);																							// Send String

	//I2C_SlaveInit();
	UARTInit();

  while(1)
  {
      GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, 8);																// Set Pin 3 to High Level
      SysCtlDelay(SysCtlClockGet() / 10 / 3);																	// Delay of 3 Cycles/loop
      GPIOPinWrite(GPIO_PORTF_BASE, GPIO_PIN_3, 0);																// Set Pin 3 to Low Level
      SysCtlDelay(SysCtlClockGet() / 10 / 3);																	// Delay of 3 Cycles/loop
  }
}

