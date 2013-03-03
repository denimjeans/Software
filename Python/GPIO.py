import RPi.GPIO as GPIO
import Tkinter

# GPIO 25, 24, 23, 22
Pin = [22, 18, 16, 15]

# Funktion zum auslesen der Raspberry Pi Version
def Version():
	File = open('/proc/cpuinfo','r')
	for Zeile in File:
		if Zeile.startswith('Revision'):
			return Zeile.rstrip()[-1]

# GPIO initialisieren
def GPIO_Init():
	for I in Pin:
		GPIO.setup(I, GPIO.IN)

# Startausgabe in der Konsole
def Start():
	print "*** Programm zum Auslesen der GPIO ***"
	print "*** Raspberry Pi Version", Version(), "***"
	print ""

# GPIO auslesen
def GPIO_Read():
	for Nummer in Pin:
		Status = {Nummer:GPIO.input(Nummer)}
	
	Show = Tkinter.Label(Main, text = Status, width = 100)
	Show.pack()
	
# Programm beenden
def Close():
	Main.destroy()
	
#------------------------------------------------------------------------

Start()
GPIO_Init()

# Hauptfenster
Main = Tkinter.Tk()

# Button Read
Read = Tkinter.Button(Main, text = "Read GPIO", command = GPIO_Read)
Read.grid(row=0, column=1)

# Button Exit
Exit = Tkinter.Button(Main, text = "Exit", command = Close)
Exit.grid(row=0, column=2)

# Endlosschleife
Main.mainloop()