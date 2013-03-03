// Compile with: gcc /Programme/UART.c -o /Programme/UART

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <termios.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#define BAUDRATE B9600

char MODEMDEVICE[]= "/dev/ttyAMA0";
struct termios newtio={};
int fd;

int UART_Init()
{ 
    // O_RDONLY, O_WRONLY or O_RDWR -
    // O_NDELAY (geht weiter, wenn keine Daten da sind und gibt "-1" zurueck)
    // man 2 open fuer mehr Infos - see "man 2 open" for more info
    // O_NOCTTY No ControllTeleType 
    fd = open(MODEMDEVICE, O_WRONLY | O_NOCTTY);
	
    if (fd < 0)
	{
        printf("Fehler beim �ffnen von %s\n", MODEMDEVICE);
        exit(-1);
    }
	
    memset(&newtio, 0, sizeof(newtio));
    newtio.c_cflag = BAUDRATE | CS8 | CLOCAL | CREAD;   		
    newtio.c_iflag = IGNPAR;
    newtio.c_oflag = 0;
    newtio.c_lflag = 0;         /* set input mode (non-canonical, no echo, ...) */
    newtio.c_cc[VTIME] = 0;     /* inter-character timer unused */
    newtio.c_cc[VMIN] = 1;    /* blocking read until 1 chars received */

    tcflush(fd, TCIFLUSH);
    tcsetattr(fd, TCSANOW, &newtio);
    return fd;
}


int main(int argc, char** argv)
{
	// Variablen f�r das Hauptprogramm
	char LineEnd[] = "\r\n";
	int res;
	
    UART_Init();
	
	if (argc >= 1)                                                     
	{
		res = write(fd, argv[1], strlen(argv[1]));
		write(fd, LineEnd, 2);
	}
	
	printf("Text empfangen\n");

    close (fd);
	return 0;
}