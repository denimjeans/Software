/*
 * MCP4812.c
 *
 * Created: 09.03.2012 16:22:14
 *  Author: Daniel
 */ 

#define F_CPU 16000000
#include <avr/io.h>
#include <util/delay.h>

void SPI_Init();
void SPI_Send(char Senden);

char Daten = 0x00;

int main(void)
{
	DDRB =  (1<<DDB7) | (1<<DDB5) | (1<<DDB0);										// CS(PB.0), SCK und MOSI als Output einstellen
	PORTB = (1<<PB0);																// PB.0 setzen
	
	SPI_Init();
	
    while(1)
    {
		PORTB &= ~(1 << PB0);														// CS auf Low
		
		_delay_us(1);
		SPI_Send(0x10);
		SPI_Send(Daten);
		_delay_us(1);
		PORTB |= (1<<PB0);															// CS auf High
		_delay_ms(1000);
		Daten++;
		
		if(Daten > 255)
		{
			Daten = 0x00;
		}		
    }
}

void SPI_Init()
{
	SPCR = (1<<SPE) | (1<<MSTR) | (1<<SPR0);										// SPE = SPI_Enable; MSTR = Master; SPR0 = f_sck/16 = 1MHz SCK Frequenz (16MHz Quarz)
	
}

void SPI_Send(char Senden)
{	
	SPDR = Senden;																	// Daten schicken
    while(!(SPSR & (1<<SPIF)));                                         	
}