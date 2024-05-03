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
         lui a2,0x12345
         la a3,0x12345000
         bne a3,a2,fail
         
	 auipc a2,0
	 lw a3,0x0(a2)
	 bne a3,a2 , fail

pass:
	la t2, tohost
	li a3, 1
	sw a3, 0(t2)
	1: j 1b # wait for termination
		

fail:
	la t2, tohost
	li a3, 3
	sw a3, 0(t2)
	1: j 1b # wait for termination
	

	
#Data Segment

.align 4
.data
    result: .dword 0
    tohost: .dword 0
    fromhost: .dword 0

