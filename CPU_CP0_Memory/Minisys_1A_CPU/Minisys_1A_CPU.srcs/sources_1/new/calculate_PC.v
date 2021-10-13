`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 17:54:38
// Design Name: 
// Module Name: calculate_PC
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


module calculate_PC(
    //input 
    clock,
    reset,
    //PC data
    PC_plus_4_in,
    Extend_imme_in,

    //PC control
    Jmp_in,
    Jal_in,
    Beq_in,
    Bne_in,
    Bgez_in,
    Bgtz_in,
    Blez_in,
    Bltz_in,
    Bgezal_in,
    Bltzal_in,
    
    //output
    //PC
    PC_final_out
    );
    
    //input 
    input clock;
    input reset;
    //PC data
    input [31:0] PC_plus_4_in;
    input [31:0] Extend_imme_in;

    //PC control
    input Jmp_in;
    input Jal_in;
    input Beq_in;
    input Bne_in;
    input Bgez_in;
    input Bgtz_in;
    input Blez_in;
    input Bltz_in;
    input Bgezal_in;
    input Bltzal_in;
    
    //output
    //PC
    output reg [31:0] PC_final_out; 
    
    always @(negedge clock) begin
        if((Jmp_in==1)||(Jal_in==1)) begin
            PC_final_out=Extend_imme_in;
        end else if((Beq_in==1)||(Bne_in==1)||(Bgez_in==1)||(Blez_in==1)||(Bgtz_in==1)||(Bltz_in==1)||(Bgezal_in==1)||(Bltzal_in==1)) begin
            PC_final_out=PC_plus_4_in+Extend_imme_in;
        end
    end    
endmodule