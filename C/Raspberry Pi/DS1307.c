// Compile with: gcc /Programme/DS1307.c -o /Programme/DS1307

#include <stdio.h>
#include <stdlib.h>
#include <linux/i2c-dev.h>
#include <linux/i2c.h>
#include <fcntl.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

#define Buffer 7

char BCD2D(char Wert)
{
	return (Wert%16 + 10 * (Wert/16));
}

int main()
{
	int File;
	char Device[] = "/dev/i2c-0";
	char RTC = 0x68;
	char Date[7];
	int i;
	
	if ((File = open(Device, O_RDWR)) < 0) 														// I²C aktivieren
	{
		printf("I²C Modul kann nicht geladen werden!\n");
	    return -1;
	}
	
	if (ioctl(File, I2C_SLAVE, RTC) < 0) 																// Port und Adresse setzen
	{					
		printf("Deviceadresse wurde nicht gefunden!\n");
		exit(1);
	}
	
	Date[0] = 0x00;
	
	if(write(File, Date, 1) != 1) 																		// Pointer auf Adresse 0 (Startadresse) setzen
	{
		printf("Fehler beim Schreiben der Daten!\n");
		return -1;
	}
	
	if (read(File, Date, Buffer) != Buffer) 
	{
		printf("Fehler beim Lesen der Daten!\n");
		return -1;
	} 
	else 
	{
		// Werte von BCD in Dezimal umwandeln
		for(i = 0; i < Buffer; i++) 
		{
			Date[i] = BCD2D(Date[i]);
		}
		
		printf("\n");
		printf("DS1307 Ausgabe");
		printf("\n");
		printf("\n");
		
		// Uhrzeit ausgeben
		printf("Stunden: %d", Date[2]);
		printf("\n");
		printf("Minuten: %d", Date[1]);
		printf("\n");
		printf("Sekunden: %d", Date[0]);
		printf("\n");

		// Tage ausgeben
		printf("\n");
		printf("Jahr: 20%d", Date[6]);
		printf("\n");
		printf("Monat: %d", Date[5]);
		printf("\n");
		printf("Tag: %d", Date[4]);
		printf("\n");
		
		switch(Date[3])
		{
			case 1:
				printf("Sonntag");
			break;
			
			case 2:
				printf("Montag");
			break;
		
			case 3:
				printf("Dienstag");
			break;
			
			case 4:
				printf("Mittwoch");
			break;
			
			case 5:
				printf("Donnerstag");
			break;
			
			case 6:
				printf("Freitag");
			break;
			
			case 7:
				printf("Samstag");
			break;
		}
		
		printf("\n");
		printf("\n");
	}
	
	close(File);
	return 0;
}