# Do not use pseudo instructions
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

	ori $t0, $zero, 4
	mult $a0, $t0 # x*4
	mflo $s0
	addi $s0, -8 # y = x*4-8
	sw $s0, 4($sp)
	ori $t0, $zero, 16
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

	ori $s0, $zero, 24 #a
	sw $s0, 4($sp)
	or $a0, $s0, $zero
	jal function
	or $s1, $v0, $zero

	ori $v0, $zero, 4 #syscall 4 -> print_str
	la $a0, msg1
	syscall
	or $a0, $s1, $zero
	ori $v0, $zero, 1 #sysvall 1 -> print_int
	syscall

	sw $s1, 8($sp)
	lw $ra, 0($sp)
	ori $v0, $zero, 0
	addiu $sp, $sp, 12
	jr $ra	

main:
	jal mainFunction
	ori $v0, $zero, 10 # exit
	syscall