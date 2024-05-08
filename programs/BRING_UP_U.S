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
         
       
         jal t0,loop
         
      loop:
      
         auipc t1,0
      
         bne t1,t0,fail
         
         
	 

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
    
