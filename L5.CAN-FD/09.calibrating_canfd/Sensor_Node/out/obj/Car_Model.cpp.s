	.file	"Car_Model.cpp"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.section	.rodata.control_yaw.str1.1,"aMS",@progbits,1
.LC1:
	.string	"steer: %ld\n"
	.section	.text.control_yaw,"ax",@progbits
.global	control_yaw
	.type	control_yaw, @function
control_yaw:
	push r12
	push r13
	push r14
	push r15
/* prologue: function */
/* frame size = 0 */
/* stack size = 4 */
.L__stack_usage = 4
	movw r12,r22
	movw r14,r24
	ldi r18,101
	cp r12,r18
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brlt .L2
	ldi r25,lo8(100)
	mov r12,r25
	mov r13,__zero_reg__
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L2:
	ldi r24,-100
	cp r12,r24
	ldi r24,-1
	cpc r13,r24
	cpc r14,r24
	cpc r15,r24
	brge .L3
	ldi r24,lo8(-100)
	mov r12,r24
	clr r13
	dec r13
	mov r14,r13
	mov r15,r13
.L3:
	movw r24,r14
	movw r22,r12
	ldi r18,lo8(5)
	ldi r19,0
	ldi r20,0
	ldi r21,0
	call __divmodsi4
	lds r24,base_yaw
	lds r25,base_yaw+1
	lds r26,base_yaw+2
	lds r27,base_yaw+3
	add r24,r18
	adc r25,r19
	adc r26,r20
	adc r27,r21
	cpi r24,105
	ldi r18,1
	cpc r25,r18
	cpc r26,__zero_reg__
	cpc r27,__zero_reg__
	brlt .L4
	ldi r24,lo8(104)
	ldi r25,lo8(1)
	ldi r26,0
	ldi r27,0
.L4:
	cpi r24,-104
	ldi r18,-2
	cpc r25,r18
	ldi r18,-1
	cpc r26,r18
	cpc r27,r18
	brge .L5
	ldi r24,lo8(-104)
	ldi r25,lo8(-2)
	ldi r26,lo8(-1)
	ldi r27,lo8(-1)
.L5:
	sts base_yaw,r24
	sts base_yaw+1,r25
	sts base_yaw+2,r26
	sts base_yaw+3,r27
	push r15
	push r14
	push r13
	push r12
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	call printfSerial
	lds r22,base_yaw
	lds r23,base_yaw+1
	lds r24,base_yaw+2
	lds r25,base_yaw+3
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
/* epilogue start */
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.size	control_yaw, .-control_yaw
	.section	.rodata.control_temperature.str1.1,"aMS",@progbits,1
.LC2:
	.string	"pan_power: %ld\n"
	.section	.text.control_temperature,"ax",@progbits
.global	control_temperature
	.type	control_temperature, @function
control_temperature:
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
/* prologue: function */
/* frame size = 0 */
/* stack size = 8 */
.L__stack_usage = 8
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
	cp __zero_reg__,r22
	cpc __zero_reg__,r23
	cpc __zero_reg__,r24
	cpc __zero_reg__,r25
	brlt .L7
	cpi r22,-100
	ldi r18,-1
	cpc r23,r18
	cpc r24,r18
	cpc r25,r18
	brge .+2
	rjmp .L13
	clr r12
	clr r13
	movw r14,r12
	sub r12,r22
	sbc r13,r23
	sbc r14,r24
	sbc r15,r25
.L7:
	push r15
	push r14
	push r13
	push r12
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	call printfSerial
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	lds r8,base_temp
	lds r9,base_temp+1
	lds r10,base_temp+2
	lds r11,base_temp+3
	cp r12,__zero_reg__
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	breq .+2
	rjmp .L8
	ldi r22,lo8(45)
	ldi r23,0
	ldi r24,0
	ldi r25,0
	sub r22,r8
	sbc r23,r9
	sbc r24,r10
	sbc r25,r11
	ldi r18,lo8(10)
	ldi r19,0
	ldi r20,0
	ldi r21,0
	call __divmodsi4
	add r8,r18
	adc r9,r19
	adc r10,r20
	adc r11,r21
