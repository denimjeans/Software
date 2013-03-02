import smbus
import time
 
def Set_Clock():
	Bus.write_byte(0x56, 8)
	Bus.write_byte(0x56, 40)

def BCD2D(Wert):
	return Wert % 16 + 10 * (Wert / 16)	 

Date = []

# I2C Adressen
RV3029 = 0x56

# I2C Bus 0 oeffnen
Bus = smbus.SMBus(0)
#Set_Clock()
	
Date = []
for Counter in range(8, 15):

	# I2C Device auslesen
	Bus.write_byte(RV3029, Counter) 
	Register = Bus.read_byte(RV3029)
	Register = BCD2D(Register)
	Date.append(Register)

print "Sekunden:	", Date[0]
print "Minuten: 	", Date[1]
print "Stunden: 	", Date[2]
print "Tag: 		", Date[3]
print "Wochentag: 	", Date[4]
print "Monat: 		", Date[5]
print "Jahr: 		20" + str(Date[6])
