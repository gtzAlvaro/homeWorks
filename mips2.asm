#Author:	Alvaro Gutierrez Arce
#Date:		2-16-19
#Description:	switch case structure

.data

.text
main:
	li $a0, 5
	li $a1, 3
	li $s0, 1		#operation selctor
	
	slti $t0, $s0, 2	#if selector is equal to 1, then add
	beqz $t0, subb		
	jal addition
	j exit			#break
	
subb:
	slti $t0, $s0, 3	#if selector is equal to 2, then subtract
	beqz $t0, multt
	jal subtraction
	j exit			#break

multt:
	slti $t0, $s0, 4	#if selector is equal to 3, then multiply
	beqz $t0, default
	jal multiplication
	j exit			#break
	
default:
	jal andBitwise		#otherwise do andBitwise
	j exit			#break
	
addition:
	add $v0, $a0, $a1
	jr $ra			#return

subtraction:
	sub $v0, $a0, $a1
	jr $ra			#return

multiplication:
	mult $a0, $a1
	mflo $v0
	jr $ra			#return
	
andBitwise:
	and $v0, $a0, $a1	#return
	jr $ra
	
exit:
	