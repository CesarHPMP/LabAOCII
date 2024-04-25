.data
operador: .word +, -, *, / #vetor e operadores
.text
.globl main
main:
    la $a0, operador         # Carrega o endereço base do vetor em $a0             
    lw $s0, 0($a0)       # Inicializa $s0 com o primeiro elemento do vetor (min = array[0])
    
    li $v0, 12
    li $t1, 0
    
loop:
    addi $t1, $t1, 1
    add  $t0, $s0, $t1
    bne  $v0, $t0, loop
    
    beq $t1, 0($s0), sum
    beq $t1, 1($s0), subt
    beq $t1, 2($s0), multp
    beq $t1, 3($s0), divd
    
sum:
	li $v0, 6
	lw $t1, 0($f0)
	li $v0, 6
	lw $t2, 0($f0)
	add $f12, $t1, $t2
	li $v0, 2
	j fim
	
subt:
	li $v0, 6
	lw $t1, 0($f0)
	li $v0, 6
	lw $t2, 0($f0)
	sub $f12, $t1, $t2
	li $v0, 2
	j fim

multp:
	li $v0, 6
	lw $f12, 0($f0)
	li $v0, 6
	lw $t2, 0($f0)
	mult  $f12, $t2
	li $v0, 2
	j fim
	
divd:
	li $v0, 6
	lw $t1, 0($f0)
	li $v0, 6
	lw $t2, 0($f0)
	div  $f12, $t1, $t2
	li $v0, 2
    j fim          
fim:  
    li $v0, 10             # Encerra o programa
    syscall