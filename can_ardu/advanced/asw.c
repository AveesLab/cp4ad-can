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
		
		CAN_readMsg(&id, &len, buf);
		
		if(id == 0x123){
            short_1 = (buf[0] << 8) + buf[1];
     		short_2 = (buf[2] << 8) + buf[3];
	    	int_1 = ((uint32_t)buf[4] << 24) + ((uint32_t)buf[5] << 16) + ((uint32_t)buf[6] << 8) + (uint32_t)buf[7];
		}
		printfSerial("----------------------------------\n");
		printfSerial("Get data from ID : %x \n", id);
		printfSerial("Short_1 = %u, Short_2 = %u, int_1 = %lu",short_1,short_2,int_1);
		printfSerial("\n");
		uint32_t sum = (uint32_t)short_1 + (uint32_t)short_2 + int_1;
		printfSerial("Sum = %lu\n", sum);
		/*=========================== Fill your code to send the sum to Orin nano =====================*/
	    
		sum_buf[0] = sum >> 24;
		sum_buf[1] = sum >> 16;
		sum_buf[2] = sum >> 8;
		sum_buf[3] = sum;

		CAN_sendMsg(0x456, 8, sum_buf);
	}


	TerminateTask();
};


