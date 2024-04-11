#include "bsw.h"
unsigned char len;
unsigned long id;
unsigned char buf[8];
unsigned char sum_buf[8];
#include <stdint.h>


ISR2(TimerISR)
{
    IncrementCounter(counter1);

}



unsigned short short_1, short_2;
uint32_t int_1;


TASK(Task1) {
	
	if(CAN_checkMsg() == CAN_MSGAVAIL)
	{
		/*============================ Fill your code to receive data ==============================*/
		
		



		
		printfSerial("----------------------------------\n");
		printfSerial("Get data from ID : %x \n", id);
		printfSerial("Short_1 = %u, Short_2 = %u, int_1 = %lu",short_1,short_2,int_1);
		printfSerial("\n");

		
		printfSerial("Sum = %lu\n", sum);
		/*=========================== Fill your code to send the sum to Orin nano =====================*/





		
	}


	TerminateTask();
};


