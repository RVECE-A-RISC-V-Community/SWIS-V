.global tohost
.global fromhost
.global result
.global _start

#Text Segment

.align 4
.text

#Start your program from here

_start:
       li a0,15
       li a1,25
       li a4,3  
       li a3,25
       add a2,a1,a0
       li a5,-5 
       add a6, a4,a5
  1:   beq a1,a3,equal   
       j fail  
  2:   bne a0,a1,unequal 
       j fail 
  3:   bge a2,a4 ,g
       j fail 
  4:   ble a4, a1,l
       j  fail
  5:   bltu a4,a5,leu
       j fail 
  6:   bgeu a6,a5,geu
       j fail 
  7:   j Branch_false

equal:
    j 2b
unequal:
  
    j 3b
g:  
    
    j 4b 
 
l: 
    
    j 5b

leu:    
     j 6b

   
 
geu: 
     
     j 7b

Branch_false: 
    li a0,15
       li a1,15
       li a4,3  
       li a3,21
       add a2,a1,a0
       li a5,-5 
       add a6, a4,a5
  1:   beq a1,a3,equalf   
        
  2:   bne a0,a1,unequalf 
       
  3:   bge a4,a2 ,gf
       
  4:   blt a2, a4,lf
      
  5:   bltu a5,a4,leuf
       
  6:   bgeu a5,a6,geuf
       
  7:   j Jump_inst
  
equalf:
    j fail
unequalf:
  
    j fail
gf:  
    
    j fail
 
lf: 
    
    j fail

leuf:    
     j fail

   
 
geuf: 
     
     j fail




Jump_inst:
  la a1,jp
  add a2,a1,0x12
  jalr sp,a1,0x08
  nop
  nop
  jp: beq sp,a2,j_pass
   


 j_back: j pass
 
 
 j_pass:
   j j_back


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
