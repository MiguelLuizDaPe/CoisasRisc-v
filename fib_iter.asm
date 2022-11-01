.text
	j main
	
fib_it:	
	addi t0, zero, 2
	blt a0, t0, vira1 # a0 sendo menor que 2 a1 se tornara 1

	addi t0, zero, 1 #prevprev
	addi t1, zero, 1 #prev
	addi a1, zero, 1 #atual
	
	addi t3, zero, 1 # i do forloop
	
forloop:
	add  a1, t0, t1   # atual = prevprev + prev
	add  t0, zero, t1 # prevprev = prev
	add  t1, zero, a1 # prev = atual
	
	addi t3, t3, 1 #i++
	blt  t3, a0, forloop
	
	jr ra
	
vira1:
	addi a1, zero, 1
	jr ra
	
main:
	addi a0, zero, 2
	jal fib_it
