	.text
	.globl _start
_start:
    # Write prompt
	mov x0, 1
	adr x1, prompt
	mov x2, len
	bl p4w_write
	ldr x1, =input

	# Initialize buffer
	mov x15, input_len / 8
ini0:	cbz x15, end0
	str xzr, [x1], 8
	sub x15, x15, 1
	b ini0

end0:	

	# Read input
	mov x0, xzr
	mov x2, input_len
	bl p4w_read

	# Write input
	mov x2, x0
	mov x0, 1
	bl p4w_write
	
	# Check for q
	ldrb w2, [x1]
	cmp w2, 113
	beq done

	b _start

done:
    # Exit
	mov x0, xzr 
	bl p4w_exit
	

prompt:
        .asciz "$ "
	len = . - prompt
	

.data

input:
	.fill 1024
input_end = . - 1
input_len = 1024
