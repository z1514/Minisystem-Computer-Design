`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/23 19:41:41
// Design Name: 
// Module Name: if_id_sim
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


module if_id_sim( );
    //input
    reg clock=0;
    reg reset=0;
    reg [31:0] PC_plus_4_in=32'h 35CFDD74;
    reg [31:0] Instruction_in=32'h 12345678;
    
    //output
    wire [31:0] PC_plus_4_out;
    wire [31:0] Instruction_out;
    
    //instantiate the unit under test
    if_id uut(
        .clock(clock),
        .reset(reset),
        .PC_plus_4_in(PC_plus_4_in),
        .Instruction_in(Instruction_in),
        .PC_plus_4_out(PC_plus_4_out),
        .Instruction_out(Instruction_out)
    );
    
    initial fork
        #5 clock=~clock;
        #20 PC_plus_4_in=32'h 11111111;
        #20 Instruction_in=32'h 22222222;
        #40 clock=~clock;
        #45 clock=~clock;
        #55 clock=~clock;
        #60 clock=~clock;
        #60 reset=1;
        #70 clock=~clock;
        #75 clock=~clock;       
    join
    
endmodule
