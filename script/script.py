import serial
import time
import re

regex = r"[0-9]{2,3}"
port = serial.Serial('/dev/ttyACM0',115200)
output = open("log/log.dat",w)
text=""

while True:
	rcv = port.readline()
	if rcv == "Start to initializa the proess\n":
		print rcv
		text+=rvc
	if rcv == "Your data are been sent\r\n":
		print "+++++++++++++++++++++++++++++++++++++++++++++++\n"
		output.write(text)
		break

print "closing of the file...\n"
output.close()
port.close()
print "parsing of the data...\n"

input = open("log/log.dat","r")
text = input.read()
value = re.search(regex,text).group(0)

print "the value is: {val}".format(val = value)

