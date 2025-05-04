		.data
		.align 0
espaco:		.asciz " "
		.align 2
vetor:		.word 200, 90, -1, 0, 900, 234, 6969, 1, 23, -25
tamanho:	.word 10

		.text
		.align 2
		.globl main
main:
		# Armazena vetor
		la s0, vetor # s0 = vetor[0]
		lw s1, tamanho # s1 = tamanho - 1
		addi s1, s1, -1 
		
		# Inicializar contador i
		li t0, 0 # t0 = i
loop_i:
		# Inicializa contador j
		add t1, s1, zero # t1 = j = tamanho - 1
loop_j:
		slli t2, t1, 2 # t2 = j * 4
		add t2, s0, t2 # t2 = &vetor[j]
		
		lw t3, -4(t2) # t4 = vetor[j-1]
		lw t4, 0(t2) # t5 = vetor[j]
		
		# Troca
		ble t3, t4, pula_troca
		sw t4, -4(t2)	# vetor[j] = vetor[j-1]
		sw t3, 0(t2)	# vetor[j-1] = vetor[j]
		
pula_troca:
		addi t1, t1, -1 # j--
		addi t5, t0, 1
		bge t1, t5, loop_j # Continua o loop j se j >= i+1
		
		addi t0, t0, 1 # i++
		ble t0, s1, loop_i # Continua o loop i se i <= tam - 1
		
		##########
		# Inicializar contador para printar
		li t0, 0
loop_imprimir:
		li a7, 1
		lw a0, 0(s0)
		ecall
		
		li a7, 4
		la a0, espaco
		ecall
		
		addi t0, t0, 1
		addi s0, s0, 4
		ble t0, s1, loop_imprimir
		
		# Sair
		li a7, 10
		ecall
