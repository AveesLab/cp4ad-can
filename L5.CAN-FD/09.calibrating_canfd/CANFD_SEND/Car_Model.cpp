#include <math.h>   
#include <stdint.h>  
#include "Car_Model.h"
#include "bsw.h"

struct input car_input = {
    .steer = 0,
    .pan_power = 0,
    .throttle_position = 0,
    .gear_position = 0
};

int32_t target_yaw = 0;
int32_t base_yaw = -50;

int32_t target_temp = 18;
int32_t base_temp = 45;

int32_t target_rpm = 4000;
int32_t base_rpm = 1500;


static int32_t saturate(int32_t val, int32_t min_val, int32_t max_val) {
    if (val < min_val) return min_val;
    if (val > max_val) return max_val;
    return val;
}



int32_t control_yaw(int32_t steer) {

    steer = saturate(steer, -100, 100);
    int32_t rate = (steer * 20) / 100;  
    base_yaw += rate;
    base_yaw = saturate(base_yaw, -360, 360);
    
    printfSerial("steer: %ld\n", steer);
    return base_yaw;
}

int32_t control_temperature(int32_t pan_power) {
  
    pan_power = saturate(-1*pan_power, 0, 100);
    printfSerial("pan_power: %ld\n", pan_power);
    
    if (pan_power == 0) {

        int32_t delta = (45 - base_temp) / 10;  
        base_temp += delta;
    } else {

        int32_t cooling_effect = (pan_power * 3) / 50;
        base_temp -= cooling_effect;
    }
    
    base_temp = saturate(base_temp, -40, 150);
    return base_temp;
}

int32_t control_rpm(int32_t throttle_position, int32_t gear_position) {
    throttle_position = saturate(throttle_position, 0, 100);
    gear_position = saturate(gear_position, 1, 6);



    printfSerial("throttle: %ld, gear: %ld\n", throttle_position, gear_position);
    

    int32_t base_rpm_table[6] = {3500, 3000, 2500, 2000, 1500, 1200};

    int32_t additional_rpm = throttle_position * 10/(7 - gear_position);

    int32_t desired_rpm = base_rpm_table[gear_position - 1] + additional_rpm;

    

    if (throttle_position == 0) {
        base_rpm -= 50 * (7 - gear_position);
    } else {

        base_rpm = desired_rpm;
    }
    

    base_rpm = saturate(base_rpm, 0, desired_rpm + 1000);
    return base_rpm;
}