##include <stdio.h>
#int function(int x){
#    int y = x*4-8;
#    int z=y/16;
#    return z;
#}

#int main_function(){
#    int a = 24, b;
#    b = function(a);
#    printf("b = %d", b);
#    return 0;
#}
# Return assignments are as follows:
# In main functions a=$s0, b=$s1
# In function y=$s0, z=$s1
# Arguments are stored in $a0
# Return value is stored in $v0
.data 
msg1: .asciiz "b = "

.text 

function:
	addiu $sp, $sp, -12
	sw $ra, 0($sp)

	li $t0, 4
	mul $s0, $a0, $t0 # x*4
	addi $s0, -8 # y = x*4-8
	sw $s0, 4($sp)
	li $t0, 16
	div $s0, $t0
	mflo $s1 # z =y/16 
	sw $s1, 8($sp)

	lw $ra, 0($sp)
	lw $v0, 8($sp)
	addiu $sp, $sp, 12
	jr $ra

mainFunction:
	addiu $sp, $sp, -12
	sw $ra, 0($sp)

	li $s0, 24 #a
	sw $s0, 4($sp)
	move $a0, $s0
	jal function
	move $s1, $v0

	li $v0, 4 #syscall 4 -> print_str
	la $a0, msg1
	syscall
	move $a0, $s1
	li $v0, 1 #sysvall 1 -> print_int
	syscall

	sw $s1, 8($sp)
	lw $ra, 0($sp)
	li $v0, 0
	addiu $sp, $sp, 12
	jr $ra	

main:
	jal mainFunction
	li $v0, 10 # exit
	syscall