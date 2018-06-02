# SUOMI
Smart guide for your spa experience.

SUOMI is a software that guide users of a wellness center in the best possible journey using IoT.  
Developed by Federico Guidi, Roberto Falconi and Salvatore Licitra for Pervasive Systems course by Professor Ioannis Chatzigiannakis of MSc in Engineering in Computer Science at Sapienza, University of Rome.  

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
- https://www.slideshare.net/RobertoFalconi4/suomi-final-product
  
Pervasive Systems 2018:  
- http://ichatz.me/Site/PervasiveSystems2018  
  
Other links:  
- https://github.com/FedericoGuidi  
- https://github.com/SalvatoreLicitra  

# Abstract
Seven people die from stress every two seconds. What do anxiety, panic attacks, depression, coronary heart disease, high blood pressure, fears, phobias, irritable bowel, fibromyalgia, ulcers, self-destructive habits like overeating, and others all have in common?

They are all either caused by or made worse by STRESS! Our idea is to reduce stress level. What is the best way to do this if not with a spa?

According to Bruce Becker, MD, immersing yourself in water in general up to your neck gives you a cardiac workout; Mayo Clinic researcher Thomas Allison PhD, did a study that shows that sitting in a spa bath can lower your blood pressure.

Many people in the spas and wellness centers do wrong journey and are afraid to use some room.

SUOMI lets a spa owner to turn a spa into a smart one for better results, thanks to microcontrollers connected to a software that will help spa users to make for them decisions about wellness journey.

So, SUOMI turns an old spa into a smart one. How? SUOMI will be a “smart guide” that will help a spa customer to maximize its benefit and to avoid dangerous practices.

# Existing solutions and competitors
In the [initial concept](https://www.slideshare.net/RobertoFalconi4/suomi-initial-concept-user-evaluation) SUOMI has been compared with some competitors and existing solutions to reduce stress (such as spa staffers, medical doctors, wellness advisors, practice etc.) based on reliability, competence, availability in spa and non-invasiveness parameters.

# Development process
To develop a sophisticated software like the SUOMI one, we used many services: Skype meetings, Dropbox file organization, Google Form questionnaires, Visual Studio 2017 coding, GitHub version control, Microsoft Office docs, myBalsamiq Mockups, Draw.io diagrams, LinkedIn, SlideShare and YouTube sharing.

# Questionnaires and interviews to users
To get most possible users’ propensity and to listen to users’ desires, we made Google Form questionnaires which results will be analyzed in the [user evaluation](https://www.slideshare.net/RobertoFalconi4/suomi-initial-concept-user-evaluation).

# Mockups
In manufacturing and design, a mockup, or mock-up, is a scale or full-size model of a design or device, used for teaching, demonstration, design evaluation, promotion and other purposes
A mockup is a prototype if it provides at least part of the functionality of a system and enables testing of a design.

Using myBalsamiq, we have made mockups. In the [MVP step](https://www.slideshare.net/RobertoFalconi4/suomi-mvp-step) it is shown how to login, insert your data, book for a service and enjoy the spa.

# The software architecture
SUOMI is coded in .NET Frameworks using C# with Visual Studio 2017 and it is designed to implement a three layer software architecture: User Interface (ASP.NET Web Application), Business Logic (intermediate layer) and Data Access (the layer connected to the DBMS). Then, there is another layer, called the Business Entity, connected to all the other layers and where the objects' classes are implemented.

To implement the DBMS we used Microsoft SQL Server Management Studio (aka SSMS) which is linked to the software using ADO.NET.

# How to run SUOMI
To run the project we suggest you to clone the repository and open the .sln project inside the SUOMI directory using Visual Studio 2017.
Then, run the .bacpac DB using SSMS and remember to change the path inside the code.
Now ensure that SUOMI.UI is setted as starting project in the solution and run it with F5, the project will run with the Login page. Do the Login or the registration of a new account and procede compiling the form. Click on the button in the HTML form to turn on Nucleo and procede with the following instructions.

# Nucleo's code
The core of the application is the PulseSensor SEN-11574, the sensor maded by PulseSensor.com which translates a light signal to an hearte rate value with your finger, the sensor is connected to the STM32 NUCLEO-F401RE board. 
The idea is to calculate more values and to return the average one, we consider a good value the one between 50 and 120 (in other case we discard it); when the sensor elaborate a prefixed number of measurings, the led switch on to notify the end of the process, and nucleo send the result over the serial port (obviously the web app and the board need to use the same port and the same frequency). Now we have two options: accept the result (blue button) or discard it and restart the measuration (black button). In both cases we store all the data in a log file that we can examine whenever we want to.
When we accept the result, it is captured by a function that places it on the heart rate field of the form.

There is also a python script which is just a way to test the connection and to try the nucleo's code, the script print some information during the computation, store the result over a log file and also return the value on screen

# How to compile the Nucleo's code
To develop the nucleo's code we used os.mbed, which is an online compiler that generate the binary file, we suggest you to use the same environment and to import on your compiler the code which you can find on the [Mbed repository](https://os.mbed.com/users/salvolicitra/code/SUOMI/).


