#ifndef PULSE_SENSOR_H
#define PULSE_SENSOR_H

#include "mbed.h"


/**
 * Class for interfacing with a http://pulsesensor.myshopify.com/ 'Pulse Sensor Amped'.
 * The contents of this class are based on the "Pulse Sensor Amped 1.1" Arduino Sketch.
 *
 * When using this class for the first time, it is recommended that you use the Processing 
 * GUI app available http://pulsesensor.myshopify.com/pages/code-and-guide. Using this, you
 * will easily be able to verify the operating of your sensor, and the integration of this
 * class into your mbed project. 
 */
 
class PulseSensor
{
    private:
        volatile int rate[10];                    // used to hold last ten IBI values
        volatile unsigned long sampleCounter;          // used to determine pulse timing
        volatile unsigned long lastBeatTime;           // used to find the inter beat interval
        volatile int P;                      // used to find peak in pulse wave
        volatile int T;                     // used to find trough in pulse wave
        volatile int thresh;                // used to find instant moment of heart beat
        volatile int amp;                   // used to hold amplitude of pulse waveform
        volatile bool firstBeat;        // used to seed rate array so we startup with reasonable BPM
        volatile bool secondBeat;       // used to seed rate array so we startup with reasonable BPM
        
        // these variables are volatile because they are used during the interrupt service routine!
        volatile int BPM;                   // used to hold the pulse rate
        volatile int Signal;                // holds the incoming raw data
        volatile int IBI;             // holds the time between beats, the Inter-Beat Interval
        volatile bool Pulse;        // true when pulse wave is high, false when it's low
        volatile bool QS;           // becomes true when a beat is found
    
    
        void (*_printDataCallback)(char,int);
        static const int _sensorTickRateMs = 2;
        int       _callbackRateMs;
        bool      _started;
        
        AnalogIn *_pAin;
        Ticker    _pulseSensorTicker;
        Ticker    _processDataTicker;
        
        void sensor_ticker_callback(void);
        void process_data_ticker_callback(void);
    
    public:
        /** PulseSensor Constructor - Note this does not start the reading of the sensor.
         * @param   analogPin Name of the analog pin that the sensor is connected to.
         * @param   printDataCallback Pointer to function which will be called to print the latest data. Output format available here: http://pulsesensor.myshopify.com/pages/code-and-guide
         * @param   callbackRateMs Rate at which the printDataCallback is to be called, recommended is 20ms for graphing of pulse signal.
         */
        PulseSensor(); 
        
        PulseSensor(PinName analogPin, void (*printDataCallback)(char,int), int callbackRateMs=20);
        
        /** Destructor */
        ~PulseSensor();
        
        /** Start reading the Pulse Sensor, and sending current readings to the print data callback.
         * @returns true if reading of the sensor is started, false if reading was aleady in progress.
         */
        bool start();
        
        /** Stops the current reading of the Pulse Senson.
         * @return true if reading is stopped, false if reading was already stopped.
         */
        bool stop();
};

#endif