#include "bsw.h"


ISR2(TimerISR)
{
    IncrementCounter(counter1);
}

uint16_t counter = 0;


TASK(Task1) {

	struct can_msg send_msg = {0};

	///////////////////////write below/////////////////////////

	send_msg.id = ;
	unsigned char len = ;
	send_msg.len = len;

	uint16_t c_id = ;
	uint16_t acc = ;
	uint8_t x_center = ;
	uint8_t y_center = ;
	uint16_t count = counter;

	unsigned char buf_send[8];

	buf_send[0] = ( >> ) & 0xff;
	buf_send[1] = ( >> ) & 0xff;

	buf_send[2] = ( >> ) & 0xff;
	buf_send[3] = ( >> ) & 0xff;

	buf_send[4] = ( >> ) & 0xff;

	buf_send[5] = ( >> ) & 0xff;

	buf_send[6] = ( >> ) & 0xff;
	buf_send[7] = ( >> ) & 0xff;

	////////////////////////////////////////////////////////////
	send_msg.buf = buf_send;

	printfSerial("--------------------------------------------------\n");
	printfSerial("Send Status(1 or 0) : %d\n",CAN_sendMsg(send_msg));
	printfSerial("Send data ID : 0x%02x ",send_msg.id);
	printfSerial("Length : %d\n",send_msg.len);
	

	printfSerial("\n");


	counter++;
	TerminateTask();
};