.L14:
	sts base_temp,r8
	sts base_temp+1,r9
	sts base_temp+2,r10
	sts base_temp+3,r11
	lds r22,base_temp
	lds r23,base_temp+1
	lds r24,base_temp+2
	lds r25,base_temp+3
	cpi r22,-105
	cpc r23,__zero_reg__
	cpc r24,__zero_reg__
	cpc r25,__zero_reg__
	brlt .L10
	ldi r22,lo8(-106)
	ldi r23,0
	ldi r24,0
	ldi r25,0
.L10:
	cpi r22,-40
	ldi r18,-1
	cpc r23,r18
	cpc r24,r18
	cpc r25,r18
	brge .L11
	ldi r22,lo8(-40)
	ldi r23,lo8(-1)
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
.L11:
	sts base_temp,r22
	sts base_temp+1,r23
	sts base_temp+2,r24
	sts base_temp+3,r25
/* epilogue start */
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	ret
.L13:
	ldi r24,lo8(100)
	mov r12,r24
	mov r13,__zero_reg__
	mov r14,__zero_reg__
	mov r15,__zero_reg__
	rjmp .L7
.L8:
	ldi r26,lo8(3)
	ldi r27,0
	movw r20,r14
	movw r18,r12
	call __muluhisi3
	ldi r18,lo8(50)
	ldi r19,0
	ldi r20,0
	ldi r21,0
	call __divmodsi4
	sub r8,r18
	sbc r9,r19
	sbc r10,r20
	sbc r11,r21
	rjmp .L14
	.size	control_temperature, .-control_temperature
	.section	.rodata.control_rpm.str1.1,"aMS",@progbits,1
.LC3:
	.string	"throttle: %ld, gear: %ld\n"
	.section	.rodata
.LC0:
	.byte	-84
	.byte	13
	.byte	0
	.byte	0
	.byte	-72
	.byte	11
	.byte	0
	.byte	0
	.byte	-60
	.byte	9
	.byte	0
	.byte	0
	.byte	-48
	.byte	7
	.byte	0
	.byte	0
	.byte	-36
	.byte	5
	.byte	0
	.byte	0
	.byte	-80
	.byte	4
	.byte	0
	.byte	0
	.section	.text.control_rpm,"ax",@progbits
.global	control_rpm
	.type	control_rpm, @function
control_rpm:
	push r4
	push r5
	push r6
	push r7
	push r8
	push r9
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,28
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 28 */
/* stack size = 42 */
.L__stack_usage = 42
	movw r4,r22
	movw r6,r24
	movw r10,r24
	movw r8,r22
	ldi r24,101
	cp r4,r24
	cpc r5,__zero_reg__
	cpc r6,__zero_reg__
	cpc r7,__zero_reg__
	brlt .L16
	ldi r22,lo8(100)
	mov r8,r22
	mov r9,__zero_reg__
	mov r10,__zero_reg__
	mov r11,__zero_reg__
.L16:
	sbrs r11,7
	rjmp .L17
	mov r8,__zero_reg__
	mov r9,__zero_reg__
	movw r10,r8
.L17:
	movw r12,r18
	movw r14,r20
	ldi r25,7
	cp r12,r25
	cpc r13,__zero_reg__
	cpc r14,__zero_reg__
	cpc r15,__zero_reg__
	brlt .L18
	ldi r18,lo8(6)
	mov r12,r18
	mov r13,__zero_reg__
	mov r14,__zero_reg__
	mov r15,__zero_reg__
.L18:
	cp __zero_reg__,r12
	cpc __zero_reg__,r13
	cpc __zero_reg__,r14
	cpc __zero_reg__,r15
	brlt .L19
	mov r12,__zero_reg__
	mov r13,__zero_reg__
	movw r14,r12
	inc r12
