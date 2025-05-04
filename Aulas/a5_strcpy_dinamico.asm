		.data
		.align 0
str_src:	.asciz "Sarita é muito legal"
		
		.align 2
p:		.word # ponteiro
		.text
		.align 2
		.globl main

main:		# Conta o número de caracteres t1: contador
		li t1, 0
		la s0, str_src
		
loop_contar:	lb t0, 0(s0)
		addi, s0, s0, 1 # Avança o endereço
		addi t1, t1, 1 # Incrementa o contador
		bne t0, zero, loop_contar
		
		# Alocação dinâmica
		li a7, 9
		add a0, t1, zero # Parâmetro: quantidade de bytes
		ecall #a0 : endereço do primeiro byte reservado na heap
		
		# Armazenar o endereço do primeiro byte alocado na posição do ponteiro
		la t2, p
		sw a0, 0(t2)	
		
		la s0, str_src
		la t2, p 
		lw s1, 0(t2) # Lê a palavra a em t2, ou seja, p
		
loop_copiar:	lb t0, 0(s0)
		sb t0, 0(s1)
		addi s0, s0, 1
		addi, s1, s1, 1
		bne t0, zero, loop_copiar
		
		# Printa
		li a7, 4
		la a0, str_src
		ecall
		
		# Move o endereço para t2 e o seu conteúdo para a0
		la t2, p
		sw a0, 0(t2)
		ecall
		
		li a7, 10
		ecall
		