from xml.dom.minidom import *
import urllib

# Liste fuer den Wetterbericht
# 1. Dimension = heute, 2. Dimension = naechster Tag
# 1. Element = Tag, 2. Element = Datum, 3. = Niedrigste Temperatur, 4. Element = Hoechste Temperatur, 5. Element = Wettersituation
Wetter = [["", "", "", "", ""] , ["", "", "", "", ""]]

# URL oeffnen und XML Daten einlesen
Baum = urllib.urlopen('http://weather.yahooapis.com/forecastrss?w=675964').read()

# XML Daten parsen und in Baumstruktur anordnen
Baum = parseString(Baum)

# Ort einlesen
Ort = Baum.getElementsByTagName('yweather:location')[0]
Stadt = Ort.attributes["city"].value
Land = Ort.attributes["country"].value

# Datum einlesen
Datum = Baum.getElementsByTagName('lastBuildDate')[0].firstChild.data 

# Koordinaten auslesen
Geo_Lat = Baum.getElementsByTagName('geo:lat')[0].firstChild.data
Geo_Long = Baum.getElementsByTagName('geo:long')[0].firstChild.data
	
# Wetterdaten von heute einlesen
Today = Baum.getElementsByTagName('yweather:condition')[0]

# Wettertext einlesen
Wetterlage = Today.attributes["text"].value

# Temperatur in Fahrenheit einlesen, umrechnen und runden
Temperatur = float(Today.attributes["temp"].value)
Temperatur = round((Temperatur - 32.0) * (5.0 / 9.0) , 2)

# Daten in einer Liste speichern
for Counter in range(2):

	# Wetterdaten fuer die beiden Tage einlesen
	# Daten einlesen
	Future = Baum.getElementsByTagName('yweather:forecast')[Counter]
	
	# Daten verarbeiten
	Wetter[Counter][0] = Future.attributes["day"].value
	Wetter[Counter][1] = Future.attributes["date"].value	
	Wetter[Counter][2] = float(Future.attributes["low"].value)	
	Wetter[Counter][3] = float(Future.attributes["high"].value)
	Wetter[Counter][4] = Future.attributes["text"].value
	
	# Umrechnen der Temperatur in Grad Celsius
	Wetter[Counter][2] = round((Wetter[Counter][2] - 32.0) * (5.0 / 9.0) , 2)
	Wetter[Counter][3] = round((Wetter[Counter][3] - 32.0) * (5.0 / 9.0) , 2)

# Ausgabe
print ""	
print "Wetterbericht fuer " + Stadt + " in " + Land
print "Datum: " + Datum
print ""

print "Koordinaten"
print "Breitengrad: " + Geo_Lat
print "Laengengrad: " + Geo_Long
print ""

print "Wetter heute"
print "Temperatur: " + str(Temperatur) + " C Celsius"
print "Max. Temperatur: " + str(Wetter[0][2]) + " C Celsius"
print "Min. Temperatur: " + str(Wetter[0][3]) + " C Celsius"
print "Wettersituation: " + Wetterlage
print ""

print "Wetter am naechsten Tag"
print "Tag: " + Wetter[1][0]
print "Datum: " + Wetter[1][1]
print "Max. Temperatur: " + str(Wetter[1][2]) + " C Celsius"
print "Min. Temperatur: " + str(Wetter[1][3]) + " C Celsius"
print "Wetter: " + Wetter[1][4]
print ""
	
# Quelle angeben
Quelle = Baum.getElementsByTagName('link')[1].firstChild.data
print "Alle Daten stammen von " + Quelle