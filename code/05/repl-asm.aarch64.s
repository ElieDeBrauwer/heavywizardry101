	.text
	.globl _start
_start:

    # Write prompt
	mov x0, 1
	adr x1, prompt
	mov x2, len
	bl p4w_write

	# Read input
	mov x0, xzr
	ldr x1, =input
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
    # Exit call
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
