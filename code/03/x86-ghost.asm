	global _start

_start:
    mov rax, 87         ; SYS_unlink = 87
	lea rdi, [rel path]  ; pathname = path
	syscall             ; (SYS_write = rax(1), fd = rdi (1), buf = rsi (msg), count = rdx (13))

    ;; Exit program
    mov rax, 0x3c       ; SYS_exit = 0x3c
    mov rdi, 0          ; status = 0
    syscall             ; (SYS_exit = rax (0x3c), status = rdi (0))

path:
    db 'x86_64-ghost'
