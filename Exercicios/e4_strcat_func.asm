		.data
		.align 0
str1:		.asciz "Hello "
str2:		.asciz "World!"

		.text
		.align 2
		.globl main
main:
		la a0, str1
		la a1, str2
		jal strcat
		
		li a7, 4
		ecall
		
		li a7, 10
		ecall
		
# Função para concatenar duas strings passadas como parâmetro
# Argumento a0 e a1 -> strings a serem utilizadas
# Retorno a0 -> strings concatenadas.
strcat:
		addi sp, sp, -8
    		sw ra, 0(sp)
    		sw s0, 4(sp)
		
		mv s0, a1
		
		jal contar_func # Conta para a string em a0
		mv t2, a1 # Armazena o len(a0) em t2
		
		mv a0, s0
		jal contar_func
		mv t3, a1 # Armazena o len(a1) em t3
		
		li a7, 9 # Aloca espaço para a nova string
		add t4, t2, t3 # Armazena o len(a0) + len(a1)
		addi a0, t4, 1 # Adiciona espaço para o \0
		ecall
		
		mv t5, a0 # Move a1 para o início da string
		
		mv t0, a0

cat1_loop:
		lb t6, 0(t0)
		beqz t6, cat2_loop
		sb t6, 0(t5)
		
		addi t5, t5, 1
		addi t0, t0, 1
		j cat1_loop
		
cat2_loop:
		lb t6, 0(s0)
		beqz t6, cat_fim
		sb t6, 0(t5)
		
		addi t5, t5, 1
		addi s0, s0, 1
		j cat2_loop
		
cat_fim:
		sb zero, 0(t5)
		lw ra, 0(sp)
		lw s0, 4(sp)
		addi sp, sp, 8
		jr ra
		
# Função para contar os caracteres de uma string
# Argumento: a0 -> primeiro byte da string
# Retorno: a1 -> tamanho da string.	
contar_func:	
		li a1, 0
		mv t0, a0
contar_loop:	
		lb t1, 0(t0)
		beqz t1, contar_fim
		addi a1, a1, 1
		addi t0, t0, 1
		j contar_loop
contar_fim:
		jr ra
			