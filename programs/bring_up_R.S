.global tohost
.global fromhost
.global result
.globl _start

#Text Segment

.align 4
.text

#Start your program from here

_start:
	# Initialize registers
	la t2, result     # store address
	ori t0, zero, 1   # cnt = 1
	ori a2, zero, 10  # ten = 10
	ori a0, zero, 0   # out = 0

loop:
        addi  a2,zero,5
   
        addi t0, zero, 1  
        addi a0, zero, 0 
    loop_inner:
        
  
        # Addition
        add a1, a0, t0
        
        # Subtraction
        sub t3 ,a0, t0  
        
        # Bitwise AND
        and a3, a0, t0   
        
        # Bitwise OR
        or a4, a0, t0   
        
        # Bitwise XOR
        xor a5, a0, t0  
        
        # Shift left logical
        sll a6, a0, t0   
        
        # Shift right logical
        srl a7, a0, t0  
        
        # Shift right arithmetic
        sra t1 ,a0, t0   
        
        # Set less than
        slt t2 , a0, t0  
        
        
        
        addi t0, t0, 1   
        addi a0, a0, 2
       beq t0, a2, pass 
    
        j loop_inner
     



fail:
	la t2, tohost
	li a3, 3
	sw a3, 0(t2)
	1: j 1b # wait for termination
	
pass:
	la t2, tohost
	li a3, 1
	sw a3, 0(t2)
	1: j 1b # wait for termination
	
	
#Data Segment

.align 4
.data
    result: .dword 0
    tohost: .dword 0
    fromhost: .dword 0

