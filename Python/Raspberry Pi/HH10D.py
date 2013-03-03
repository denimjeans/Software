#!/usr/bin/python

import smbus
import time
import RPi.GPIO as GPIO
import select

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

FOUT = 25										# Anschluss von FOUT des Sensors	

# GPIO als Eingang schalten
GPIO.setup(FOUT, GPIO.IN)

# Adresse
HH10D_EEPROM = 0x51									# I2C Adresse vom EEPROM des Sensors

# Variablen
# EEPROM-Werte
Sens = [0, 0]										# Variable fuer die Sensitivity (LSB, MSB)
Off = [0, 0]										# Variable fuer den Offset (LSB, MSB)
Sensitivity = 0										# Fertige Sensitivity (16-Bit)
Offset = 0										# Fertiger Offset (16-Bit)

# Frequenzmessung
Frequenz = 0.0										# Variable fuer die Frequenz
Start = 0.0										# Startzeit
Stop = 0.0										# Stopzeit
Differenz = 0.0										# Zeitdifferenz
Zyklen = 2000										# Anzahl der Messzyklen
Korrektur = 0.80									# Korrekturfaktor in % (abhaengig von den Messzyklen!)

# Berechnung
Feuchtigkeit = 0.0									# Variable fuer die Luftfeuchtigkeit

# I2C Bus 0 oeffnen
Bus = smbus.SMBus(0)

# Kalibrationswerte auslesen
Bus.write_byte(HH10D_EEPROM, 0x0A)							# Startadresse auf 10 einstellen
for Adresse in range(2):								# Beide Sensitivity Bytes auslesen
	Sens[Adresse - 1] = Bus.read_byte(HH10D_EEPROM)
	
for Adresse in range(2):								# Beide Offset Bytes auslesen
	Off[Adresse - 1] = Bus.read_byte(HH10D_EEPROM)
	
# Daten umwandeln
Sensitivity = Sens[0] + (Sens[1] << 8)
Offset = Off[0] + (Off[1] << 8)

# Periodenzeit ermitteln
Differenz = 0

for Counter in range(Zyklen):

	while GPIO.input(FOUT) == 0:							# Warten bis ein High-Pegel anliegt
		pass

        Start = time.time()								# Startzeit festhalten

        while GPIO.input(FOUT) == 1:							# Warten bis ein Low-Pegel anliegt
		pass

        Stop = time.time()								# Stopzeit festhalten
	Differenz = Stop - Start							# Differenz der Messzeit errechnen
	Frequenz = Frequenz + Differenz							# Gesamtdifferenz berechnen

# Frequenz ermitteln
Frequenz = Frequenz / Zyklen								# Durchschnittliche Differenz berechnen
Frequenz = Frequenz * 2									# Differenz auf einen kompletten Zyklus hochrechnen
Frequenz = 1 / Frequenz									# Differenz in eine Frequenz umrechnen

# Korrekturfaktor einrechnen
Frequenz = Frequenz * (1.0 + (Korrektur/100.0))		

# Luftfeuchtigkeit berechnen
Feuchtigkeit = Offset - round(int(Frequenz), 0)
Feuchtigkeit = Feuchtigkeit * (float(Sensitivity) / 4096)
Feuchtigkeit = round(Feuchtigkeit, 2)							# Ergebnis runden

	
print "Sens:" , Sensitivity
print "Offset:", Offset
print "Frequenz:", Frequenz
print "Feuchtigkeit:", Feuchtigkeit, "%"

GPIO.cleanup()



