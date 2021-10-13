`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/15 11:51:11
// Design Name: 
// Module Name: predict_PC
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


module predict_PC(
    //input
    clock,
    Instruction_in,
    
    //PC data
    PC_plus_4_in,
    
    //judge extend's length,Instruction_in[15:0] or Instruction_in[25:0]
    Jmp_out,
    Jal_out,
    
    //judge if (sign-extend)offset<<2
    Beq_out,
    Bne_out,
    Bgez_out,
    Bgtz_out,
    Blez_out,
    Bltz_out,
    Bgezal_out,
    Bltzal_out,
    
    Imme_extend_type,//=0,zero-extend;=1,sign-extend
    
    //output
    PC_predict,
    PC_predict_en
    );
    
    //input
    input clock,Jmp_out,Jal_out,Beq_out,Bne_out,Bgez_out,Bgtz_out,Blez_out,Bltz_out,Bgezal_out,Bltzal_out,Imme_extend_type;
    input [31:0] Instruction_in,PC_plus_4_in;
    
    //output
    output reg [31:0] PC_predict;
    output reg PC_predict_en;
    
endmodule
