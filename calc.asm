.data
.text
.globl main
main:  
    li $v0, 12
    li $t1, 0
    syscall
    
loop:
    addi $t1, $t1, 1
    beq $t1, $v0, sum
    addi $t1, $t1, 1
    beq $t1, $v0, subt
    addi $t1, $t1, 1
    beq $t1, $v0, multp
    addi $t1, $t1, 1
    beq $t1, $v0, divd
    j fim
    
sum:
	li $v0, 6
	syscall
	lw $t1, 0($f0)
	li $v0, 6
	syscall
	lw $t2, 0($f0)
	add $f12, $t1, $t2
	li $v0, 2
	syscall
	j fim
	
subt:
	li $v0, 6
	syscall
	lw $t1, 0($f0)
	li $v0, 6
	syscall
	lw $t2, 0($f0)
	sub $f12, $t1, $t2
	li $v0, 2
	syscall
	j fim

multp:
	li $v0, 6
	syscall
	lw $f12, 0($f0)
	li $v0, 6
	syscall
	lw $t2, 0($f0)
	mult  $f12, $t2
	mflo $f12
	li $v0, 2
	syscall
	j fim
	
divd:
	li $v0, 6
	syscall
	lw $t1, 0($f0)
	li $v0, 6
	syscall
	lw $t2, 0($f0)
	div   $f12, $t1, $t2
	li $v0, 2
	syscall
    j fim          
fim:  
    li $v0, 10             # Encerra o programa
    syscall