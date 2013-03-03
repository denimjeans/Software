This Program reads out a file with the Name "ID.txt" and with the following Path:

/home/pi/Desktop/Sicherheit/

Then it recieve Data from the UART of the RFID-Module and compare them with the Data in the File "ID.txt".
If there is a match with the Card ID, the Program prints the Owner of the Card.
If there is no match it prints "Unknown".
Copy the "ID.txt" File to the given path and replace the Example with your Data.