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

	# Read user input
	li a0, 0
	la a1, input
	li a2, input_len
	jal p4w_read

	# Write user input
	li a7, 64
	li a0, 1
	jal p4w_write

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
