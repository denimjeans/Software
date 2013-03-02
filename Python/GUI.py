import Tkinter, tkMessageBox

root = Tkinter.Tk()

def Ok():
	tkMessageBox.showinfo("Ok", "Hallo Welt!")

W = Tkinter.Label(root, text = "Bitte druecken!")
Ok = Tkinter.Button(root, text = "Ok", command = Ok)

W.pack()
Ok.pack()

# Endlosschleife
root.mainloop()