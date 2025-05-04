		.data
		.align 0
str1:		.asciz "Hello "
str2:		.asciz "World!"

		.text
		.align 2
		.globl main
main:
		la s0, str1 		# s0 = str1
		mv t0, s0		# t0 = *p str1 (temp)
		li s1, -1		# s1 = i [len(str1)]
loop_contar1:
		lb t1 0(t0)		# t1 = str[i]
		addi s1, s1, 1		# i++
		addi t0, t0, 1		# p++
		bnez t1, loop_contar1
		
		la s2, str2		# s2 = str2
		mv t2, s2		# t2 = *p str2 (temp)
		li s3, -1		# s3 = i [len(str2)]
loop_contar2:
		lb t3 0(t2)		# t3 = str[i]
		addi s3, s3, 1		# i++
		addi t2, t2, 1		# p++
		bnez t3, loop_contar2
		
		# Aloca memória para a nova string
		li a7, 9
		add a0, s1, s3		# len(str3) = len(st1) + len(str2)
		addi a0, a0, 1 		# Espaço para /0
		ecall
		
		mv s4, a0		# s4 = str3
		mv t4, s4 		# t4 = *p str3 (temp)
		
		# Concatenar string 1
		mv t0, s0
loop_cat1:
		lb t1, 0(t0)		# Concatena
		sb t1, 0(t4)
		addi t4, t4, 1
		addi t0, t0, 1
		addi s1, s1, -1
		bnez s1, loop_cat1	# Decrementa o contador para ir adicionando os chars na str3
		
		# Concatenar string 2
		mv t2, s2
loop_cat2:				# Mesma coisa do loop_cat mas para a string 2
		lb t3, 0(t2)
		sb t3, 0(t4)
		addi t4, t4, 1
		addi t2, t2, 1
		addi s3, s3, -1
		bnez s3, loop_cat2
		
		# Add /0
		sb zero, 0(t4)
		
		# Imprime
		li a7, 4
		mv a0, s4
		ecall
		
		# Encerra
		li a7, 10
		ecall
