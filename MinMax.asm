                                                                                                                                                                                                                            .data

mensagem: .asciiz " "

.text
.globl main
main:
	#Scan do Inteiro desejado
	li $v0, 5
	syscall
	la $s2, ($v0)

	#int i = 0
	move $s1, $zero
	
loop:
	#printf i
	li $v0, 1
	la $a0, ($s1)
	syscall
	#impressão do espaço
	li $v0, 4
	la $a0, mensagem
	syscall
	#i++
	addi $s1, $s1, 1
	#Condição de Parada
	bne $s2, $s1, loop
	
