#Author:	Alvaro Gutierrez Arce
#Date:		2-17-19
#Description:	exponential

.data

.text
	li $a0, 5		#parameter that indicates the power
	li $t0, 2		#base number two
	li $t1, 1
	jal power		#call function power
	j exit

power:
	ble $a0, $t1, last	#when exponent reaches one, return number 2
	sw $ra, 0($sp)		#store return address in stack pointer
	addi $sp, $sp, -4	#decrease stack to save next address
	subi $a0, $a0, 1	#decrease exponent
	jal power		#call power again
	addi $sp, $sp, 4	#increase stack to jump to last call to fcuntion power
	lw $ra, 0($sp)		#load address of last call to function power
	mult $v0, $t0		#multiply by two the last result
	mflo $v0	
	jr $ra			#jump to last call to function power
last:
	li $v0, 2		#return number 2
	jr $ra			#jump to last call of function power

exit:
	
