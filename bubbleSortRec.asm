.data 
arr: .word 56,2,6,4,8,3,9,10,6,13

.text
	j main

bubbleRec:
	#as putaria de salvar coisa antes de mudar
	addi sp, sp, -32
    	sd   ra, 0(sp)
	sd   s1, 8(sp)
	sd   s2, 16(sp)
	sd   a1, 24(sp)
	
   	addi t0, zero, -1 # t0 <- i = -1
   	addi t1, a1, -1 # t1 <- size - 1
   	
L_checagem:
	bge t0, t1, lastIf # goto lastIf se (i >= n - 1)
	addi t0, t0, 1 # i++
	
	slli t2, t0, 2 # offset in bytes (j * 4)
	add s1, a0, t2 # s1 <- idx_a = i + offset
	lw t3, 0(s1)   # t3 <- a = arr[idx_a]
	
	addi t2, t2, 4 # offset += 4
   	add s2, a0, t2 # idx_b = i + offset
    	lw t4, 0(s2)   # t4 <- b = arr[idx_b]
    	
    	blt t3, t4, swap # swap a and b if(a > b)
    	
    	j L_checagem
    	
swap:
    	sw t3, 0(s2) # Store a and b in reverse order
    	sw t4, 0(s1)
    	j L_checagem
	
lastIf:
	addi t5, zero, 1 # só pra ter um 1 pra comparar com n - 1
	blt t5, t1, final # if(n - 1 > 1)
	j functExit
	
final:
	addi a1, a1, -1 # o n-1 vai entrar na proxima recursividade como o tamanho do array
	jal bubbleRec
	
functExit:
	ld   ra, 0(sp)
	ld   s1, 8(sp)
	ld   s2, 16(sp)
	ld   a1, 24(sp)
	addi sp, sp, 32
	
	jr ra
	
main:
	addi a1, zero, 10 # tamanho do array
    	la a0, arr # a0 recebe array
   	jal bubbleRec
