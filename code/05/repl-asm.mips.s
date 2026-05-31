	.text
	.globl __start
__start:
    # Write prompt
	li $a0, 1
	la $a1, prompt
	li $a2, len
	jal p4w_write

    # Read input
	li $a0, 0
	la $a1, input
	li $a2, input_len
	jal p4w_read

	# Write input again
	move $a2, $v0
	li $a0, 1
	la $a1, input
	jal p4w_write

    # Compare to q
	lb $t0, 0($a1)
	beq $t0, 113, done

	j __start
	
done:
    # Exit
	move $a0, $zero
	jal p4w_exit

prompt:
        .asciz "$ "
	len = . - prompt

.data

input:
	.fill 1024
input_end = . - 1
input_len = 1024
