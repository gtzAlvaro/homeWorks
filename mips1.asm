# Author:	Alvaro Gutierrez Arce
# Date: 	2-16-19
# Description:	multiply and add, recursive

.data
vector1: .word 1 2 3	#vector in memory
vector2: .word 6 7 8	#vector in memory
result: .word 0		#vector in memory

.text
main:
	li $t1, 0
	li $v0, 0
	la $s0, vector1
	la $s1, vector2
	li $s2, 0
	
for:
	slti $t0, $s2, 12	#if s2 is less than 12, set t0 to 1, it will repeat only 3 times
	beq $t0, $zero, exit	#after the third time jump to exit
	add $t1, $s2, $s0	#load the array index from first vector into t1
	lw $a0, 0($t1)		#use it as an argmuent for function mulAccu
	add $t1, $s2, $s1	#load the array index from second vector into t1
	lw $a1, 0($t1)		#use it as an argument for function mulAccu
	jal mulAccu		#calling function mulAccu
	addi $s2, $s2, 4	#add four to load the correct address to a0 and a1
	j for

mulAccu:
	mult $a0, $a1
	mflo $a0		#recover the result, and use it as an argument for accu
	sw $ra, 0($sp)		#load program memory into stack for later use
	jal accu		#calling function accu
	lw $ra, 0($sp)		#recover program memory
	jr $ra			#retun to main

accu:
	add $v0, $v0, $a0
	jr $ra			#return to mulAccu
	
exit:
	