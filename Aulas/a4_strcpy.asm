		.data
		.align 0
str_src:	.asciz "Oi mãe!"
str_dest:	.space 11

		.text
		.align 2
		.globl main

main:
		la s0, str_src
		la s1, str_dest

loop:
		lb t0, 0(s0)
		sb t0, 0(s1)
		addi s0, s0, 1
		addi s1, s1, 1
		bne t0, zero, loop
		
		# Printa
		li a7, 4
		la a0, str_dest
		ecall
		
		la a0, str_dest
		ecall
		
		# Encerra
		li a7, 10
		ecall