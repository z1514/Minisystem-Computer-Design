`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 17:32:44
// Design Name: 
// Module Name: extend
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

module extend(
    //input
    clock,
    Instruction_in,
    
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
    Extended_out
    );
    
    //input
    input clock,Jmp_out,Jal_out,Beq_out,Bne_out,Bgez_out,Bgtz_out,Blez_out,Bltz_out,Bgezal_out,Bltzal_out,Imme_extend_type;
    input [31:0] Instruction_in;
    //output 
    output reg [31:0] Extended_out;
    
    always @(negedge clock) begin
        if((Jmp_out==1)||(Jal_out==1)) begin
            //j,jal:26bit zero extend 
            Extended_out[27:2]=Instruction_in[25:0];
            Extended_out[31:28]=4'b0000;
            Extended_out[1:0]=2'b00;
        end else if(Imme_extend_type==0) begin
            //andi,ori,xori,sltiu:(zero-extend)immediate
            Extended_out[15:0]=Instruction_in[15:0];
            Extended_out[31:16]=16'h0000;
        end else if((Beq_out==1)||(Bne_out==1)||(Bgez_out==1)||(Bgtz_out==1)||(Blez_out==1)||(Bltz_out==1)||(Bgezal_out==1)||(Bltzal_out==1)) begin
            //beq,bne,bgez,bgtz,blez,bltz,bgezal,bltzal: (Sign-Extend)offset<<2
            Extended_out[17:2]=Instruction_in[15:0];
            Extended_out[1:0]=2'b00;
            if(Instruction_in[15]==1) begin
                Extended_out[31:18]=14'b11_1111_1111_1111;
            end else begin
                Extended_out[31:18]=14'b00_0000_0000_0000;
            end
        end else begin
            //(sign-extend)immediate or (sign-extend)offset
            Extended_out[15:0]=Instruction_in[15:0];
            if(Instruction_in[15]==1) begin
                Extended_out[31:16]=16'hFFFF;
            end else begin
                Extended_out[31:16]=16'h0000;
            end
        end
    end
endmodule
