// StellarisWare
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

// Standard C
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

void Send_UART(char Data[])
{
	int n;																										// Lokale Variable für den Zähler
	char Laenge;																								// Lokale Variable für die Stringlänge

	Laenge = strlen(Data);																						// Länge des Strings bestimmen
	for(n = 0; n < Laenge; n++)
	{
		UARTCharPut(UART1_BASE, Data[n]);
	}

	UARTCharPut(UART1_BASE, 0x0A);																				// Sende LF
	UARTCharPut(UART1_BASE, 0x0D);																				// Sende CR
}

void main(void)
{
	char String[10];

	// Takt einstellen
	SysCtlClockSet(SYSCTL_SYSDIV_1 | SYSCTL_USE_OSC | SYSCTL_XTAL_16MHZ |										// 16 MHz Clock
					SYSCTL_OSC_MAIN);

	// Port B aktivieren
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOB);

    // UART Modul aktivieren
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UART1);

    // Port B konfigurieren
    GPIOPinConfigure(GPIO_PB1_U1TX);																			// Pin B.1 Tx-Funktion zuweisen
    GPIOPinTypeUART(GPIO_PORTB_BASE, GPIO_PIN_1);																// UART Modul Pin B.1 zuweisen

    // UART konfigurieren
	UARTConfigSetExpClk(UART1_BASE, SysCtlClockGet(), 19200,													// UART1 19200 Baud,
						(UART_CONFIG_WLEN_8 | UART_CONFIG_STOP_ONE |											// 8-Bit, 1 Stopbit,
						UART_CONFIG_PAR_NONE));																	// Keine Parität

	// UART aktivieren
	UARTEnable(UART1_BASE);

  while(1)
  {
	  Send_UART("Hallo");
      SysCtlDelay(SysCtlClockGet() / 3);																		// Pause von 1 Sekunde, jeder Delay ist
      	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	  	// 3 Taktzyklen lang
  }
}

