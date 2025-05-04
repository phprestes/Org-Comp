		.data
		.align 0
str:		.asciz "Hello World!"
		
		.text
		.align 2
		.globl main
main:		
		la s0, str		# s0 = str[0]
		mv t0, s0 		# t0 = *p str[0] (temp)
		li s1, 0		# s1 = contador i [len(str)]
		
loop_contar:
		lb t1, 0(t0)		# t = str[i]
		addi t0, t0, 1		# Anda ponteiro
		addi s1, s1, 1		# i++
		bnez t1, loop_contar 	# Caso chegue no \0 encerra contagem
		
		# Aloca memória para a nova string
		li a7, 9
		mv a0, s1		# Passa o tamanho da alocação como parâmetro.
		ecall
		
		mv s2, a0 		# s2 = str_new[0]
		mv t2, s2		# t2 = *p str_new[0] (temp)
		mv t0, s0		# t0 = *p str[0] (temp)
		
loop_copiar:
		lb t1, 0(t0)		# Pega o caracter em t0 e armazena em t2
		sb t1, 0(t2)
		addi t0, t0, 1		# Anda t0 e t2
		addi t2, t2, 1
		bnez t1, loop_copiar	# Volta caso não tenha chegado ao /0
		
		li a7, 4
		mv a0, s2
		ecall
		
		li a7, 10
		ecall
		
		
		
