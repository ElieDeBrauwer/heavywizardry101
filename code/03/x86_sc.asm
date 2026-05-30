section .text
	global _start

_start:
	mov rax, 0x3b           ; SYS_execve
	lea rdi, [rel cmd]      ; Load command
	xor rsi, rsi            ; zero as argv
	xor rdx,rdx             ; zero as env
	syscall

cmd: db '/bin/true',0
