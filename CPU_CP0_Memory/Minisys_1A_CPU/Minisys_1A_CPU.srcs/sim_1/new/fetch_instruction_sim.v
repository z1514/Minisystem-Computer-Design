`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 17:15:08
// Design Name: 
// Module Name: fetch_instruction_sim
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


module fetch_instruction_sim();
    //input 
    reg reset=0;
    reg clock=0;
    
    reg Jmp=0;//j instruction
    reg Jal=0;//jal instruction
    reg Jr=0;//jr ins
    reg Jalr=0;//jalr ins
    reg Beq=0;//beq ins (rt)==(rs)
    reg Bne=0;//bne ins (rt)!=(rs)
    reg Bgez=0;//bgez ins (rs)>=0
    reg Bgtz=0;//bgtz ins (rs)>0
    reg Blez=0;//blez ins (rs)<=0
    reg Bltz=0;//bltz ins (rs)<0
    reg Bgezal=0;//bgezal ins (rs)>=0
    reg Bltzal=0;//bltzal ins (rs)<0
    reg Zero=0;//if (rs)==(rt) Zero=1, else Zero=0
    reg Bigger=0;//if (rs)>0 Bigger=1, else Bigger=0
    reg Less=0;//if (rs)<0 Less=1, else Less=0  
    
    reg[31:0] Read_data_1=32'h 0;
    reg[31:0] Add_result=32'h 11111111;  
    //output
    wire [31:0] PC_plus_4_out;
    wire [31:0] PC_out;
    
    //instantiate the unit under test
    fetch_instruction uut(
       //input
        reset,
        clock,
        
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
        
        //output
        PC_plus_4_out,//PC+4
        PC_out
    );
    
    initial fork
        #2 reset=1;
        #4 reset=0;
        #6 Jmp=1;
        #10 Jmp=0;
        #10 Jal=1;
        #14 Jal=0;
        #14 Jr=1;
        #18 Jr=0;
        #18 Jalr=1;
        #22 Jalr=0;
        
        #22 Beq=1;
        #22 Zero=1;
        #26 Zero=0;
        #26 Beq=0;
        
        #26 Bne=1;
        #26 Zero=1;
        #30 Zero=0;
        #30 Bne=0;
        
        #30 Bgez=1;
        #30 Less=1;
        #34 Less=0;
        #34 Bgez=0;
        
        #34 Bgtz=1;
        #34 Bigger=1;
        #38 Bigger=0;        
        #38 Bgtz=0;
        
        #38 Blez=1;
        #38 Bigger=1;
        #42 Bigger=0; 
        #42 Blez=0;
        
        #42 Bltz=1;
        #42 Less=1;
        #46 Less=0;        
        #46 Bltz=0;
        
        #46 Bgezal=1;
        #46 Less=1;
        #50 Less=0;        
        #50 Bgezal=0;
        
        #50 Bltzal=1;
        #50 Less=1;
        #54 Less=0;        
        #54 Bltzal=0;        
    join
    
    always  #2  clock = ~clock;  
    
endmodule
