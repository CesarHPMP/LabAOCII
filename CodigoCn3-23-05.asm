.data
.text
.globl main
main:  
	li $t0, 2
    
    li $v0, 5
    syscall
    move $s0, $v0
    
    li $v0, 5
    syscall
    move $s1, $v0
    
	sllv $t1, $t0, $s0
	mult $s1, $t1
	mflo $t1
	
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10             # Encerra o programa
    syscall