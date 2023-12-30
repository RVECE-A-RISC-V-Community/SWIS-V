_start:

    # Initialize registers with immediate values
    li x1, 5   # Load immediate 5 into register x1
    li x2, 8   # Load immediate 8 into register x2
    li x3, 0   # Load immediate 0 into register x3

    # Branching example
    bne x1, x2, branches_not_equal  # Branch if x1 != x2
    # If branches are equal, no action, continue to next instruction
    j end_branches  # Jump to end_branches section

branches_not_equal:
    # Print a message or perform an operation indicating that branches are not equal
    # (This is a placeholder for the desired action in your simulation environment)

end_branches:

    # Jumping example
    jalr x4, x0, jump_target  # Jump and link to jump_target using x0 as the base address

    # Print a message or perform an operation indicating successful jump
    # (This is a placeholder for the desired action in your simulation environment)

    j end_program  # Jump to end_program section

jump_target:
    # This is the target of the jump
    # Perform any specific operations at the jump target
    # (This is a placeholder for the desired action in your simulation environment)

    ret  # Return from jump using ret instruction (simulate a function return)

end_program:
    # End of the program
    # (This is a placeholder for the desired action in your simulation environment)

    # End the simulation or perform any necessary cleanup
