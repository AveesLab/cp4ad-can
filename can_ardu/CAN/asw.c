#include "bsw.h"
unsigned char len;
unsigned long id;
unsigned char buf[8];



ISR2(TimerISR)
{
    IncrementCounter(counter1);
}



TASK(Task1) {

	if(CAN_checkMsg() == CAN_MSGAVAIL) {
		CAN_readMsg(&id, &len, buf);
		printfSerial("--------------------------------------------------\n");
		printfSerial("Get data from ID : %x \n",id);
		for (int i = 0; i < len; i++) {
		    printfSerial("%x    ", buf[i]);

		}
		printfSerial("\n");
	}


	TerminateTask();
};

