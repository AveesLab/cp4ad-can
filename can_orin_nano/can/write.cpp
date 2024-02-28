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
int open_port(const char* port)
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
    if (bind(soc, (struct sockaddr*)&addr, sizeof(addr)) < 0) {
        printf("binding error!");
        return (-1);
    }

    return 0;
}


void write_port()
{
    int s1[8] = {0,};
    srand(time(NULL));
    /*=============Define data frame=============*/ 
    struct can_frame frame;	
    frame.can_id = 0x123;
    frame.can_dlc = 8;


    printf("Enter 8 numbers 0~255 \n");
    /*=============== Write data ===============*/
    for (int i = 0; i < frame.can_dlc; i++) {
        scanf("%d", &s1[i]);
        frame.data[i] = s1[i];        
    }
    /*==============Send data================*/
	ssize_t nbytes = write(soc, &frame, sizeof(struct can_frame));
	if (nbytes < 1) {
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
    while (60)
    {
        sleep(2);
    	write_port();
    }
    close_port();
    return 0;
}
