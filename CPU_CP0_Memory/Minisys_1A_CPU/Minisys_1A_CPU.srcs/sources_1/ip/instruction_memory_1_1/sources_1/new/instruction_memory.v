`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/22 23:53:18
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
    
    ram0 ram0(.clka(~clock),
              .addra(PC_in[15:2]),
              .douta(Instruction[7:0]));
              
    ram1 ram1(.clka(~clock),
              .addra(PC_in[15:2]),
              .douta(Instruction[15:8]));    
              
    ram2 ram2(.clka(~clock),
              .addra(PC_in[15:2]),
              .douta(Instruction[23:16]));
                        
    ram3 ram3(.clka(~clock),
              .addra(PC_in[15:2]),
              .douta(Instruction[31:24]));                                                
              
endmodule
