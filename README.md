# SUOMI
Smart guide for your spa experience.

SUOMI is a software that guide users of a wellness center in the best possible journey using IoT.  
Developed for Pervasive Systems course of MSc in Engineering in Computer Science at Sapienza, University of Rome.  

# Nucleo's code
The core of the application is the PulseSensor SEN-11574, the sensor maded by PulseSensor.com which translate a light signal to an hearte rate value with your finger, the sensor is connected to the stm32 NucleoF401RE board. 
The idea is to calculate more values and to return the average one, we consider a good value the one between 50 and 120 (in other case we discard it); when the sensor elaborate a prefixed number of measurings, the led switch on to notify the end of the process, and nucleo send the result over the serial port (obviously the web app and the board need to use the same port and the same frequency). Now we have two options: accept the result (blue button) or discard it and restart the measuration (black button). In both cases we store all the data in a log file that we can examine whenever we want.
When we accept the result, it is captured by a function that places it on the heart rate field of the form.

There is also a python script which is just a way to test the connection and to try the nucleo's code, the script print some information during the computation, store the result over a log file and also return the value on screen

# How to compile the code
To develop the nucleo's code I used os.mbed, which is an online compiler that generate the binary file, I suggest you to use the same environment and to import on your compiler the code which you can find on my repository: https://os.mbed.com/users/salvolicitra/code/SUOMI/

# Useful links
LinkedIn profiles:  
- https://www.linkedin.com/in/roberto-falconi  
- https://www.linkedin.com/in/federico-guidi  
- https://www.linkedin.com/in/salvatorelicitra  
   
GitHub repository:  
- https://github.com/RobertoFalconi/SUOMI  

Mbed repository:
- https://os.mbed.com/users/salvolicitra/code/SUOMI/
  
SlideShare presentations:  
- https://www.slideshare.net/RobertoFalconi4/suomi-initial-concept-user-evaluation  
- https://www.slideshare.net/RobertoFalconi4/suomi-mvp-step  
  
Pervasive Systems 2018:  
- http://ichatz.me/Site/PervasiveSystems2018  
  
Other links:  
- https://github.com/FedericoGuidi  
- https://github.com/SalvatoreLicitra  
