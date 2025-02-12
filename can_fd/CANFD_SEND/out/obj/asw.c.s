	.file	"asw.c"
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
	.section	.text.TimerISR,"ax",@progbits
.global	TimerISR
	.type	TimerISR, @function
TimerISR:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	ldi r24,0
	jmp IncrementCounter
	.size	TimerISR, .-TimerISR
	.section	.rodata.FuncTask1.str1.1,"aMS",@progbits,1
.LC0:
	.string	"--------------------------------------------------\n"
.LC1:
	.string	"%d\n"
.LC2:
	.string	"[NM]: frame id: %16x length: %d send_message: "
.LC3:
	.string	" %x"
.LC4:
	.string	"\n"
	.section	.text.FuncTask1,"ax",@progbits
.global	FuncTask1
	.type	FuncTask1, @function
FuncTask1:
	push r10
	push r11
	push r12
	push r13
	push r14
	push r15
	push r16
	push r17
	push r28
	push r29
	in r28,__SP_L__
	in r29,__SP_H__
	sbiw r28,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
/* prologue: function */
/* frame size = 8 */
/* stack size = 18 */
.L__stack_usage = 18
	lds r15,len
	mov r24,r15
	ldi r25,0
	call malloc
	mov r16,r24
	mov r13,r25
	mov r12,r24
	mov r30,r24
	mov r31,r25
	ldi r17,0
.L3:
	cpse r15,r17
	rjmp .L4
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	call printfSerial
	std Y+1,r17
	ldi r24,lo8(64)
	mov r19,r24
	std Y+2,r24
	std Y+3,__zero_reg__
	std Y+4,__zero_reg__
	std Y+5,__zero_reg__
	mov r23,r16
	std Y+6,r16
	std Y+7,r13
	mov r18,r17
	ldi r20,0
	ldi r21,0
	ldi r22,0
	mov r24,r13
	ldd r25,Y+8
	call CAN_sendMsg
	push __zero_reg__
	push r24
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	call printfSerial
	push __zero_reg__
	push r17
	push __zero_reg__
	push __zero_reg__
	push __zero_reg__
	ldi r24,lo8(64)
	push r24
	ldi r24,lo8(.LC2)
	ldi r25,hi8(.LC2)
	push r25
	push r24
	call printfSerial
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	mov r14,r16
	mov r15,r13
	ldi r24,lo8(.LC3)
	mov r10,r24
	ldi r24,hi8(.LC3)
	mov r11,r24
.L5:
	mov r24,r14
	sub r24,r12
	cp r24,r17
	brlo .L6
	ldi r24,lo8(.LC4)
	ldi r25,hi8(.LC4)
	push r25
	push r24
	call printfSerial
	mov r24,r16
	mov r25,r13
	call free
	pop __tmp_reg__
	pop __tmp_reg__
/* epilogue start */
	adiw r28,8
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	jmp TerminateTask
.L4:
	st Z+,r17
	subi r17,lo8(-(1))
	rjmp .L3
.L6:
	movw r30,r14
	ld r24,Z+
	movw r14,r30
	push __zero_reg__
	push r24
	push r11
	push r10
	call printfSerial
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	rjmp .L5
	.size	FuncTask1, .-FuncTask1
.global	len
	.section	.data.len,"aw",@progbits
	.type	len, @object
	.size	len, 1
len:
	.byte	16
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
