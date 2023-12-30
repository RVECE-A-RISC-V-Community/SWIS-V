# RISC-V Assembly Program
# Test Load and Store instructions (LW, LB, LBU, LH, LHU, SH, SB)
# Test AUIPC and LUI instructions

# Set base address of the data memory as 0x10000018
li x10, 0x10000018  # Use x10 for the base address

# Load initial values into registers using LI instruction
li x1, 12345       # Load immediate value 12345 into register x1
li x2, -6789       # Load immediate value -6789 into register x2
li x3, 0xA5A5A5A5  # Load immediate value 0xA5A5A5A5 into register x3

# Store the values from registers into memory using different store instructions

# Store word (32 bits) from x1 into memory address 0x10000018 (base address + 0 offset)
sw x1, 0(x10)

# Store byte (8 bits) from x2 into memory address 0x10000019 (base address + 1 offset)
sb x2, 4(x10)

# Store halfword (16 bits) from x3 into memory address 0x1000001C (base address + 4 offset)
sh x3, 8(x10)

# Load values from memory using different load instructions

# Load word (32 bits) from memory address 0x10000018 into x4
lw x4, 0(x10)

# Load byte (8 bits) from memory address 0x10000019 into x5
lb x5, 4(x10)

# Load byte unsigned (8 bits) from memory address 0x10000019 into x9
lbu x9, 8(x10)

# Load halfword (16 bits) from memory address 0x1000001C into x6
lh x6, 4(x10)

# Load halfword unsigned (16 bits) from memory address 0x1000001C into x11
lhu x11, 8(x10)

# Test AUIPC and LUI instructions
# AUIPC sets the upper 20 bits of a register to a shifted 20-bit immediate value
auipc x7, 0x12345   # Add the 20-bit immediate value 0x12345 shifted left by 12 bits to PC and store in x7

# LUI sets the upper 20 bits of a register to a 20-bit immediate value shifted left by 12 bits
lui x8, 0xABCDE     # Load upper immediate value 0xABCDE into register x8

# Your program continues here...

