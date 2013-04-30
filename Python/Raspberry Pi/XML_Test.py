from xml.dom.minidom import *
import urllib

# Adresse einer XML-Datei
URL = "http://weather.yahooapis.com/forecastrss?w=675964"

# URL oeffnen und XML Daten einlesen
Baum = urllib.urlopen(URL).read()

# Ausgabe des XML-Baums
print Baum