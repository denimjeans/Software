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

# Opening UART
UART = serial.Serial("/dev/ttyAMA0", 9600)
UART.open()

# Opening File
Temp = open("/home/pi/Desktop/Sicherheit/ID.txt", "r")

# Read each Line
for Zeile in Temp: 

	# Deleting CR from each Line
	Zeile = Zeile.replace("\n", "")
	
	# Deleting LF from each Line
	Zeile = Zeile.replace("\r", "")
	
	# Split Line
	Zeile = Zeile.split(":")
	
	# Convert ID from a String to an Integer
	Zeile[1] = int(Zeile[1])
	
	# Adding Data to a List
	Liste[Zeile[1]] = Zeile[0]

while True:

	# Reset Variables
	Checksumme = 0
	Checksumme_Tag = 0
	Datensatz = ""
	
	# Read char
	Zeichen = UART.read() 

	# char = 0x02?
	if Zeichen == Startflag:

		# Recieve ID and kombinate them
		for Counter in range(13):
		
			Zeichen = UART.read() 
			Datensatz = Datensatz + str(Zeichen)
			
		# Deleting 0x03
		Datensatz = Datensatz.replace(Endflag, "" );
		
		# Calculate Checksum
		for I in range(0, 9, 2):
			Checksumme = Checksumme ^ (((int(Datensatz[I], 16)) << 4) + int(Datensatz[I+1], 16))
		
		# Recieving Tag
		Tag = ((int(Datensatz[1], 16)) << 8) + ((int(Datensatz[2], 16)) << 4) + ((int(Datensatz[3], 16)) << 0)
		Tag = hex(Tag)
	
		# Check Checksum
		Checksumme_Tag = ((int(Datensatz[10], 16)) << 4) + (int(Datensatz[11], 16))
		if Checksumme_Tag == Checksumme:
			Check = 1
		else:
			check = 0
		
		# Convert recieved ID from a String to an Integer
		ID = Datensatz[4:10]
		ID = int(ID, 16)
		
		# Search User
		User = Liste.get(ID, "Unknown")

	if Check == 1:
		# Print Data
		print "------------------------------------------"
		print "Datensatz:", Datensatz
		print "Tag:", Tag
		print "ID:", ID
		print "User:", User
		print "Checksumme:", Checksumme
		print "------------------------------------------"
	else:
		print "Can´t read the Card"
		print "Try it again!"
	
Temp.close()
UART.close()