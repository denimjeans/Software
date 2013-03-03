/*
 * XMega.c
 *
 * Timer C0 wird ist auf 1 Sekunde eingestellt. Jede Sekunde wird Pin R0 getogglet. Jede Sekunde wird die Ausgangsspannung des DACB (Pin 7 - B2) um 100 erhöht. Es ist Vcc als
 * Referenzspannung eingestellt, sodass die maximale Ausgangsspannung 3,3V betragen kann.
 * Timer F0 generiert eine PWM (Pin 48 - F3), die jede Sekunde erhöht wird. USART0 sendet einen Text. Die PLL erzeugt einen 41MHz Takt.
 * Die RTC löst jede Sekunde einen Interrupt aus und gibt dabei einen Text über den UART aus.
 * Der DMA wird durch ADCA Channel 0 getriggert und transferiert die Daten automatisch vom ADC-Register in den RAM.
 * An PortF wird der I²C Bus genutzt.
 *
 * USARTC0, Tx Pin -> PC3.
 * 9600 Baud mit 2 MHz clock. BSCALE = 0
 * BSEL = (2000000 / (2^0 * 16 * 9600)) - 1 = 12
 * Fbaud = 2000000 / (2^0 * 16 * (12+1))  = 9615 bits/sec
 *
 * Created: 22.03.2012 19:42:07
 * Author: Daniel
 */ 

#define CPU_SPEED 32000000																								// Genutzte Frequenz des Oszillators
#define BAUDRATE    100000																								// Gewünschte TWI Frequenz
#define TWI_BAUD(F_SYS, F_TWI) ((F_SYS / (2 * F_TWI)) - 5)																// Wert für die Baudrate des I²C berechnen
#define TWI_BAUDSETTING TWI_BAUD(CPU_SPEED, BAUDRATE) 

// Lese- und Schreibadresse vom EEPROM
#define EEPROM_W_Adresse 0xA0;
#define EEPROM_R_Adresse 0xA1;

#include <avr/io.h>
#include <avr/interrupt.h>
#include <string.h>
#include <stddef.h>																										// Makro "offsetof" einbinden
#include <avr/pgmspace.h>																								// Funktionen zum auslesen
#include <stdlib.h>
												
// Makros
#define nop() asm volatile ("nop")																						// "NOP" als Makro definieren

// Peripherie
unsigned int ADCA_Conversion(ADC_CH_t *Channel, char Pin);
char TWI_ReadEEPROM(int *Zelle);
int LeseKalibrationsbyte(int Index);

// Variablen
volatile int ADC_Value = 0x00;
volatile int Voltage = 0x00;
volatile int Compare = 0x6000;
volatile int ADC_Calibrationbyte;																						// Buffer für ADC Kalibrationswert
volatile int Zaehler = 1;
char Text[50] = "Interrupt!";	
char Ergebnis[5];	
char Eingabe[50];																			

int main(void)
{	
	Clock_init();																										// Konfiguriert die Clock
	PLL_init();																											// PLL konfigurieren
	//RTC_init();																											// RTC initialisieren
	//RTC_config();																										// RTC konfigurieren
	Int_init();																											// Interrupts konfigurieren
	DACB_Cal();																											// DACB kalibrieren
	DACB_init();																										// DACB konfigurieren
	ADCA_Cal();																											// ADCA kalibrieren
	ADCA_init();																										// ADCA konfigurieren
	TimerC0_init();																										// Timer C0 konfigurieren
	TimerF0_init();																										// Timer D0 konfigurieren
	Port_init();																										// Ports konfigurieren
	UART_init();																										// UART konfigurieren
	DMA_init();																											// DMA Controller initialisieren
	//TWIF_init();																										// TWI initialisieren
	//TWI_WriteEEPROM(120,0);																								// Wert 120 in die erste Zelle vom EEPROM schreiben
	
    while(1)
    {

		//DACB_Conversion(Voltage);	
		//TimerD0_Compare(Compare);
		//TimerC0_Freq(0x85ED);
	}	
}

