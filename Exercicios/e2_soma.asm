		.data
		.align 2
vetor:		.word 1 2 3 4 5 6
tamanho: 	.word 6
	
		.text
		.align 2
		.globl main

main:	
		la s0, vetor # Recebe o vetor[0]
		lw s1, tamanho # Recebe o tamanho do vetor
		li t0, 0 # i = 0
		li t1, 0 # count = 0
	
loop_somar:
		slli t2, t0, 2 # t2 = i * 4
		add t2, s0, t2 # t2 = &vetor[i]
	
		lw t3, 0(t2) # t3 = vetor[i]
		add t1, t1, t3 # count += vetor[i] 
		addi t0, t0, 1 # i++
		blt t0, s1, loop_somar # volta se i for menor que o tamanho do vetor
		
		# Imprime
		li a7, 1
		add a0, t1, zero
		ecall
		
		# Encerra o programa
		li a7, 10
		ecall