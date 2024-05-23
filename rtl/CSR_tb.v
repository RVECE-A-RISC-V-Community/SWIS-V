
     module tb_rv32i_csr_single_stage_pipeline();

    // Declare signals
    reg i_clk, i_rst_n, i_external_interrupt, i_software_interrupt, i_timer_interrupt;
    reg i_is_inst_illegal, i_is_ecall, i_is_ebreak, i_is_mret;
    reg [31:0] i_pc, i_rs1, i_imm;
    reg [2:0] i_funct3;
    reg [11:0] i_csr_index;
    wire [31:0] o_return_address, o_trap_address;
    wire o_go_to_trap_q, o_return_from_trap_q;
    reg i_ce, i_stall;

    // Instantiate the module
    rv32i_csr_single_stage_pipeline dut (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_external_interrupt(i_external_interrupt),
        .i_software_interrupt(i_software_interrupt),
        .i_timer_interrupt(i_timer_interrupt),
        .i_is_inst_illegal(i_is_inst_illegal),
        .i_is_ecall(i_is_ecall),
        .i_is_ebreak(i_is_ebreak),
        .i_is_mret(i_is_mret),
        .i_pc(i_pc),
        .i_rs1(i_rs1),
        .i_imm(i_imm),
        .i_funct3(i_funct3),
        .i_csr_index(i_csr_index),
        .o_return_address(o_return_address),
        .o_trap_address(o_trap_address),
        .o_go_to_trap_q(o_go_to_trap_q),
        .o_return_from_trap_q(o_return_from_trap_q),
        .i_ce(i_ce),
        .i_stall(i_stall)
    );

    // Clock generation
    always #5 i_clk = ~i_clk;

    // Initial values
    initial begin
      $dumpfile("test_csr.vcd");
     $dumpvars(0,tb_rv32i_csr_single_stage_pipeline);
        i_clk = 0;
        i_rst_n = 0;
        i_external_interrupt = 0;
        i_software_interrupt = 0;
        i_timer_interrupt = 0;
        i_is_inst_illegal = 0;
        i_is_ecall = 0;
        i_is_ebreak = 0;
        i_is_mret = 0;
        i_pc = 32'h00000000;
        i_rs1 = 32'h00000000;
        i_imm = 32'h00000000;
        i_funct3 = 3'b000;
        i_csr_index = 12'h000;
        i_ce = 0;
        i_stall = 0;

        // Reset
        #10 i_rst_n = 1;

        // Test case 1: Read and write to MSTATUS register
        i_csr_index = 12'h300;
        i_rs1 = 32'h00001000; // New value to be written
        i_funct3 = 3'b011; // CSR read-write
        i_ce = 1;
        #20;
        i_ce = 0;

        // Test case 2: Handle external interrupt
        i_external_interrupt = 1;
        i_ce = 1;
        #20;
        i_ce = 0;
        i_external_interrupt = 0;

        // Add more test cases as needed

        // End simulation
        #100 $finish;
    end

endmodule

