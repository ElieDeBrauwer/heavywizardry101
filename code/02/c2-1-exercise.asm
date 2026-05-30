	global _start
_start:
	mov rdi, 11
	mov rbx, 31
	add rdi,rbx
	mov rax, 0x3c
	syscall
