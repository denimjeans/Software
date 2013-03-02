//------------------------------------------------------------------------------//
// 								Laufschrift										//
//------------------------------------------------------------------------------//

#include <m8c.h>       																		 // Part specific constants and macros
#include "PSoCAPI.h"   																		 // PSoC API definitions for all User Modules
#pragma interrupt_handler Timer

unsigned char ascii[] = {
	119,124,57,94,121,113,61,118, 	// ABCDEFGH
	6,30,0,56,0,55,63,115,       	// IJ_L_NOP
	0,80,109,120,62,0,0,0,        	// QRSTU___
	110,0 							// YZ
};
					  //123456789012345678901234567890
unsigned char text[] = "ZZZZZZZZZZZHALLOZZZZZZZZZZZZZZ";									// Satz der angezeigt werden soll. "Z" als Leerzeichen und 30 Stellen

volatile int Flag = 1;																		// Flag für den Timer
int Segment;																				// Zähler für die Segmente
int Zaehler_Text;																			// Zähler für die Stellen im Array "text"
	
void main(void)
{
    M8C_EnableGInt;
	LED7SEG_Start();
	Timer16_Start();
	Timer16_EnableInt();
	
	while (1)
	{
		Zaehler_Text = 0;																	
		while (Zaehler_Text < 28)															// Schleife bis alle Stellen des Arrays "Text" durchgelaufen sind
		{
			for (Segment = 0; Segment < 4; Segment++)										// Schleife bis alle 4 Segmente durchgelaufen sind
			{
				LED7SEG_PutPattern(ascii[text[Zaehler_Text+Segment]-65],Segment+1);			// Ließt das Zeichen mit der Nummer, welche sich aus dem Zähler für das Array "text"
																							// und der Segmentzahl ergibt, aus dem Array "text" ein und zieht davon dann 65 ab. 
																							// Anschließend wird aus dem Array "ascii" das Byte mit der übereinstimmenden Nummer 
																							// ausgelesen und auf der 7-Segment Anzeige ausgegeben.
			}
			Zaehler_Text++;																	// Der Zähler für das Array "text" erhöhen.
			while (Flag == 0);																// Schleife bis das Flag für den Timer 1 ist
			Flag = 0;																		// Flag für den Timer auf 0 setzen
		}
	}
}

void Timer(void)
{
	Flag = 1;
}