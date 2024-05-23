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
	sll $a0, $a0, 2
	jr $ra
	
fim:
	li $v0, 10             # Encerra o programa
    syscall
    
