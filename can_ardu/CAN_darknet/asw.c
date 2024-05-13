#include "bsw.h"
unsigned char len;
unsigned long id;
unsigned char buf[8];
#include <stdint.h>


ISR2(TimerISR)
{
    IncrementCounter(counter1);

}



unsigned short class_id, count;
float accuracy, x_center, y_center;


TASK(Task1) {
	
	if(CAN_checkMsg() == CAN_MSGAVAIL)
	{
		CAN_readMsg(&id, &len, buf);
		/*============================ Fill your code to receive data ==============================*/
		
		








		
		printfSerial("----------------------------------\n");
		printfSerial("Get data from ID : %x \n", id);
		printfSerial("Class_id = %u, Accuracy = %.2f, X_center = %.2f, Y_center = %.2f, Count = %u",class_id,accuracy,x_center,y_center,count);
		printfSerial("\n");
	}


	TerminateTask();
};


