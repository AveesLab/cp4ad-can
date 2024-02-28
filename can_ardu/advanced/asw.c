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
		








		printfSerial("Short_1 = %u, Short_2 = %u, int_1 = %lu",short_1,short_2,int_1);
		printfSerial("\n");
		uint32_t sum = (uint32_t)short_1 + (uint32_t)short_2 + int_1;
		/*=========================== Fill your code to send the sum to TX2 =====================*/


		




	}


	TerminateTask();
};


