// Compile with: gcc /Programme/GPIO.c -o /Programme/GPIO
 
#include <sys/types.h>                        
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

char Device_Value[] = "/sys/class/gpio/gpio17/value";
char Device_Direction[] = "/sys/class/gpio/gpio17/direction";
char Device_Value1[] = "/sys/class/gpio/gpio21/value";
char Device_Direction1[] = "/sys/class/gpio/gpio21/direction";

int main(int argc, char** argv)
{
	char Input;
	char p17;
	char p21;
	char Buffer[80];
	int fd;
	
	// Pin als Eingang schalten
	fd = open(Device_Direction, O_RDWR);
	write(fd, "in", 2);
	close(fd);
		
	fd = open(Device_Direction1, O_RDWR);
	write(fd, "in", 2);
	close(fd);
	
	
	// Pin auslesen
	fd = open(Device_Value, O_RDWR);	
	read(fd, &p17, 1);
	close (fd);	
		
	fd = open(Device_Value1, O_RDWR);	
	read(fd, &p21, 1);
	close (fd);		
	
	// Die zwei überflüssigen Bits rausnehmen
	p17 = p17 - 48;
	p21 = p21 - 48;
	
	// Status in der Konsole ausgeben
	printf("%d\n", p17);
	printf("%d\n", p21);
	
	// Systemstring mit Übergabeparametern verbinden
	if (p17==0 || p21==0) // soll ausgeführt werden wenn p17 oder p21 0 ist
	{
		// Pfad für das Mailprogramm muss angepasst werden
		sprintf(Buffer, "/usr/bin/python /home/pi/Desktop/Autostart/Mail.py %s %d %s %d", "GPIO17: ", p17, "GPIO21:", p21);
	}
	// E-Mail verschicken
	system(Buffer);
	
	
	
	return 0;
}