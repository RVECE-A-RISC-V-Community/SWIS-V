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
        la a0,11
        la a1,7
        la a2,4
        sub a3,a0,a1
        beq a2,a3 ,pass
        
      

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

