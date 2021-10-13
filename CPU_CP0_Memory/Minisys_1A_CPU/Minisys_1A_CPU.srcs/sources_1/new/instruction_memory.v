`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/16 06:08:02
// Design Name: 
// Module Name: instruction_memory
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


module instruction_memory(//instruction reg
    clock,
    PC_in,
    Instruction
    );
    
    input [31:0] PC_in;
    input clock;
    output [31:0] Instruction;
    
    insram0 insram0(.clka(~clock),
              .addra(PC_in[15:2]),
              .douta(Instruction[7:0]));
              
    insram1 insram1(.clka(~clock),
              .addra(PC_in[15:2]),
              .douta(Instruction[15:8]));    
              
    insram2 insram2(.clka(~clock),
              .addra(PC_in[15:2]),
              .douta(Instruction[23:16]));
                        
    insram3 insram3(.clka(~clock),
              .addra(PC_in[15:2]),
              .douta(Instruction[31:24]));                                                
              
endmodule

