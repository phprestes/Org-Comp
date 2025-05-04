		.data
		.align 0
str1:		.asciz "Hello World++!"
str2:		.asciz "Hello World--!"

		.text
		.align 2
		.globl main

main:
		addi a7, zero, 5
		ecall
		
		add s0, a0, zero
		blt s0, zero, print_neg
		
		# Printa positivo
		addi a7, zero, 4
		la a0, str1
		ecall
		
		# Pula para o final
		j the_end
		
print_neg:	# Printa negativo
		addi a7, zero, 4
		la a0, str2
		ecall

the_end:	
		# Printa o número
		addi a7 zero 1
		add a0, zero, s0
		ecall
		
		# Encerra o programa
		li a7, 10
		ecall
		
		