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
       la a0,15
       la a1,25
       la a4,3
       
       # instructions start here
       
       add a2,a0,a1
       la a3,40
  
       
       sub a2,a0,a1
       la a3,-10
       
       
       or a2,a0,a1
       la a3, 31
       
       
       and a2,a0,a1
       la  a3,9
       
       
       xor a2,a0,a1
       la a3, 22
       
       
       sll a2,a1,a4
       la a3, 200
       
       
       srl a2,a0,a4
       la a3, 1
       
       
       sltu a2,a0,a1
       la a3,1
       
       
       
       sra a2,a1,a4
       la  a3, 3
       
       
       slt a2,a0,a1
       la a3,1
       bne a3,a2,fail




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

