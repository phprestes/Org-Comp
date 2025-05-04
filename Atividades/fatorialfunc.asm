		.data
		.align 0
msg_leitura:	.asciz "Digite um número natural: "
msg_resultado:	.asciz "O fatorial de "
eh:		.asciz " eh "

		.text
		.align 2
		.globl main
main:		
		# Printa msg_leitura
		li a7, 4
		la a0, msg_leitura
		ecall
		
		# Lendo input
		li a7, 5
		ecall
		mv s0, a0 # s0 = n
		
		# Chamada de função
		jal fatorial
		
		# Imprime msg_resultado
		li a7, 4
		la a0, msg_resultado
		ecall
		
		# Imprime o n do usuário
		li a7, 1
		mv a0, s0
		ecall
		
		# Imprime eh
		li a7, 4
		la a0, eh
		ecall
		
		# Imprime o resultado
		li a7, 1
		mv a0, a1
		ecall
		
		# Encerra
		li a7, 10
		ecall
		
# Função que calcula fatorial n!
# Argumentos: a0 = n
# Retorno: a1 = resultado
fatorial:
		add t0, a0, zero # Contador começando em n
		li a1, 1 # Resultado, começa em 0! = 1
fatorial_loop:		
		beq t0, zero, fatorial_fim # Se o contador chegar a 0, pula para o retorno
		mul a1, a1, t0 # Multiplica o resultado pelo contador
		addi t0, t0, -1 # Decrementa o contador
		
		j fatorial_loop
fatorial_fim:
		jr ra