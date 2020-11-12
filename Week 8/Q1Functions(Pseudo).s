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
.data 
a1: .word 24
b1: .word space 4
msg1: .asciiz "b = "

.text 

function:
	addi $sp, $sp, -8
	sw $ra, 4($sp)

	li $t0, 4
	mul $s0, $a0, $t0 # x*4
	addi $s0, -8 # y = x*4-8
	li $t0, 16
	div $s0, $t0
	mflo $s0 # z =y/16 
	sw $s0, 0($sp)

	lw $s0, 0($sp)
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	move $v0, $s0
	jr $ra


main:
	lw $a0, a1
	jal function
	move $t0, $v0
	sw $v0, b1
	li $v0, 4 # syscall 4 (print_str) 
	la $a0, msg1
	syscall
	lw $a0, b1
	move $a0, $t0
	li $v0, 1 # syscall 1 (print_int)
	syscall
	li $v0, 10 # exit
	syscall