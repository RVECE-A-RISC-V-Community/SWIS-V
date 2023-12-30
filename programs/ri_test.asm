# Initial values stored into registers
li x1, 10   # Load immediate 10 into register x1
li x2, -5   # Load immediate -5 into register x2
li x3, 8    # Load immediate 8 into register x3
li x4, 15   # Load immediate 15 into register x4
li x5, 20   # Load immediate 20 into register x5

# R-Type Instructions (Arithmetic and Logical)
# ADD - Add
add x6, x1, x2

# SUB - Subtract
sub x7, x3, x4

# SLL - Shift Left Logical
sll x8, x1, x5

# SLT - Set Less Than
slt x9, x2, x3

# SLTU - Set Less Than Unsigned
sltu x10, x4, x5

# XOR - Bitwise XOR
xor x11, x1, x3

# SRL - Shift Right Logical
srl x12, x2, x5

# SRA - Shift Right Arithmetic
sra x13, x4, x1

# OR - Bitwise OR
or x14, x2, x3

# AND - Bitwise AND
and x15, x1, x5

# I-Type Instructions (Arithmetic and Logical)
# ADDI - Add Immediate
addi x16, x2, 10

# SLTI - Set Less Than Immediate
slti x17, x3, -5

# SLTIU - Set Less Than Immediate Unsigned
sltiu x18, x4, 8

# XORI - Bitwise XOR Immediate
xori x19, x5, 15

# ORI - Bitwise OR Immediate
ori x20, x1, 20

# ANDI - Bitwise AND Immediate
andi x21, x2, 25

# SLLI - Shift Left Logical Immediate
slli x22, x3, 3

# SRLI - Shift Right Logical Immediate
srli x23, x4, 4

# SRAI - Shift Right Arithmetic Immediate
srai x24, x5, 2

# Print register values or perform further operations as needed for testing

