#3. Sum of N natural numbers using recursion 
#int RSum(int n) 
#{ 
#    if (n == 1) 
#        return 1; 
#    return n + RSum(n - 1); 
#}
#main() 
#{  
#  sum = RSum(n);
#}
.data
num: .word 5
.text

sum:
	addiu $sp, $sp, -8
	sw $ra, 0($sp)
	sw $a0, 4($sp)
	li $t0, 1
	beq $a0, $t0, return_1
	addi $a0, $a0, -1
	jal sum
	lw $ra, 0($sp)	
	lw $t0, 4($sp)
	add $v0, $v0, $t0
	addiu $sp, $sp, 8
	jr $ra

return_1:
	li $v0, 1
	lw $ra, 0($sp)
	addiu $sp, $sp, 8
	jr $ra

main:	
	lw $a0, num
	jal sum # $a0 -> n
	move $a0, $v0
	li $v0, 1 # syscall 1 -> print_int
	syscall
	li $v0, 10 # Exit
	syscall