#include "ee.h"
#include "Arduino.h"
#include "bsw.h"
#include <avr/io.h>
#include <avr/interrupt.h>
//can
#include <SPI.h>
#include "lib/ACAN2517FD/ACAN2517FD.h"

#define LEN_BUF 128
#define TIMER1_US	10000U	
#define SET_BPS 125UL * 1000UL
DataBitRateFactor dataBitRate = DataBitRateFactor::x1;

ACAN2517FD CAN(9,SPI, 2);

void Remote_callback(const CANFDMessage &msg);

static unsigned char ticks=0;

byte begin() {

    ACAN2517FDSettings settings (ACAN2517FDSettings::OSC_20MHz, SET_BPS, dataBitRate);
	printfSerial("set speed: %ld kbps\n",SET_BPS/1000UL);
	printfSerial("set message frame speed: x%d\n",(int)dataBitRate);
    settings.mRequestedMode = ACAN2517FDSettings::NormalFD;
	settings.mDriverTransmitFIFOSize = 1 ;
  	settings.mDriverReceiveFIFOSize = 1 ;

	// set filter for 0x0ff
    ACAN2517FDFilters filters;
    filters.appendFrameFilter(kStandard, 0x0ff, Remote_callback);

	const uint32_t errorCode = CAN.begin (settings, [] { CAN.isr () ; },filters) ;
    return errorCode;
}

// check msg buffer and call callback-function
byte callbackRoutine(void)
{
	return CAN.dispatchReceivedMessage(nullptr);
}

//callback for remote frame
void Remote_callback(const CANFDMessage &msg) {
 
    printfSerial("[ID 0x011] Respond Now " );

	// eclare msg
    can_msg callback_msg = {0};

	// requested msg
    callback_msg.id = 0x011;
    callback_msg.len = 8;
    unsigned char* buf_send=(unsigned char*)malloc(sizeof(unsigned char) * callback_msg.len);
    for(int i = 0; i<callback_msg.len ; i++)
    {
        buf_send[i]=ticks; //sample data
    }
    callback_msg.buf = buf_send;
    CAN_sendMsg(callback_msg);

	//free memory
    free(buf_send);
    ticks++;

	printfSerial("\n");
	
}

byte CAN_sendMsg(can_msg msg)
{
	
	CANFDMessage message;
    message.id = msg.id;
	message.len = msg.len;
    memcpy(message.data, msg.buf, message.len);

    return CAN.tryToSend(message);

}

byte CAN_checkMsg()
{
	return CAN.available();
}

byte CAN_readMsg(can_msg *msg)
{
    CANFDMessage message;
    if (!CAN.available()) return false;
    CAN.receive(message);
    msg->id = message.id;
    msg->len = message.len;
    msg->buf = (byte*)malloc(msg->len);
    if (!msg->buf) {
        printfSerial("Memory allocation failed in CAN_readMsg\n");
        return false;
    }
    memcpy(msg->buf, message.data, msg->len); 
    return true;
}

void padding(struct can_msg *msg, int start_idx, int end_idx)
{
	for(;start_idx<=end_idx;start_idx++)
	{
		msg->buf[start_idx]=0;
	}
}

void mdelay(unsigned long delay_ms)
{
	unsigned long prev_ms = millis(), current_ms = millis();
	unsigned long period_ms = 20, cnt = 0;
	while (cnt < (delay_ms / period_ms)) {
		current_ms = millis();
		if (current_ms - prev_ms >= period_ms) {
			cnt++;
			prev_ms = millis();
		}
	}
}
void printfSerial(const char *fmt, ... )
{
    char buf[LEN_BUF];
    va_list args;
    va_start (args, fmt );
    vsnprintf(buf, LEN_BUF, fmt, args);
    va_end (args);
    Serial.print(buf);
}

 /* extern "C" */

void loop(void)
{
	;
}

void setup(void)
{
	Serial.begin(115200);

	SPI.begin();
	printfSerial("let's serial\n");
	int errorcode;
	while (CAN_OK != (errorcode=begin())) {
		printfSerial("init fail\n error code: ");
		printfSerial("%d\n",errorcode);
	}
	OsEE_atmega_startTimer1(TIMER1_US);
	printfSerial("CAN init\n");
	printfSerial("--------------------------------------------------\n");
}

#define  _BV(bit) (1 << (bit))	// <<--
int main(void)
{
	PORTC = _BV(PC0); // PC0 == PA0
	PCICR = _BV(PCIE1);   //PCIE1
	PCMSK1 = _BV(PCINT8);  //PCINT8
	EIFR = 0xff;
	sei();

	init();

#if defined(USBCON)
	USBDevice.attach();
#endif
	
	setup();



	StartOS(OSDEFAULTAPPMODE);	/* never returns */

	return 0;
}
