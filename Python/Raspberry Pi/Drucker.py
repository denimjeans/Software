import serial
import sys
import time

# Serielle Schnittstelle oeffnen
UART = serial.Serial("/dev/ttyUSB0", 19200)
UART.open()

# Barcodetypen
# Barcode	Laenge			Bereich
# UPC-A 	11-12 Bytes		Bereich 0x30 - 0x39
# UPC-E		11-12 Bytes		Bereich 0x30 - 0x39
# EAN13		12-13 Bytes		Bereich 0x30 - 0x39
# EAN8 		7-8 Bytes		Bereich 0x30 - 0x39
# I25 		>1 Byte even Number 	Bereich 0x30 - 0x39
# CODE39 	>1 Byte 		0x20, 0x24, 0x25, 0x2B, 0x2D-0x39, 0x41-5A
# CODEBAR 	>1 Byte 		0x24, 0x2B, 0x2D-0x3A, 0x41-0x44
# CODE93	>1 Byte 		0x00-0x7F
# CODE128 	>1 Byte 		0x00-0x7F
# CODE11	>1 Byte 		0x30-0x39
# MSI 		>1 Byte 		0x30-0x39
UPCA = 0
UPCE = 1
EAN13 = 2
EAN8 = 3
CODE39 = 4
I25 = 5
CODEBAR = 6
CODE93 = 7
CODE128 = 8
CODE11 = 9
MSI = 10

# ------------------------------------------------------------------------
#				Drucker
# ------------------------------------------------------------------------

# Drucker initialisieren
# Buffer leeren
# Parameter auf Defaultwerte zuruecksetzen
# In den Standardmodus wechseln
# User-definierte Zeichen loeschen
def Init():

	UART.write(chr(27))
	UART.write(chr(64))
	return

# Testseite drucken
def PrintTestpage():

	UART.write(chr(18))
	UART.write(chr(84))

	return

# Standby auswaehlen
# Auswahl
# - Offline
# - Online
def Standby(Modus):
	
	if(Modus == "Offline"): 
		Value = 0
	elif(Modus == "Online"):
		Value = 1
	
	UART.write(chr(27))
	UART.write(chr(61))
	UART.write(chr(Value))

	return

# Drucker in Sleepmodus setzen
# WICHTIG: Der Drucker muss erst mittels "Wake()" geweckt werden, wenn er wieder benutzt werden soll
# Auswahl
# - Zeit von 0-255	
def Sleep(Zeit):

	if(Zeit > 255):
		print "Der Wert fuer die Zeit ist zu hoch!"
		return -1
	
	UART.write(chr(27))
	UART.write(chr(56))
	UART.write(chr(Zeit))
	
	return
	
# Drucker aufwecken
def Wake():

	UART.write(chr(255))
	time.sleep(0.1)
	return

# Pruefen ob der Drucker Papier hat (1 = kein Papier, 0 = Papier)
# Bit 3 -> 0 = Papier, 1 = kein Papier
def Paper():

	Status = 0
	
	UART.write(chr(27))
	UART.write(chr(118))
	UART.write(chr(0))
	
	# Zeichen einlesen
	Read = UART.read(UART.inWaiting())
	
	if(Read == chr(32)):
		Status = 0
	elif(Read == chr(36)):
		Status = 1
		
	return Status
	
# Heizzeit konfigurieren
# Auswahl
# - Anzahl der Heizpunkte von 0-255
# - Heizzeit von 3-255
# - Heizintervall 0-255
def ConfigHeat(Dots, Time, Intervall):

	if(Dots > 255):
		print "Anzahl der Heizpunkte zu hoch!"
		return -1
	if((Time < 3) or (Time > 255)):
		print "Ungueltige Angabe fuer die Heizzeit!"
		return -1
	if(Intervall > 255):
		print "Heizintervall zu hoch!"
		return -1	

	UART.write(chr(27))
	UART.write(chr(55))
	UART.write(chr(Dots))
	UART.write(chr(Time))
	UART.write(chr(Intervall))
	return
	
# Default Einstellungen fuer die Heizung
def DefaultHeat():

	UART.write(chr(27))
	UART.write(chr(55))
	UART.write(chr(7))
	UART.write(chr(80))
	UART.write(chr(2))
	
	return
	
# ------------------------------------------------------------------------
#				Character
# ------------------------------------------------------------------------
	
# Skipt eine bestimmte Anzahl Zeilen
def Feed(Anzahl):

	if(Anzahl > 255):
		print "Anzahl der Zeilen zu hoch!"
		return -1

	UART.write(chr(27))
	UART.write(chr(100))
	
	for Counter in range(Anzahl):
		UART.write(chr(12))

	return

