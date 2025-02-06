#include "bsw.h"

unsigned char len =16;


ISR2(TimerISR)
{
    IncrementCounter(counter1);
}



TASK(Task1) {

	// if(CAN_checkMsg() == true) {
		
	// 	printfSerial("--------------------------------------------------\n");
	// 	bool temp=CAN_readMsg(&id, &len, buf);
	// 	printfSerial("%d\n",temp);
	// 	printfSerial("Get data from ID : %x \n",id);
	// 	for (int i = 0; i < len; i++) {
	// 	    printfSerial("%x    ", buf[i]);

	// 	}
	// 	printfSerial("\n");
	// }
	
	can_fd_msg send_msg;
	msg.id = 0x040;
	msg.len = len;
	unsigned char* buf_send=(unsigned char*)malloc(sizeof(unsigned char)*len);
	for(unsigned char i=0; i<len; i++)
	{
		buf_send[i]=i;
	}
	memcpy(send_msg.buf,buf_send,len);
	


	printfSerial("--------------------------------------------------\n");
	printfSerial("%d\n",CAN_sendMsg(send_msg););
	printfSerial("[NM]: frame id: %16x length: %d send_message: ",send_msg.id,send_msg.len);
	for(unsigned char i=0; i<send_msg.len;i++)
	{
		printfSerial(" %x",send_msg.buf[i]);
	}
	printfSerial("\n")



	TerminateTask();
};

