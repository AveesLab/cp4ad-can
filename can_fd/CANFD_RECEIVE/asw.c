#include "bsw.h"



ISR2(TimerISR)
{
    IncrementCounter(counter1);
}



TASK(Task1) {
	
	struct can_fd_msg receve_msg;

	
	if(CAN_checkMsg() == true) {
		
		printfSerial("--------------------------------------------------\n");
		CAN_readMsg(&receve_msg);
		printfSerial("Get data from ID : %x \n",receve_msg.id);
		for (int i = 0; i < receve_msg.len; i++) {
		    printfSerial("%x    ", receve_msg.buf[i]);

		}
		printfSerial("\n");
	}



	TerminateTask();
};

