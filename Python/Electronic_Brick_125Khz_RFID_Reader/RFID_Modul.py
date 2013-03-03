import serial
import sys
import time
from operator import xor

# UART
Datensatz = ""
Zeichen = 0

# Flags
Startflag = "\x02"
Endflag = "\x03"

# User ID
ID = 0
Tag = 0
User = ""
Liste = {}
Checksumme = 0
Checksumme_Tag = 0
Check = 0

# UART oeffnen
UART = serial.Serial("/dev/ttyAMA0", 9600)
UART.open()

# Datei oeffnen
Temp = open("/home/pi/Desktop/Sicherheit/ID.txt", "r")

# Datei zeilenweise auslesen
for Zeile in Temp: 

	# CR aus der Textzeile entfernen
	Zeile = Zeile.replace("\n", "")
	
	# LF aus der Textzeile entfernen
	Zeile = Zeile.replace("\r", "")
	
	# Textzeile aufteilen
	Zeile = Zeile.split(":")
	
	# ID aus der Datei in eine Zahl umwandeln
	Zeile[1] = int(Zeile[1])
	
	# Daten zu der Liste hinzufuegen
	Liste[Zeile[1]] = Zeile[0]

while True:

	# Variablen loeschen
	Checksumme = 0
	Checksumme_Tag = 0
	Datensatz = ""
	
	# Zeichen einlesen
	Zeichen = UART.read() 

	# Uebertragungsstart signalisiert worden?
	if Zeichen == Startflag:

		# ID zusammen setzen 
		for Counter in range(13):
		
			Zeichen = UART.read() 
			Datensatz = Datensatz + str(Zeichen)
			
		# Endflag aus dem String loeschen
		Datensatz = Datensatz.replace(Endflag, "" );
		
		# Checksumme berechnen
		for I in range(0, 9, 2):
			Checksumme = Checksumme ^ (((int(Datensatz[I], 16)) << 4) + int(Datensatz[I+1], 16))
		
		# Tag herausfiltern
		Tag = ((int(Datensatz[1], 16)) << 8) + ((int(Datensatz[2], 16)) << 4) + ((int(Datensatz[3], 16)) << 0)
		Tag = hex(Tag)
	
		# Checksumme ueberpruefen
		Checksumme_Tag = ((int(Datensatz[10], 16)) << 4) + (int(Datensatz[11], 16))
		if Checksumme_Tag == Checksumme:
			Check = 1
		else:
			check = 0
		
		# ID herausfiltern und zum Suchen in einen Int umwandeln
		ID = Datensatz[4:10]
		ID = int(ID, 16)
		
		# User herausfinden
		User = Liste.get(ID, "Unbekannt")

	if Check == 1:
		# Ausgabe der Daten
		print "------------------------------------------"
		print "Datensatz:", Datensatz
		print "Tag:", Tag
		print "ID:", ID
		print "User:", User
		print "Checksumme:", Checksumme
		print "------------------------------------------"
	else:
		print "Fehler beim Lesen der Karte!"
		print "Einlesevorgang wiederholen!"
	
Temp.close()
UART.close()