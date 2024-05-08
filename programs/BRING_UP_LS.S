.global tohost
.global fromhost
.global result
.globl _start

# Text Segment

.align 4
.text

_start:
       li a2,0x12345678
       li a4,0x12345678
        la t0,loc0
        la t1,loc1
       andi t2, a2, 0xFF  
       sb t2 ,0x0(t0)
       srli a2,a2,8
       andi t2, a2, 0xFF  
       sb t2 ,0x1(t0)
       srli a2,a2,8
       andi t2, a2, 0xFF  
       sb t2 ,0x2(t0)
       srli a2,a2,8
       andi t2, a2, 0xFF  
       sb t2 ,0x3(t0)
       
      
       lw a3,0x0(t0)
       
       bne a3, a4,fail
 pass :
    la t2, tohost
    li a3, 1
    sw a3, 0(t2)
    j _start  
    
fail:
    
    la t2, tohost
    li a3, 3
    sw a3, 0(t2)
    j fail

# Data Segment

.align 2
.data

tohost: .dword 0
fromhost: .dword 0
loc0: .dword 0
loc1: .dword 0

