		.data
		.align 0
str1:		.asciz "Hello World"
str2: 		.asciz "Hello Worla"
		
		.text
		.align 2
		.globl main
		
main:		
		la s0, str1		# s0 = str1
		li s1, 0		# s1 = len(str1)
		la s2, str2 		# s2 = str2
		li s3, 0		# s3 = len(str3)
		
		# Contar caracteres da primeira
		mv t0, s0
loop_contar1:
		lb t1, 0(t0)
		addi s1, s1, 1
		addi t0, t0, 1
		bnez t1, loop_contar1
		
		# Contar caracteres da segunda
		mv t2, s2
loop_contar2:
		lb t3, 0(t2)
		addi s3, s3, 1
		addi t2, t2, 1
		bnez t3, loop_contar2

		blt s1, s3, printa_menos
		bgt s1, s3, printa_mais
		mv t0, s0		# Ajusta ponteiros
		mv t2, s2
		j tamanhos_iguais
printa_menos:
		li a7, 1
		li a0, -1
		ecall
		j encerra_prg
printa_mais:
		li a7, 1
		li a0, 1
		ecall
		j encerra_prg
		
tamanhos_iguais:
		lb t1, 0(t0)
		lb t3, 0(t2)
		blt t1, t3, printa_menos
		bgt t1, t3, printa_mais
		addi t0, t0, 1
		addi t2, t2, 1
		bnez t1, tamanhos_iguais
		
		# Sâo iguais
		li a7, 1
		li a0, 0
		ecall
		
encerra_prg:
		li a7, 10
		ecall
		