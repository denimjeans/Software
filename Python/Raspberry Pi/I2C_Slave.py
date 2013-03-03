#!/usr/bin/python

import smbus
import time
import os

# Adresse
PSoC_ADC = 0x40									# I2C Adresse vom PSoC ADC
PSoC_Cap = 0x41									# I2C Adresse vom PSoC CapSense
EEPROM = 0x50									# I2C Adresse vom EEPROM

# Variablen
Wert = [0, 0]
Spannung = 5.0									# Referenzspannung vom PSoC							
Aufloesung = 14									# Aufloesung des ADC
Ref = Spannung / (2**Aufloesung)						# Referenzspannung berechnen

while 1:
	# I2C Bus 0 oeffnen
	Bus = smbus.SMBus(0)	

	# EEPROM auslesen
	#Bus.write_byte(0x50, 0)							# Low Byte der Adresse
	#Bus.write_byte(0x50, 0)							# High Byte der Adresse
	#print "EEPROM: ", Bus.read_byte(0x50)
	
	# Daten lesen und in einer Liste zwischenspeichern
	for Adresse in range(2):
		Wert[Adresse - 1] = Bus.read_byte_data(PSoC_ADC, Adresse)


	# Daten vom CapSense holen
	#Bus.write_byte(PSoC_Cap, 0)
	#Button = Bus.read_byte(PSoC_Cap)
	#print "Es wurde Button", Button, "betaetigt!"
	
	# Daten umwandeln
	Voltage = Wert[0] + (Wert[1] << 8)
	Voltage = Ref * Voltage
	print "Spannung:", Voltage
	
	if Voltage < 2.5:
		print "Unterspannung!"
		os.system("shutdown -r now") 
		break
	
	# 1 Sekunde warten
	time.sleep(1)
	