.L19:
	push r15
	push r14
	push r13
	push r12
	push r11
	push r10
	push r9
	push r8
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	push r25
	push r24
	call printfSerial
	ldi r24,lo8(24)
	ldi r30,lo8(.LC0)
	ldi r31,hi8(.LC0)
	movw r26,r28
	adiw r26,1
	0:
	ld r0,Z+
	st X+,r0
	dec r24
	brne 0b
	ldi r24,lo8(7)
	ldi r25,0
	ldi r26,0
	ldi r27,0
	movw r18,r24
	movw r20,r26
	sub r18,r12
	sbc r19,r13
	sbc r20,r14
	sbc r21,r15
	std Y+25,r18
	std Y+26,r19
	std Y+27,r20
	std Y+28,r21
	ldi r19,1
	sub r12,r19
	sbc r13,__zero_reg__
	sbc r14,__zero_reg__
	sbc r15,__zero_reg__
	lsl r12
	rol r13
	lsl r12
	rol r13
	ldi r20,lo8(1)
	ldi r21,0
	add r20,r28
	adc r21,r29
	add r12,r20
	adc r13,r21
	ldi r26,lo8(10)
	ldi r27,0
	movw r20,r10
	movw r18,r8
	call __muluhisi3
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	ldd r18,Y+25
	ldd r19,Y+26
	ldd r20,Y+27
	ldd r21,Y+28
	call __divmodsi4
	movw r30,r12
	ld r12,Z
	ldd r13,Z+1
	ldd r14,Z+2
	ldd r15,Z+3
	add r12,r18
	adc r13,r19
	adc r14,r20
	adc r15,r21
	cp __zero_reg__,r4
	cpc __zero_reg__,r5
	cpc __zero_reg__,r6
	cpc __zero_reg__,r7
	brge .+2
	rjmp .L20
	ldi r26,lo8(-50)
	ldi r27,lo8(-1)
	ldd r18,Y+25
	ldd r19,Y+26
	ldd r20,Y+27
	ldd r21,Y+28
	call __mulohisi3
	lds r8,base_rpm
	lds r9,base_rpm+1
	lds r10,base_rpm+2
	lds r11,base_rpm+3
	movw r26,r24
	movw r24,r22
	add r24,r8
	adc r25,r9
	adc r26,r10
	adc r27,r11
	sts base_rpm,r24
	sts base_rpm+1,r25
	sts base_rpm+2,r26
	sts base_rpm+3,r27
.L21:
	lds r8,base_rpm
	lds r9,base_rpm+1
	lds r10,base_rpm+2
	lds r11,base_rpm+3
	ldi r22,0
	ldi r23,0
	movw r24,r22
	sbrc r11,7
	rjmp .L22
	movw r24,r14
	movw r22,r12
	subi r22,24
	sbci r23,-4
	sbci r24,-1
	sbci r25,-1
	cp r8,r22
	cpc r9,r23
	cpc r10,r24
	cpc r11,r25
	brge .L22
	movw r24,r10
	movw r22,r8
.L22:
	sts base_rpm,r22
	sts base_rpm+1,r23
	sts base_rpm+2,r24
	sts base_rpm+3,r25
/* epilogue start */
	adiw r28,28
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop r7
	pop r6
	pop r5
	pop r4
	ret
.L20:
	sts base_rpm,r12
	sts base_rpm+1,r13
	sts base_rpm+2,r14
	sts base_rpm+3,r15
	rjmp .L21
	.size	control_rpm, .-control_rpm
.global	base_rpm
	.section	.data.base_rpm,"aw",@progbits
	.type	base_rpm, @object
	.size	base_rpm, 4
base_rpm:
	.byte	-36
	.byte	5
	.byte	0
	.byte	0
.global	target_rpm
	.section	.data.target_rpm,"aw",@progbits
	.type	target_rpm, @object
	.size	target_rpm, 4
target_rpm:
	.byte	-96
	.byte	15
	.byte	0
	.byte	0
.global	base_temp
	.section	.data.base_temp,"aw",@progbits
	.type	base_temp, @object
	.size	base_temp, 4
base_temp:
	.byte	45
	.byte	0
	.byte	0
	.byte	0
.global	target_temp
	.section	.data.target_temp,"aw",@progbits
	.type	target_temp, @object
	.size	target_temp, 4
target_temp:
	.byte	18
	.byte	0
	.byte	0
	.byte	0
.global	base_yaw
	.section	.data.base_yaw,"aw",@progbits
	.type	base_yaw, @object
	.size	base_yaw, 4
base_yaw:
	.byte	-50
	.byte	-1
	.byte	-1
	.byte	-1
.global	target_yaw
	.section	.bss.target_yaw,"aw",@nobits
	.type	target_yaw, @object
	.size	target_yaw, 4
target_yaw:
	.zero	4
.global	car_input
	.section	.bss.car_input,"aw",@nobits
	.type	car_input, @object
	.size	car_input, 16
car_input:
	.zero	16
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
.global __do_clear_bss
