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



unsigned short class_id, count;
float accuracy, x_center, y_center;


TASK(Task1) {
	
	if(CAN_checkMsg() == CAN_MSGAVAIL)
	{
		/*============================ Fill your code to receive data ==============================*/
		
		CAN_readMsg(&id, &len, buf);
		
		if(id == 0x123){
			class_id = (buf[0] << 8) + buf[1];
			accuracy = ((buf[2] << 8) + buf[3]) / 10.0f;
			x_center = buf[4] / 100.0f;
			y_center = buf[5] / 100.0f;
			if(buf[7]==0){
				count = buf[6];
			}
			else{
				count = (buf[7] << 8) + buf[6];
			}
		}
		printfSerial("----------------------------------\n");
		printfSerial("Get data from ID : %x \n", id);
		printfSerial("Class_id = %u, Accuracy = %.2f, X_center = %.2f, Y_center = %.2f, Count = %u",class_id,accuracy,x_center,y_center,count);
		printfSerial("\n");
	}


	TerminateTask();
};


