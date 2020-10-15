#Write a MIPS Program to reverse a string.
.data
string1: .asciiz "This is a random string"
string2: .space 256
.text

main:  
	la $s0, string1
	li $t0, 0#count

loop1:
	lb $t1, 0($s0)
	beq $t1, $zero, exit1
	addi $s0, $s0, 1
	addi $t0, $t0, 1
	j loop1

exit1:
	la $s0, string1
	la $s1, string2
	add $s0, $s0, $t0
	addi $s0, $s0, -1
loop2:
	lb $t1, 0($s0)
	sb $t1, 0($s1)
	beq $t0, $zero, exit2
	addi $s0, $s0, -1
	addi $s1, $s1, 1
	addi $t0, $t0, -1
	j loop2

exit2:
	li $v0, 4 # syscall 4 (print_str)
    la $a0, string2 # argument: string
	syscall 
	li $v0, 10      # 
	syscall         #