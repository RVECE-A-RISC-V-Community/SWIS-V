.global tohost
.global fromhost
.global result
.globl _start

#Text Segment

.align 4
.text

#Start your program from here

_start:
	li a5, 100
	li a4, 200

	lw a8, 0(a7)
	
leu:
	bleu a4,a5`

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

