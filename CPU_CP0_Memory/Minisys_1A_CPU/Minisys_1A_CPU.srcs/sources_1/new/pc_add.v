`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/23 12:26:18
// Design Name: 
// Module Name: pc_add
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


module pc_add(//PC+4
    clock,
    PC_out,
    PC_plus_4_out
    );
    
    input clock;
    input [31:0] PC_out;
    output reg [31:0] PC_plus_4_out;
    
    always @ (negedge clock) begin
        PC_plus_4_out=PC_out+4;
    end
    
endmodule
