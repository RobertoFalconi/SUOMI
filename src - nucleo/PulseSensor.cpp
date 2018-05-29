#include "PulseSensor.h"

PulseSensor::PulseSensor(){}

PulseSensor::PulseSensor(PinName analogPin, void (*printDataCallback)(char,int), int callbackRateMs)
{
    _started = false;
    
    _pAin = new AnalogIn(analogPin);
    
    _callbackRateMs = callbackRateMs;
    
    _printDataCallback = printDataCallback;
}


PulseSensor::~PulseSensor()
{
    delete _pAin;
}


void PulseSensor::process_data_ticker_callback(void)
{
    _printDataCallback('S', Signal);     //  Processing the raw Pulse Sensor data
    if (QS == true) { // Quantified Self flag is true when a heartbeat is found
        //fadeRate = 255;                  // Set 'fadeRate' Variable to 255 to fade LED with pulse
        _printDataCallback('B',BPM);   // send heart rate with a 'B' prefix
        _printDataCallback('Q',IBI);   // send time between beats with a 'Q' prefix
        QS = false;                      // reset the Quantified Self flag for next time
    }
}


void PulseSensor::sensor_ticker_callback(void)
{
    Signal = 1023 * _pAin->read();              // read the Pulse Sensor
    
    
    sampleCounter += 4;                         // keep track of the time in mS with this variable
    int N = sampleCounter - lastBeatTime;       // monitor the time since the last beat to avoid noise

    //  find the peak and trough of the pulse wave
    if(Signal < thresh && N > (IBI/5)*3) {      // avoid dichrotic noise by waiting 3/5 of last IBI
        if (Signal < T) {                       // T is the trough
            T = Signal;                         // keep track of lowest point in pulse wave
        }
    }

    if(Signal > thresh && Signal > P) {         // thresh condition helps avoid noise
        P = Signal;                             // P is the peak
    }                                        // keep track of highest point in pulse wave

    //  NOW IT'S TIME TO LOOK FOR THE HEART BEAT
    // signal surges up in value every time there is a pulse
    if (N > 250) {                                  // avoid high frequency noise
        if ( (Signal > thresh) && (Pulse == false) && (N > (IBI/5)*3) ) {
            Pulse = true;                               // set the Pulse flag when we think there is a pulse
            //digitalWrite(blinkPin,HIGH);                // turn on pin 13 LED
            IBI = sampleCounter - lastBeatTime;         // measure time between beats in mS
            lastBeatTime = sampleCounter;               // keep track of time for next pulse

            if(firstBeat) {                        // if it's the first time we found a beat, if firstBeat == TRUE
                firstBeat = false;                 // clear firstBeat flag
                return;                            // IBI value is unreliable so discard it
            }
            if(secondBeat) {                       // if this is the second beat, if secondBeat == TRUE
                secondBeat = false;                 // clear secondBeat flag
                for(int i=0; i<=9; i++) {        // seed the running total to get a realisitic BPM at startup
                    rate[i] = IBI;
                }
            }

            // keep a running total of the last 10 IBI values
            long runningTotal = 0;                   // clear the runningTotal variable

            for(int i=0; i<=8; i++) {               // shift data in the rate array
                rate[i] = rate[i+1];              // and drop the oldest IBI value
                runningTotal += rate[i];          // add up the 9 oldest IBI values
            }

            rate[9] = IBI;                          // add the latest IBI to the rate array
            runningTotal += rate[9];                // add the latest IBI to runningTotal
            runningTotal /= 10;                     // average the last 10 IBI values
            BPM = 60000/runningTotal;               // how many beats can fit into a minute? that's BPM!
            QS = true;                              // set Quantified Self flag
            // QS FLAG IS NOT CLEARED INSIDE THIS ISR
        }
    }

    if (Signal < thresh && Pulse == true) {    // when the values are going down, the beat is over
        Pulse = false;                         // reset the Pulse flag so we can do it again
        amp = P - T;                           // get amplitude of the pulse wave
        thresh = amp/2 + T;                    // set thresh at 50% of the amplitude
        P = thresh;                            // reset these for next time
        T = thresh;
    }

    if (N > 2500) {                            // if 2.5 seconds go by without a beat
        thresh = 530;                          // set thresh default
        P = 530;                               // set P default
        T = 530;                               // set T default
        lastBeatTime = sampleCounter;          // bring the lastBeatTime up to date
        firstBeat = true;                      // set these to avoid noise
        secondBeat = true;                     // when we get the heartbeat back
    }
}


bool PulseSensor::start()
{
    if (_started == false)
    {
        sampleCounter = 0;
        lastBeatTime = 0;
        P =530;
        T = 530;
        thresh = 530;
        amp = 100;
        firstBeat = true;
        secondBeat = true;
        
        BPM=0;
        Signal=0;
        IBI = 600;
        Pulse = false;
        QS = false;
        
        _pulseSensorTicker.attach(this, &PulseSensor::sensor_ticker_callback, ((float)_sensorTickRateMs/1000));
        _processDataTicker.attach(this, &PulseSensor::process_data_ticker_callback,  ((float)_callbackRateMs/1000));
        _started = true;
        return true;
    }
    else
    {
        return false;
    }
}

bool PulseSensor::stop()
{
    if(_started == true)
    {
        _pulseSensorTicker.detach();
        _processDataTicker.detach();
        _started = false;
        return true;
    }
    else
    {
        return false;
    }
}