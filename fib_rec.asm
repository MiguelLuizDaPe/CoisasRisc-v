.text
	j main
	
fib_rec:
	addi sp, sp, -32 #salvando os resgistradores
	sd   ra, 0(sp)
	sd   a0, 8(sp)
	sd   s0, 16(sp)
	sd   s1, 24(sp)
	
	addi t0, zero, 2 
	blt a0, t0, ret1 #ve se eh menor que 2
	
	addi a0, a0, -1  # n = n - 1
	jal fib_rec      #faz o fib-rec(n)
	add s0, zero, a1 # s0 = fib-rec(n)
	
	addi a0, a0, -1  # n = ((n - 1)-1)
	jal fib_rec      #faz o fib-rec(n)
	add s1, zero, a1 # s1 = fib-rec(n)
	
	add a1, s0, s1 
	
	j fib_rec_exit
	
ret1:
	addi a1, zero, 1
	j fib_rec_exit
	
fib_rec_exit:
	ld   ra, 0(sp)  #restaura os registradores
	ld   a0, 8(sp)
	ld   s0, 16(sp)
	ld   s1, 24(sp)
	addi sp, sp, 32
	
	jr ra
		
main:
	addi a0, zero, 2
	jal fib_rec	
