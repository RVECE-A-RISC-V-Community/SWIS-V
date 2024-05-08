module rv32i_csr_single_stage_pipeline (
    input wire i_clk, 
    input wire i_rst_n,
    input wire i_external_interrupt, 
    input wire i_software_interrupt, 
    input wire i_timer_interrupt, 
    input wire i_is_inst_illegal, 
    input wire i_is_ecall, 
    input wire i_is_ebreak, 
    input wire i_is_mret,
    input wire[31:0] i_pc, 
    output reg[31:0] o_return_address, 
    output reg[31:0] o_trap_address, 
    output reg o_go_to_trap_q, 
    output reg o_return_from_trap_q, 
    input wire i_ce, 
    input wire i_stall
);

    // CSR addresses
    localparam MVENDORID = 12'hF11,  
               MARCHID = 12'hF12,
               MIMPID = 12'hF13,
               MHARTID = 12'hF14,
               MSTATUS = 12'h300, 
               MISA = 12'h301,
               MIE = 12'h304,
               MTVEC = 12'h305,
               MSCRATCH = 12'h340, 
               MEPC = 12'h341,
               MCAUSE = 12'h342,
               MTVAL = 12'h343,
               MIP = 12'h344;

    // CSR registers
    reg [31:0] MVENDORID_reg;
    reg [31:0] MARCHID_reg;
    reg [31:0] MIMPID_reg;
    reg [31:0] MHARTID_reg;
    reg [31:0] MSTATUS_reg;
    reg [31:0] MISA_reg;
    reg [31:0] MIE_reg;
    reg [31:0] MTVEC_reg;
    reg [31:0] MSCRATCH_reg;
    reg [31:0] MEPC_reg;
    reg [31:0] MCAUSE_reg;
    reg [31:0] MTVAL_reg;
    reg [31:0] MIP_reg;

    always @(posedge i_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            // Reset all registers
            MVENDORID_reg <= 32'h0;
            MARCHID_reg <= 32'h0;
            MIMPID_reg <= 32'h0;
            MHARTID_reg <= 32'h0;
            MSTATUS_reg <= 32'h0;
            MISA_reg <= 32'h0;
            MIE_reg <= 32'h0;
            MTVEC_reg <= 32'h0;
            MSCRATCH_reg <= 32'h0;
            MEPC_reg <= 32'h0;
            MCAUSE_reg <= 32'h0;
            MTVAL_reg <= 32'h0;
            MIP_reg <= 32'h0;
            // Reset trap-related signals
            o_go_to_trap_q <= 0;
            o_return_from_trap_q <= 0;
        end else begin
            // Update CSR registers based on CSR instructions
            if (i_ce && !i_stall) begin
                case (i_csr_index)
                    MVENDORID: MVENDORID_reg <= csr_in;
                    MARCHID: MARCHID_reg <= csr_in;
                    MIMPID: MIMPID_reg <= csr_in;
                    MHARTID: MHARTID_reg <= csr_in;
                    MSTATUS: MSTATUS_reg <= csr_in;
                    MISA: MISA_reg <= csr_in;
                    MIE: MIE_reg <= csr_in;
                    MTVEC: MTVEC_reg <= csr_in;
                    MSCRATCH: MSCRATCH_reg <= csr_in;
                    MEPC: MEPC_reg <= csr_in;
                    MCAUSE: MCAUSE_reg <= csr_in;
                    MTVAL: MTVAL_reg <= csr_in;
                    MIP: MIP_reg <= csr_in;
                endcase
                // Handle trap-related signals
                if (go_to_trap && !o_go_to_trap_q) begin
                    o_return_address <= i_pc;
                    o_trap_address <= MTVEC_reg;
                end
                if (i_is_mret) begin
                    o_return_from_trap_q <= 1;
                end
            end
        end
    end

    // Control logic for detecting traps
    always @* begin
        // Detect external interrupt
        if (i_external_interrupt && MIE_reg[11]) begin
            go_to_trap = 1;
        end
        // Detect software interrupt
        else if (i_software_interrupt && MIE_reg[3]) begin
            go_to_trap = 1;
        end
        // Detect timer interrupt
        else if (i_timer_interrupt && MIE_reg[7]) begin
            go_to_trap = 1;
        end
        // Detect exceptions
        else if (i_is_inst_illegal || i_is_ecall || i_is_ebreak) begin
            go_to_trap = 1;
        end
        else begin
            go_to_trap = 0;
        end
    end

    // CSR instruction execution
    reg [31:0] csr_in;
    always @* begin
        case (i_funct3)
            3'b011: csr_in = i_rs1; // CSR read-write
            3'b010: csr_in = MSTATUS_reg | i_rs1; // CSR read-set
            3'b001: csr_in = MSTATUS_reg & (~i_rs1); // CSR read-clear
            3'b101: csr_in = i_imm; // CSR read-write immediate
            3'b110: csr_in = MSTATUS_reg | i_imm; // CSR read-set immediate
            3'b111: csr_in = MSTATUS_reg & (~i_imm); // CSR read-clear immediate
            default: csr_in = 32'h0;
        endcase
    end

endmodule

