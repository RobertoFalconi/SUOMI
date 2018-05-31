#include "mbed.h"
#include "PulseSensor.h"

Serial pc(USBTX, USBRX);
DigitalOut led(D12);
PulseSensor sensor;
InterruptIn button(USER_BUTTON);

int result;
int len = 20;
int values,count,trash;
int myBPM;

void pressed(){
    pc.printf("Your data are been sent\r\n");
}
 
void sendDataToProcessing(char symbol, int data){
    if(symbol == 'B') {
        if(count<len){
            result = data<50?50:(data>120?120:data);
            //pc.printf("\rLoading");
            count++;
            //for(int i=0;i<(j%4);++i) pc.printf(" .");
            if(result<51 || result >119) trash++;
            else    values+=result;
    
        }
        if(count==len){
            myBPM=values/(len-trash);
            if(myBPM == 0){//if the result is composed only 
                pc.printf("\rOps, something was wrong, I restart the measurement\r\n");
                 led=0;count=0;values=0;trash=0;
            }
            else{
                led = 1;
                pc.printf("\rYour average BPM are: %d\r\n[Black]\trestart the measurement\r\n[Blue]\tconfirm the data\r\n",myBPM);
                button.fall(&pressed);
                count++;
            }
        }
    }    
}

int main() {
    pc.baud(115200);
    pc.printf("\r\n+++++++++++++++++++++++++++++++++++++++++++++++");    
    pc.printf("\r\nStart to inizialize the process\n");
    led=0;count=0;trash=0;values=0;
    PulseSensor sensor(A0, sendDataToProcessing);
    while(1) {
        sensor.start();
    }
}
