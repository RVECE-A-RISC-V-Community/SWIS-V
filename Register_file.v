`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.12.2023 17:26:44
// Design Name: 
// Module Name: Register_file
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register_file(
    input clk,
    input rst,
    input  regwrite,
    input [4:0]readreg1,
    input [4:0]readreg2,
    input [4:0]writereg,
    input [31:0]writedata,
    output [31:0]readregdata1,
    output [31:0]readregdata2
    );
    
    assign readregdata1=regmem[readreg1];
    assign readregdata2=regmem[readreg2];
    reg [31:0] regmem[31:0];
    always @(posedge clk,negedge rst)
    begin
    if (rst==0)
    begin
    regmem[3]=8'h23;
    regmem[2]=8'h45;
    regmem[1]=8'h46;
    regmem[0]=8'h67;
    regmem[7]=8'h24;
    regmem[6]=8'h56;
    regmem[5]=8'h87;
    regmem[4]=8'h65;
    regmem[11]=8'h40;
    regmem[10]=8'hc5;
    regmem[9]=8'h85;
    regmem[8]=8'h33;
    regmem[15]=8'h34;
    regmem[14]=8'h5d;
    regmem[13]=8'h2a;
    regmem[12]=8'h78;
    end
    else if (regwrite)
     regmem[writereg] <= writedata;  
    end
    
endmodule
