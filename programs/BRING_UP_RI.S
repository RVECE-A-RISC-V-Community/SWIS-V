.global tohost
.global fromhost
.global result
.globl _start

#Text Segment

.align 4
.text

#Start your program from here

_start:

       li a0,15
       li a1,25
       li a4,3
       
       # instructions start here
       
       add a2,a0,a1
       li a3,40
       bne a3,a2,fail
       
       
       
       sub a2,a0,a1
       li a3,-10
       bne a3,a2,fail
       
       or a2,a0,a1
       li a3, 31
       bne a3,a2,fail
       
       and a2,a0,a1
       li   a3,9
       bne a3,a2,fail
       
       xor a2,a0,a1
       li  a3, 22
       bne a3,a2,fail
       
       sll a2,a1,a4
       li  a3, 200
       bne a3,a2,fail
       
       srl a2,a0,a4
       li a3, 1
       bne a3,a2,fail
       
       sltu a2,a0,a1
       li a3,1
       bne a3,a2,fail
       
       
       sra a2,a1,a4
       li  a3, 3
       bne a3,a2,fail
       
       slt a2,a0,a1
       li  a3,1
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

