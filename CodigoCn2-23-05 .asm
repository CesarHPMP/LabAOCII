.data
.text
.globl main
wrap:

main:  
	li $a0, 3
	
    jal power2
    
    move $v0, $a0
    li $v0, 1
    syscall 
    j fim
    
power2:
	li $t0, 1
	sllv  $a0, $t0, $a0
	jr $ra
	
fim:
	li $v0, 10             # Encerra o programa
    syscall
    
