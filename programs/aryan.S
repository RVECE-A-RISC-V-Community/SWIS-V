.global tohost
.global fromhost
.global result
.globl _start

#Text Segment

.align 4
.text

#Start your program from here


loop:
	la a0,1
	la a1,2
	la a4,3
	add a3,a0,a1
	BEQ a3,a4,pass
	
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
