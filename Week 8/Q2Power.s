#2. Power of a given umber using recursion
#int power (int a, int n)
#{ 
#    if (n == 1) 
#	return a;
#    return a * power(n - 1);
#}
#main() 
#{  
#  pow = power(a, n);
#}
.data
a1: .word 2
n1: .word 4
.text

power:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)
	li $t0, 1
	beq $a1, $t0, return_a
	addi $a1, $a1, -1
	jal power
	mul $v0, $v0, $a0
	lw $ra, 0($sp)	
	addiu $sp, $sp, 4
	jr $ra

return_a:
	move $v0, $a0
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

main:	
	lw $a0, a1
	lw $a1, n1
	jal power # $a0 -> a $a1 -> n
	move $a0, $v0
	li $v0, 1 # syscall 1 -> print_int
	syscall
	li $v0, 10 # Exit
	syscall