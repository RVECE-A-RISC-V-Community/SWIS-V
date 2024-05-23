.global tohost
.global fromhost
.global result
.globl _start

#Text Segment

.align 4
.text

#Start your program from here

_start:

        lui a2,0x12345
        li a3,0x12345000
        bne a3,a2,fail
         
test_aui0:
        auipc t1,0
	la t0, test_aui0      
        bne t1,t0,fail
         
test_aui1:
	auipc a2,8
	la a0, test_aui1
	addi a3,zero,8
	sll a3,a3,12
	add a0,a0,a3

	bne a0,a2,fail

test_aui2:     
	auipc a2,8
	la a0, test_aui2
	addi a3,zero,8
	sll a3,a3,12
	add a0,a0,a3

	bne a0,a2,fail
	 

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
    tohost: .dword 0
    fromhost: .dword 0
    
