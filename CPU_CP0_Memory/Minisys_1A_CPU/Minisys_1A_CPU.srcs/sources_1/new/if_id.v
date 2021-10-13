`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 16:29:12
// Design Name: 
// Module Name: if_id
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


module if_id(
    //input
    clock,
    Block,
    reset,
    clear_9,
    PC_plus_4_in,
    Instruction_in,
    //output
    PC_plus_4_out,
    Instruction_out
    );
    
    //input
    input clock,Block,reset,clear_9;
    input [31:0] PC_plus_4_in,Instruction_in;
    
    //output
    output reg [31:0] PC_plus_4_out,Instruction_out;
    
    always @(posedge clock) begin
        if(Block==0) begin
            PC_plus_4_out=PC_plus_4_in;
            Instruction_out=Instruction_in;
            if(reset==1||clear_9==1) begin
                PC_plus_4_out=32'h X;
                Instruction_out=32'h X;
            end
        end
    end
    
endmodule

