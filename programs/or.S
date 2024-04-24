.global tohost
.global fromhost
.global result
.globl _start

#Text Segment

.align 4
.text

#Start your program from here

_start:
        li x1, 0x01
        li x2, 0x02
        or x3,x1,x2
        li x4, 0x03
        beq x3,x4, pass





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