int LeseKalibrationsbyte(int Index)
{
    int result;

    NVM_CMD = NVM_CMD_READ_CALIB_ROW_gc;																				// NVM Command Register laden um Signaturen auszulesen
    result = pgm_read_byte(Index);																						// Ließt das Signaturenstruct an der durch "Index" angezeigten
																														// Stelle aus dem Flash aus.
    NVM_CMD = NVM_CMD_NO_OPERATION_gc;
    return(result); 
}

void DACB_init()
{
	DACB.CTRLB = DAC_CHSEL_DUAL_gc;
    DACB.CTRLC = ~DAC_LEFTADJ_bm;	
	DACB.CTRLC = DAC_REFSEL_AVCC_gc;																														
    DACB.CTRLA = DAC_CH0EN_bm | DAC_CH1EN_bm | DAC_ENABLE_bm;															// DAC Kanäle 0 und 1 aktivieren
}

void ADCA_init()
{
	ADCA.CTRLB = ADC_RESOLUTION_12BIT_gc;																				// Unsigned Mode / 8 Bit
	ADCA.REFCTRL = ADC_REFSEL_INT1V_gc | 0x02;																			// Interne 1V Referenz	
	ADCA.PRESCALER = ADC_PRESCALER_DIV512_gc;																			// Prescaler auf 512 stellen
	ADCA.CTRLA = ADC_ENABLE_bm;																							// ADC Enable
}

void Clock_init(void)
{	
	OSC.CTRL |= OSC_RC32MEN_bm;																						// Oszillator auf 32Mhz stellen
	while(!(OSC.STATUS & OSC_RC32MEN_bm));																				// Warten bis der Oszillator bereit ist
	CCP = CCP_IOREG_gc;
	CLK.CTRL = CLK_SCLKSEL_RC32M_gc;																					// Clock auf 32MHz stellen																							// Prescaler A = CLK/2, Prescaler B/C = CLK/1
}

void PLL_init(void)
{
	OSC.PLLCTRL = OSC_PLLSRC_RC32M_gc | 0x05;																			// PLL auf internen 32MHz Takt stellen und den Multiplikator festlegen
	OSC.CTRL |= OSC_PLLEN_bm;																							// PLL-Enable Bit setzen
	while (!(OSC.STATUS & OSC_PLLRDY_bm));																				// Warten bis PLL bereit ist
	CCP = CCP_IOREG_gc; 
	CLK.CTRL = CLK_SCLKSEL_PLL_gc;																						// PLL als Clock auswählen
}

void RTC_init(void)
{
	OSC.XOSCCTRL = OSC_X32KLPM_bm | OSC_XOSCSEL_32KHz_gc;																// 32kHZ Oszillator aktivieren und im Low Power Mode betreiben
	OSC.CTRL = OSC_XOSCEN_bm;																							// Externen Oszillator aktivieren
	while (OSC.STATUS & (OSC_XOSCRDY_bm));																				// Warten bis der Oszillator stabil schwingt
	CLK.RTCCTRL = CLK_RTCSRC_TOSC_gc | CLK_RTCEN_bm;																	// Externen 32kHz Takt aktivieren und auf 1024kHz stellen
}

void RTC_config(void)
{
	RTC.PER = 1023;																										// RTC soll bis 1023 zählen -> bei 1024Hz = 1 Sekunde
	RTC.CTRL = RTC_PRESCALER_DIV1_gc;																					// Precaler auf 1 stellen
	
	while(RTC.STATUS & RTC_SYNCBUSY_bm);																				// Solange warten bis die RTC synchron zum Systemtakt läuft
	
	RTC.INTCTRL = RTC_OVFINTLVL_gm; 																						// Interruptlevel auf "High" stellen
}

void Int_init(void)
{
	PMIC.CTRL |= PMIC_LOLVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_HILVLEN_bm;													// Interrupts (Highlevel, Mediumlevel und Lowlevel freigeben)
	sei();																												// Globale Interruptfreigabe
	
	//Interrupt für PortA.0 aktivieren
	//PORTA.INTCTRL |= PORT_INT0LVL_LO_gc;
	//PORTA.INT0MASK = 0x01;
}

