.data
array: .word 16,6,-3,-4,9,3,1,12,-5,11

.text
    j main

bubble: # bubble_sort(int* arr, int n)
    addi sp, sp, -32
    sd   ra, 0(sp)
    sd   s1, 8(sp)
    sd   s2, 16(sp)
    sd   s3, 24(sp)
    # a1 <- size
    addi t0, zero, -1 # i = -1
    addi s3, a1, -1   # s3 <- size - 1
    
L_outer:
    beq t0, a1, func_exit # exit if (i == size)
    addi t0, t0, 1        # i++
    addi t1, zero, 0      # j = 0
L_inner:
    beq  t1, s3, L_outer # goto outer if (j == size - 1)
    addi t1, t1, 1 # j++
    
    slli t4, t1, 2 # offset in bytes (j * 4)
    add s1, a0, t4 # s1 <- idx_a = j + offset
    lw t5, 0(s1)   # t5 <- a = arr[idx_a]
    
    addi t4, t4, 4 # offset += 4
    add s2, a0, t4 # idx_b = j + offset
    lw t6, 0(s2)   # t6 <- b = arr[idx_b]
    
    blt t5, t6, swap # swap a and b if(a > b)
    
    j L_inner

swap:
    sw t5, 0(s2) # Store a and b in reverse order
    sw t6, 0(s1)
    j L_inner 
    
func_exit:
    ld   ra  0(sp)
    ld   s1, 8(sp)
    ld   s2, 16(sp)
    ld   s3, 24(sp)
    addi sp, sp, 32
    
    jr ra
    
main:
    addi a1, zero, 10 # tamanho do array
    la a0, array # a0 recebe array
    jal bubble
