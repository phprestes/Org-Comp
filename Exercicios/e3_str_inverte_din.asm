		.data
		.text
		.align 2
		.globl main
		
main:
		# Leitura do tamanho da string
		li a7, 5
		ecall
		add t0, a0, zero	 # t0 = tamanho da string a ser alocada
		add t6, a0, zero	# t6 = cópia do tamanho
		
		# Alocação dinâmica
		li a7, 9
		add a0, t0, zero
		ecall
		
		# Armazenar o endereço do primeiro byte alocado na posição do ponteiro
		la t1, p # t1 = ponteiro
		sw a0, 0(t1)
		add t2, a0, zero # t2 = buffer, inicio da string
		
		# Leitura da string
		li a7, 8
		addi a1, t0, 1 # Passa o tamanho da string como parâmetro + 1 para o /0
		ecall
		
		add t4, t2, t0 # Passa t4 para o ultimo byte da string
		addi t4, t4, -1 # Ignora o /0
		
loop_inverter: # Primeira implementação - printa invertido
		li a7, 11
		lb a0, 0(t4)
		ecall
		
		addi t4, t4, -1
		addi t0, t0, -1
		bne t0, zero, loop_inverter
		
fim:		# Encerra
		li a7, 10
		ecall

