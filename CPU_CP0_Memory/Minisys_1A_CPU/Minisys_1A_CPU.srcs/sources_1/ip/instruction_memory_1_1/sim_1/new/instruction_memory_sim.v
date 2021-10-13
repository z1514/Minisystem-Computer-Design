`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/02 15:58:50
// Design Name: 
// Module Name: instruction_memory_sim
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


module instruction_memory_sim();
    //input
    reg clock=1;
    reg [31:0]PC_in=32'h 0;
    
    //output
    wire [31:0]Instruction;
    
    instruction_memory uut(
        clock,
        PC_in,
        Instruction
    );
    
    initial fork
        #1 PC_in=32'h 0;
        #5 PC_in=PC_in+4;
        #9 PC_in=PC_in+4;
        #13 PC_in=PC_in+4;
        #17 PC_in=PC_in+4;                        
    join
    
    always #2 clock=~clock;
    
    
endmodule
