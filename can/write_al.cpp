/* A simple SocketCAN example */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <fcntl.h>
#include <net/if.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/ioctl.h>
#include <linux/can.h>
#include <linux/can/raw.h>

#include <time.h>

int soc;
int read_can_port;
int open_port(const char *port)
{
    struct ifreq ifr;
    struct sockaddr_can addr;
    /* open socket */
    soc = socket(PF_CAN, SOCK_RAW, CAN_RAW);
    if (soc < 0) {
	    printf("error!");
        return (-1);
    }
    addr.can_family = AF_CAN;
    strcpy(ifr.ifr_name, port);
    if (ioctl(soc, SIOCGIFINDEX, &ifr) < 0) {
	    printf("error!");
        return (-1);
    }
    addr.can_ifindex = ifr.ifr_ifindex;
    fcntl(soc, F_SETFL, O_NONBLOCK);
    if (bind(soc, (struct sockaddr *)&addr, sizeof(addr)) < 0) {
	    printf("binding error!");
        return (-1);
    }

    return 0;
}



void write_port()
{

    srand(time(NULL));
    unsigned short short_1, short_2;
    unsigned int int_1;
    short_1 = rand() % 65535;
    short_2 = rand() % 65535;
    int_1 = rand() % 4294967295;

    /*============== Fill your code to write data =================*/







	

    
    ssize_t nbytes1 = write(soc, &frame, sizeof(struct can_frame));

    printf("-------------------------------------------\n");
    printf("Send data to can bus\n");
    printf("message ID: %x\n", frame.can_id);
    printf("Short_1 =  %u, Short_2 =  %u, Int_1 = %u\n", short_1, short_2, int_1);
    if (nbytes1 < 1) {
	    printf("send error!\n");
    }

}
int close_port()
{
	close(soc);
	return 0;
}
int main(void)
{
 
	open_port("can0");
    while (60) {
        sleep(2);
    	write_port();
    }	
    close_port();
    
    return 0;
}
