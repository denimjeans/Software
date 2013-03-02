import RPi.GPIO as GPIO
import time
import os
from pizypwm import *

# Pin 26 als Ausgang deklarieren
GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(26, GPIO.OUT)

while True:
	# PWM mit 50Hz an Pin 26 starten
	Servo = PiZyPwm(50, 26, GPIO.BOARD)							

	# Richtungseingabe
	Eingabe = raw_input("Bitte treffen Sie Ihre Wahl: ") 

	# Richtung "Rechts"
	if(Eingabe == "r"):

		# Schrittweite eingeben
		Schritte = raw_input("Schrittweite: ") 
		print Schritte, "Schritte nach Rechts"
	
		# PWM mit 10% Dutycycle (2ms) generieren
		Servo.start(10)
		for Counter in range(int(Schritte)):
			time.sleep(0.01)
	
		# PWM stoppen
		Servo.stop()
		GPIO.cleanup()

	# Mittelstellung einnehmen
	elif(Eingabe == "m"):
		Servo.start(7)
		print "Drehung in die Mitte"
		time.sleep(1) 
		Servo.stop()
		GPIO.cleanup()
	
	# Richtung "Links"
	elif(Eingabe == "l"):
	
		# Schrittweite eingeben
		Schritte = raw_input("Schrittweite: ") 
		print Schritte, "Schritte nach Links"
		
		# PWM mit 5% Dutycycle (1ms) generieren
		Servo.start(5)
		for Counter in range(int(Schritte)):
			time.sleep(0.01)
		
		# PWM stoppen
		Servo.stop()
		GPIO.cleanup()
	
	# Programm beenden
	elif(Eingabe == "q"):
		print "Programm wird beendet......"
		os._exit(1)
		Servo.stop()
		GPIO.cleanup()
		
	# Ungueltige Eingabe
	else:
		print "Ungueltige Eingabe!"