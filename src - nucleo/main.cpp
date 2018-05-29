#include "mbed.h"
#include "PulseSensor.h"

Serial pc(USBTX, USBRX);
DigitalOut led(D12);
PulseSensor sensor;
InterruptIn button(USER_BUTTON);

int result;
int len = 20;
int t,j,x;
int myBPM;

void pressed(){
    pc.printf("Your data are been sent\r\n");
}
 
void sendDataToProcessing(char symbol, int data){
    if(symbol == 'B') {
        if(j<len){
            result = data<50?50:(data>120?120:data);
            //pc.printf("\rLoading");
            j++;
            //for(int i=0;i<(j%4);++i) pc.printf(" .");
            if(result<51 || result >119) x++;
            else    t+=result;
    
        }
        if(j==len){
            led = 1;
            myBPM=t/(len-x);
            pc.printf("\rYour average BPM are: %d\r\n[Black]\trestart the measurement\r\n[Blue]\tconfirm the data\r\n",myBPM);
            button.fall(&pressed);
            j++;
        }
    }    
}

int main() {
    pc.baud(115200);
    pc.printf("\r\n+++++++++++++++++++++++++++++++++++++++++++++++");    
    pc.printf("\r\nStart to inizialize the process\n");
    led=0;j=0;t=0;x=0;
    PulseSensor sensor(A0, sendDataToProcessing);
    while(1) {
        sensor.start();
    }
}
