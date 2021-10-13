`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 17:21:00
// Design Name: 
// Module Name: pc_mux
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


module pc_mux(//instruction address mux
    //input
    Block,
    reset,
    PC_CP0,
    PC_CP0_en,
    Read_data_1,
    Add_result,
    PC,
    
    Jmp,//j instruction
    Jal,//jal instruction
    Jr,//jr ins
    Jalr,//jalr ins
    Beq,//beq ins (rt)==(rs)
    Bne,//bne ins (rt)!=(rs)
    Bgez,//bgez ins (rs)>=0
    Bgtz,//bgtz ins (rs)>0
    Blez,//blez ins (rs)<=0
    Bltz,//bltz ins (rs)<0
    Bgezal,//bgezal ins (rs)>=0
    Bltzal,//bltzal ins (rs)<0
    Zero,//if (rs)==(rt) Zero=1, else Zero=0
    Bigger,//if (rs)>0 Bigger=1, else Bigger=0
    Less,//if (rs)<0 Less=1, else Less=0
    
    //output
    PC_out,
    clear_1
    );
    
    input Block,reset,Jmp,Jal,Jr,Jalr,Beq,Bne,Bgez,Bgtz,Blez,Bltz,Bgezal,Bltzal,Zero,Bigger,Less,PC_CP0_en;
    input [31:0] Read_data_1,Add_result,PC,PC_CP0;
    
    output reg [31:0] PC_out;
    output reg clear_1;   
    
    always @(PC_CP0_en,Block,reset,Jmp,Jal,Jr,Jalr,Beq,Bne,Bgez,Bgtz,Blez,Bltz,Bgezal,Bltzal,Zero,Bigger,Less,Read_data_1,Add_result,PC) begin
        clear_1=0;
        if(Block==0) begin
            if(reset==1) begin
                PC_out=32'h 0;
            end else
            if((Jr==1)||(Jalr==1)) begin
                PC_out=Read_data_1;
                clear_1=1;
            end else if((Jmp==1)||(Jal==1)) begin
                PC_out=Add_result;
                clear_1=1;
            end else if(((Beq && Zero)||(Bne && (!Zero))||(Bgez && (!Less))||(Bgtz && Bigger)||(Blez && (!Bigger))||(Bltz && Less)||(Bgezal && (!Less))||(Bltzal && Less))==1) begin
                PC_out=Add_result;
                clear_1=1;
            end else begin
                PC_out=PC;
            end
            //CP0
            if(PC_CP0_en==1) begin
                PC_out=PC_CP0;
            end
        end
    end
     
endmodule

