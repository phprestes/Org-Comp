		.data
		.align 0
str:		.asciz "Hello World!"
		.text
		.align 2
		.globl main
main:
		la s0, str # Carrega o primeiro byte da string em s0
		li t0, -1 # Inicia o contador para descobrir o tamanho da string.
		# Desconsidera o /0
loop_contar:
		lb t1, 0(s0)
		addi t0, t0, 1
		addi s0, s0, 1
		
		bne t1, zero, loop_contar
	
		la s0, str # Carrega o primeiro byte da string em s0
		la s1, str # Carrega o último byte da string em s0
		add s1, s1, t0
		addi s1, s1, -1 # Ajusta para antes do \0
		
		srli t0, t0, 1 # Divide o tamanho por dois

loop_inverter:
		lb t1, 0(s0)
		lb t2, 0(s1)
		
		sb t1, 0(s1)
		sb t2, 0(s0)
		
		addi s0, s0, 1 # Avança o início
		addi s1, s1, -1 # Volta o fim
		addi t0, t0, -1
		bnez t0, loop_inverter
		
		# Printa string
		li a7, 4
		la a0, str
		ecall
		
		li a7, 10
		ecall
			
		