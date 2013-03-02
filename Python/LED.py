import RPi.GPIO as GPIO
import time
from pizypwm import *

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(26, GPIO.OUT)

pwm = PiZyPwm(100, 26, GPIO.BOARD)

pwm.start(5)