# Druckt eine bestimmte Anzahl leerer Zeichen (max. 47)
def Blank(Anzahl):

	if(Anzahl > 47):
		print "Anzahl der Leerstellen zu hoch!"
		return -1

	UART.write(chr(27))
	UART.write(chr(66))
	UART.write(chr(Anzahl))
	
	return
	
# Drucken einer Zeile
def Println(Text):

	UART.write(Text)
	UART.write(chr(10))
	UART.write(chr(13))
	
	return

# Noch in Arbeit	
# Druckt ein Tab (8 leere Zeichen)
def Tab():
	
	UART.write(chr(9))
	return
	
# Linienstaerke einstellen:
# Auswahl
# - None
# - Middel	
# - Big
def Underline(Dicke):

	# Linienstaerke auswaehlen
	if(Dicke == "None"): 
		Value = 0
	elif(Dicke == "Middel"): 
		Value = 1
	elif(Dicke == "Big"):
		Value = 2
	else:
		return -1
	
	UART.write(chr(27))
	UART.write(chr(45))
	UART.write(chr(Value))

	return
	
# Deaktiviert das Unterstreichen vom Text
def DeleteUnderline():

	UART.write(chr(27))
	UART.write(chr(45))
	UART.write(chr(0))
	
	return

# Textmodus setzen
# Auswahl
# - Inverse
# - Updown
# - Bold
# - DoubleHeight
# - DoubleWidth
# - Deleteline	
def PrintMode(Mode):

	# Modus auswaehlen
	if(Mode == "Inverse"): 
		Value = 2
	elif(Mode == "Updown"): 
		Value = 4
	elif(Mode == "Bold"): 
		Value = 8
	elif(Mode == "DoubleHeight"): 
		Value = 16
	elif(Mode == "DoubleWidth"): 
		Value = 32
	elif(Mode == "Deleteline"): 
		Value = 64
	else:
		Value = 0

	UART.write(chr(27))
	UART.write(chr(33))
	UART.write(chr(Value))

	return

# Printmode zuruecksetzen
def DeletePrintMode():

	UART.write(chr(27))
	UART.write(chr(33))
	UART.write(chr(0))
	
	return

# Stellt den Abstand zwischen zwei Zeilen in Punkten ein
def SetLineSpace(Punkte):
	
	if(Punkte > 32):
		print "Anzahl der Punkte zu hoch!"
		return -1
		
	UART.write(chr(27))
	UART.write(chr(51))
	UART.write(chr(Punkte))
	
	return

# Setzt den Abstand zwischen zwei Zeilen auf den Default Wert (32 Punkte)
def SetLineDefault():

	UART.write(chr(27))
	UART.write(chr(50))

	return

# ------------------------------------------------------------------------
# 			Barcode
# ------------------------------------------------------------------------

# Noch in Arbeit	
# Einstellen der lesbaren Zeichen fuer den Barcode
# Auswahl
# - Above -> Ueber dem Barcode
# - Below -> Unter dem Barcode
# - Both -> Ueber und unter dem Barcode
def BarcodeReadable(Position):

	if(Position == "Above"):
		Value = 1
	elif(Position == "Below"):
		Value = 2
	elif(Position == "Both"):
		Value = 3
	else:
		Value = 0
		
	UART.write(chr(29))
	UART.write(chr(72))
	UART.write(chr(Value))
	
	return
	
# Einstellen der Barcode Breite
# Auswahl
# - Small
# - Big
def BarcodeWidth(Breite):
	
	if(Breite == "Small"):
		Value = 2
	elif(Breite == "Big"):
		Value = 3
	else:
		print "Ungueltige Angabe"
		return -1
	
	UART.write(chr(29))
	UART.write(chr(119))
	UART.write(chr(Value))
	
	return
	
# Hoehe des Barcodes (0 - 255)
def BarcodeHeight(Hoehe):

	if(Hoehe > 255):
		print "Die Hoehe ist zu hoch!"
		return -1
	
	UART.write(chr(29))
	UART.write(chr(104))
	UART.write(chr(Hoehe))
	
	return
	
# Barcode drucken
def PrintBarcode(Daten, Barcodetyp):

	UART.write(chr(29))
	UART.write(chr(107))
	UART.write(chr(Barcodetyp))
	
	for Counter in Daten:
		UART.write(Counter)
		
	UART.write(chr(00))

	return

# ------------------------------------------------------------------------
# 			Bitmap
# ------------------------------------------------------------------------
