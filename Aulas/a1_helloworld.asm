		.data
		# Dados do programa
hello_msg:	.asciz	"Hello World!"

		.text
		# Código do programa
		.globl main
main:		# Carrega para o registrador a7 o serviço 4 (imprimir string)
		li a7, 4
		
		# Colocar no a0 o endereço do primeiro byte da string
		la a0, hello_msg
		
		# Faz a chamada ao sistema
		ecall
		
		# Encerra o programa
		li a7, 10
		ecall