void Port_init(void)
{
	PORTA.DIR = 0x00;																									// Kompletten Port A auf Eingang stellen
	PORTB.DIR = 0xFF;																									// Kompletten Port B auf Ausgang stellen
	PORTC.DIR = 0x08;																									
	PORTD.DIR = 0xFF;																									// Kompletten Port D auf Ausgang stellen
	PORTE.DIR = 0x00;																									// Kompletten Port E auf Eingang stellen
	PORTR.DIR = 0xFF;
	PORTQ.DIR = 0xFF;
	PORTE.PIN1CTRL = PORT_ISC_FALLING_gc;
	PORTCFG.CLKEVOUT = 0x01;																							// Takt auf einem Pin ausgeben. 0x01 = C.7
																														//								0x02 = D.7
	//Pull-Up Widerstände für PortA																						//								0x03 = E.7
	//PORTA.PIN0CTRL= PORT_OPC_WIREDANDPULL_gc;
}

void TimerC0_init()
{
	TCC0.CTRLA = TC_CLKSEL_DIV1024_gc;																					// Vorteiler einstellen
	TCC0.CTRLB = 0x00;																									// Timer in Normalmodus stellen
	TCC0.INTCTRLA = 0x03;																								// Interrupt konfigurieren  
}

void TWIF_init()
{
	TWIF_MASTER_CTRLA = TWI_MASTER_ENABLE_bm;
	TWIF_MASTER_CTRLB = TWI_MASTER_SMEN_bm; 
	TWIF_MASTER_BAUD = TWI_BAUDSETTING;  
	TWIF_MASTER_STATUS = TWI_MASTER_BUSSTATE_IDLE_gc; 
}

void TimerC0_Freq(int TTW)
{
	TCC0.PER = TTW;																										// Timer-Topwert(TTW) einstellen	
}

void TimerF0_init(void)
{
	TCF0.PER = 0xffff;																									// Timertopwert
	TCF0.CTRLA = 0x03;																									// Prescaler 4
	TCF0.CTRLB = 0x83;																									// BIT0/1 = Single Slope PWM
																														// BIT7 = OCD																					
}

void TimerD0_Compare(int Compare)
{
	TCF0.CCD = Compare;																									// Compare Register laden	
}

void UART_init(void)
{
	USARTC0.BAUDCTRLB = 0;																								// BSCALE = 0 
	USARTC0.BAUDCTRLA = 0x84;																							// Baudrate 19200 @ 41MHz
	USARTC0.CTRLA = USART_RXCINTLVL_HI_gc;																				// Interrupts mit Highlevel aktivieren
	USARTC0.CTRLB = USART_TXEN_bm | USART_RXEN_bm;																		// RX+TX Enable CLK
	USARTC0.CTRLC = USART_CHSIZE_8BIT_gc; 																				// Async, no parity, 8 bit data, 1 stop bit 	
}

void DMA_init(void)
{		
	DMA.CTRL = 0;																										// Registerinhalt löschen
	DMA.CTRL = DMA_RESET_bm;																							// Softwarereset des DMA durchführen
	while ((DMA.CTRL & DMA_RESET_bm) != 0)																				// Warten bis der Reset durchgeführt wurde
	
	DMA.CTRL = DMA_CH_ENABLE_bm | DMA_DBUFMODE_CH01_gc;																	// DMA und den Double Buffer aktivieren

	// Kanal 0
	DMA.CH0.REPCNT = 0;																									// Repeat Counter löschen
	DMA.CH0.CTRLA = DMA_CH_BURSTLEN_2BYTE_gc | DMA_CH_SINGLE_bm | DMA_CH_REPEAT_bm;										// Burstlänge auf 2 Byte einstellen, Single Shot Mode aktivieren
	DMA.CH0.ADDRCTRL = DMA_CH_SRCRELOAD_BURST_gc | DMA_CH_SRCDIR_INC_gc |DMA_CH_DESTRELOAD_TRANSACTION_gc | DMA_CH_DESTDIR_INC_gc;	// Adressenreload auf Initialwert stellen, Zieladresse 
																																	// nach jedem Transfer auf den Initialwert setzen, Start - und 
																																	// Zieladresse wird inkrementiert
	DMA.CH0.TRIGSRC = DMA_CH_TRIGSRC_ADCA_CH0_gc;																		// ADCA Channel 0 als Triggerquelle auswählen																												
}

