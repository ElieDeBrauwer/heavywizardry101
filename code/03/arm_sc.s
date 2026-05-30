    .text
    .globl _start

_start:
	mov r7, #11     @ SYS_execve

	ldr r0, =msg	@ Command
	mov r1, #0      @ No environment
	mov r2, #0      @ No arguments

	svc #0
msg:
    .asciz "/bin/true"
