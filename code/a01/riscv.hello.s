.text	
.globl _start

_start:
	li a7, 64
	li a0, 1
	la a1,msg
	li a2, 13
	ecall

	li a0,0
	li a7,93
	ecall
msg:
	.asciz "Hello World!\n"
