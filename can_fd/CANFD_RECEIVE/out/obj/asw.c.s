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
	.string	"Get data from ID : %x \n"
.LC2:
	.string	"%x    "
.LC3:
	.string	"\n"
	.section	.text.FuncTask1,"ax",@progbits
.global	FuncTask1
	.type	FuncTask1, @function
FuncTask1:
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
/* stack size = 14 */
.L__stack_usage = 14
	call CAN_checkMsg
	cpi r24,lo8(1)
	brne .L3
	ldi r24,lo8(.LC0)
	ldi r25,hi8(.LC0)
	push r25
	push r24
	call printfSerial
	movw r24,r28
	adiw r24,1
	call CAN_readMsg
	ldd r24,Y+5
	push r24
	ldd r24,Y+4
	push r24
	ldd r24,Y+3
	push r24
	ldd r24,Y+2
	push r24
	ldi r24,lo8(.LC1)
	ldi r25,hi8(.LC1)
	push r25
	push r24
	call printfSerial
	in __tmp_reg__,__SREG__
	cli
	out __SP_H__,r29
	out __SREG__,__tmp_reg__
	out __SP_L__,r28
	ldi r17,0
	ldi r16,0
	ldi r24,lo8(.LC2)
	mov r14,r24
	ldi r24,hi8(.LC2)
	mov r15,r24
.L4:
	ldd r24,Y+1
	cp r24,r16
	cpc __zero_reg__,r17
	breq .+2
	brge .L5
	ldi r24,lo8(.LC3)
	ldi r25,hi8(.LC3)
	push r25
	push r24
	call printfSerial
	pop __tmp_reg__
	pop __tmp_reg__
.L3:
	call TerminateTask
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
	ret
.L5:
	ldd r30,Y+6
	ldd r31,Y+7
	add r30,r16
	adc r31,r17
	ld r24,Z
	push __zero_reg__
	push r24
	push r15
	push r14
	call printfSerial
	subi r16,-1
	sbci r17,-1
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	pop __tmp_reg__
	rjmp .L4
	.size	FuncTask1, .-FuncTask1
	.ident	"GCC: (GNU) 7.3.0"
.global __do_copy_data
