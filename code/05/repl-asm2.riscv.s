.text
	.globl _start
	# Has to be defined before being used
	.equ input_len, 1024
_start:
	# Show prompt
	li  a0, 1  # stdout
	la  a1, prompt
	li  a2, 2
	jal p4w_write

    # Initialise buffer
    # Set proper registers for read syscall
    la a1, input
    li a2, input_len
    add t0, a1, a2
l0:
    add t0, t0, -8
    sd zero, (t0)
    beq t0,a1,l0_end
    j l0

l0_end:
	# Read user input
	li a0, 0
	la a1, input
	li a2, input_len
	jal p4w_read

	# Write user input
	li a7, 64
	li a0, 1
	jal p4w_write

    # check command
    lb t0, 0(a1)
    li t1, 113
    beq t0, t1, done

	# Repeat
	j _start

done:
    jal p4w_exit

prompt:
        .asciz "$ "
	len = . - prompt

.data

input:
	.fill 1024
	input_end = . - 1
