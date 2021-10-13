`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/23 11:27:12
// Design Name: 
// Module Name: fetch_instruction
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


module fetch_instruction(//fetch instruction module
    //input
    reset,
    clock,
    Block,
    
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
    
    Read_data_1,//register data 1 (rs)
    Add_result,
    
    PC_CP0,
    PC_CP0_en,
    
    //output
    PC_plus_4_out,//PC+4
    PC_out,
    clear_1
    );
    
    input reset,clock,Block,Jmp,Jal,Jr,Jalr,Beq,Bne,Bgez,Bgtz,Blez,Bltz,Bgezal,Bltzal,Zero,Bigger,Less;
    input [31:0] Read_data_1,Add_result;
    input [31:0] PC_CP0;
    input PC_CP0_en;
    output [31:0] PC_plus_4_out;
    output [31:0] PC_out;
    output clear_1;

    
    
    pc_mux U0(
        //input
        Block,
        reset,
        PC_CP0,
        PC_CP0_en,
        Read_data_1,
        Add_result,
        PC_plus_4_out,
        
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
    
    pc_add U1(
        clock,
        PC_out,
        PC_plus_4_out
    ); 
    
    
endmodule