void Send_UART(char data[])
{
	char Counter;
	char lenght = 0x00;			
	
	lenght = strlen(data);
	
	while(Counter < lenght)
	{
		while (!(USARTC0.STATUS & USART_DREIF_bm));
		USARTC0.DATA = data[Counter];	
		Counter++;
	}
				
	Counter = 0x00;	
	while (!( USARTC0.STATUS & USART_DREIF_bm));
	USARTC0.DATA = 0x0A;	
	while (!( USARTC0.STATUS & USART_DREIF_bm));
	USARTC0.DATA = 0x0D;	
}

unsigned int ADCA_Conversion(ADC_CH_t *Channel, char Pin)
{
	Channel->CTRL = ADC_CH_INPUTMODE_SINGLEENDED_gc;																	// Single Ended Mode einstellen
	Channel->MUXCTRL = (Pin << 3);																						// Pin auswählen
	
	Channel->CTRL |= ADC_CH_START_bm;																					// Messung starten und Input-Mode auf Singleended stellen
	while(!Channel->INTFLAGS);
	return Channel->RES;																								// Inhalt des Datenregisters auslesen
}

void DACB_Conversion(int Voltage)
{
	DACB.CH0DATA = Voltage;
	while (!DACB.STATUS & DAC_CH0DRE_bm);
	DACB.CH1DATA = Voltage;
	while (!DACB.STATUS & DAC_CH1DRE_bm);
}

void TWI_WriteEEPROM(char *WriteData, int *Zelle)
{
	TWIF_MASTER_ADDR = EEPROM_W_Adresse;
	while(!(TWIF_MASTER_STATUS & TWI_MASTER_WIF_bm));
	TWIF_MASTER_DATA = 0;
	while(!(TWIF_MASTER_STATUS & TWI_MASTER_WIF_bm));
	TWIF_MASTER_DATA = Zelle;
	while(!(TWIF_MASTER_STATUS & TWI_MASTER_WIF_bm));
	TWIF_MASTER_DATA = WriteData;
	while(!(TWIF_MASTER_STATUS & TWI_MASTER_WIF_bm));
}

char TWI_ReadEEPROM(int *Zelle)
{
	TWIF_MASTER_ADDR = EEPROM_R_Adresse;
	while(!(TWIF_MASTER_STATUS & TWI_MASTER_WIF_bm));
	TWIF_MASTER_DATA = 0;
	while(!(TWIF_MASTER_STATUS & TWI_MASTER_WIF_bm));
	TWIF_MASTER_DATA = Zelle;
	while(!(TWIF_MASTER_STATUS & TWI_MASTER_WIF_bm));
	return TWIF_MASTER_DATA;
}

void ADCA_Cal(void)
{
	ADCA.CALL = LeseKalibrationsbyte(offsetof(NVM_PROD_SIGNATURES_t, ADCACAL0));	
	ADCA.CALH = LeseKalibrationsbyte(offsetof(NVM_PROD_SIGNATURES_t, ADCACAL1));	
}

void DACB_Cal(void)
{	
	DACB.OFFSETCAL = LeseKalibrationsbyte(offsetof(NVM_PROD_SIGNATURES_t, DACBOFFCAL));									// Ruft die Funktion "LeseKalibrationsbyte"
																														// auf und ermittelt mit "offsetof" den Abstand
																														// vom Anfang der Signatur bis zum zweiten Argument
																														// und übergibt diesen Wert als Parameter "Index" in
																														// die Funktion.
}

ISR(TCC0_OVF_vect)
{
	PORTR.OUT ^= 0x01;
	Zaehler++;
	Voltage = Voltage + 100;
	Compare = Compare + 100;
				
	//ADC_Value = ADCA_Conversion(&(ADCA.CH0), 1);
	//itoa(ADC_Value, Ergebnis, 10);
	Send_UART("Interrupt");
	//ADC_Value = TWI_ReadEEPROM(0);
	//itoa(ADC_Value, Ergebnis, 10);
	//Send_UART(Ergebnis);		
}

ISR(RTC_OVF_vect)
{
	Send_UART("RTC Interrupt");
}

ISR(USARTC0_RXC_vect)
{
	char ReceivedByte; 
	ReceivedByte = USARTC0.DATA;
	
	if(ReceivedByte = 0x0D)
	{
		exit;
	}
	
}