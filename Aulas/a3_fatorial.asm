		.data
		.align 0
		
msg_leitura:	.asciz "Digite um número: "
msg_resultado:	.asciz "O fatorial de "
eh: 		.asciz " eh "

		.text
		.align 2
		.globl main
main:
		# Imprime msg_leitura
		li a7, 4
		la a0, msg_leitura
		ecall
		
		# Lendo input
		li a7, 5
		ecall
		mv s0, a0 # s0 recebe input
		mv t0, s0 # contador
		li t1, 1 # resultado

entra_loop:
		beq t0, zero, final
		mul t1, t1, t0 # t1 = t1 * t0
		addi t0, t0, -1 # Decrementa o contador
		j entra_loop
		
final:		
		# Imprime msg_resultado
		li a7, 4
		la a0, msg_resultado
		ecall
		
		# Imprime número original
		li a7, 1
		mv a0, s0
		ecall
		
		# Imrpime eh
		li a7, 4
		la a0, eh
		ecall
		
		# Imprime resposta
		li a7, 1
		mv a0, t1
		ecall
		
		# Encerra programa
		li a7, 10
		ecall
		
		
		