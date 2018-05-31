using System;
using System.Diagnostics;
using System.IO;
using System.IO.Ports;
using System.Runtime.InteropServices;
using System.Text.RegularExpressions;

namespace SerialPort_Test
{
    public class HeartRatePulseSensor
    {

        public static string LeggiValore(string regex, SerialPort mySerialPort)
        {
            String testo, text = "";
            StreamWriter logfile = new StreamWriter("C:\\Users\\R.Falconi\\source\\repos\\SUOMI\\SUOMI.STM32\\log.txt");
            while (true)
            {
                testo = mySerialPort.ReadLine();
                System.Diagnostics.Debug.WriteLine(testo);
                logfile.WriteLine(testo);
                if (testo.Equals("Start to inizialize the process"))
                {
                    text = "";
                }
                text += testo;
                if (testo.Equals("Your data are been sent\r"))
                {
                    System.Diagnostics.Debug.WriteLine("+++++++++++++++++++++++++++++++++++++++++++++++");
                    logfile.Close();
                    break;
                }
            }
            System.Diagnostics.Debug.WriteLine("parsing of the data...");
            String value = Regex.Match(text, regex).ToString();
            System.Diagnostics.Debug.WriteLine("the value is: {0} ", value);
            System.Diagnostics.Debug.WriteLine("Press a key to continue...");
            return value;
        }

        static void Main(string[] args)
        {
            
        }
    }
}