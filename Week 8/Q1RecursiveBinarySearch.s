#1. Recursive binary search
#int bin_search(int A[], int data, int lo, int hi)
#{
#  int mid;
#  if (lo > hi) return -1
#  mid = (lo + high)/2;
#  if ( data == A[mid]) return mid
#  if ( data < A[mid]) return bin_search(A, data, lo, mid-1)
#  return bin_search(A, data, mid+1, high)
#}
.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
key: .word 10
length: .word 10
msg1: .asciiz "Element not found."
msg2: .asciiz "Element found at: "
.text

bin_search:
	addiu $sp, $sp, -4
	sw $ra, 0($sp)

	bgt $a2, $a3, return1 #  if (lo > hi)
	add $s0, $a2, $a3 # $s0 -> low + high
	li $t1, 2
	div $s0, $t1
	mflo $s0 # mid
	li $t1, 4
	mul $t2, $s0, $t1
	lw $t1, array($t2)
	beq $a1, $t1, return_mid
	blt $a1, $t1, return2

	move $a2, $s0
	addi $a2, $a2, 1
	jal bin_search
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
return1:
	li $v0, -1
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
return_mid:
	move $v0, $s0
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra
return2:
	addi $s0, $s0, -1
	move $a3, $s0
	jal bin_search
	lw $ra, 0($sp)
	addiu $sp, $sp, 4
	jr $ra

main:
	la $a0, array # load base address 
	lw $a1, key # key
	li $a2, 0 # a2 low
	lw $a3, length
	addi $a3, $a3, -1 # a3 high len(array)-1
	jal bin_search # $a0 -> base address $a1 => key $a2-> low $a3->high
	move $t0, $v0
	li $t1, -1
	beq $t0, $t1, notFound

	li $v0, 4
	la $a0, msg2
	syscall
	move $a0, $t0
	li $v0, 1
	syscall

	li $v0, 10 # Exit
	syscall
notFound:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 10 # Exit
	syscall