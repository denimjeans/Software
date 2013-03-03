import serial
import sys

UART = serial.Serial("/dev/ttyAMA0", 9600)
UART.open()
UART.write("Anzahl an Argumente:" + str(len(sys.argv)) + "\n\r")
UART.write("Argumente:" + str(sys.argv) + "\n\r")
UART.close()