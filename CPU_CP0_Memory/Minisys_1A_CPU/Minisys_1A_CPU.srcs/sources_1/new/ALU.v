`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 17:55:27
// Design Name: 
// Module Name: ALU
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

module ALU(
    //input 
    clock,
    reset,
    
    Direct_read_addr_1,
    Direct_read_addr_2, 
    If_read, 
    //input from ex_mem  
    
    Write_reg_en1,
    Write_raed_data_en1,
    Mfc01,
    Direct_write_addr1,
    Direct_write_data1,
    //input from mem_wb  
    Write_reg_en2,      
    Write_raed_data_en2,
    Mfc02,
    Direct_write_addr2, 
    Direct_write_data2, 
    
    Read_data_1_in,
    Read_data_2_in,
    Extend_imme_in,
    I_format_in,
    Shamt_in,
    Imme_in,
    Lui_in,
    Slt_in,//[3:0]
    Shift_opnum_in,//0-shamt,1-(rs)
    ALU_op_in,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav  
    
    //output
    Block,
    Read_data_1,
    Read_data_2,
    //ALU
    ALU_result,
    ALU_result_HI,
    ALU_result_LO,
    Zero,
    Less,
    Bigger,  
    OF,
    CF,
    ER      
    );
    
    //input 
    input clock;
    input reset;
    
    //Direct
    input [1:0] If_read;
    input [4:0] Direct_read_addr_1,Direct_read_addr_2,Direct_write_addr1,Direct_write_addr2;
    input Write_reg_en1,Write_raed_data_en1,Mfc01;
    input [31:0] Direct_write_data1;  
    input Write_reg_en2,Write_raed_data_en2,Mfc02;
    input [31:0] Direct_write_data2;                                        
    
    input [31:0] Extend_imme_in;
    input [31:0] Read_data_1_in;
    input [31:0] Read_data_2_in;
    
    input I_format_in;
    input [4:0] Shamt_in;
    input [15:0] Imme_in;
    input Lui_in;
    input [3:0] Slt_in;//[3:0]
    input Shift_opnum_in;//0-shamt,1-(rs)
    input [3:0] ALU_op_in;//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav             
    
    //output 
    output reg Block;
    output reg [31:0] Read_data_1,Read_data_2;
    output reg [31:0] ALU_result,ALU_result_HI,ALU_result_LO;
    output reg Zero;
    output reg Less;
    output reg Bigger; 
    //output reg OF;
    
    output reg OF;
    output reg CF,ER;  
    reg [32:0] Temp;
   
    
    reg [63:0] mult_result,multu_result;
//    assign mult_result[62:0]=Read_data_1[30:0]*Read_data_2[30:0];
//    assign mult_result[63]=Read_data_1[31]^Read_data_2[31];
//    assign multu_result=Read_data_1*Read_data_2;
    
    
    
    always @(negedge clock) begin
        Read_data_1=Read_data_1_in;
        Read_data_2=Read_data_2_in;
        
        Block=0;
        OF=0;
        CF=0;
        ER=0;
        
        if(Write_reg_en2==1) begin
            if(Direct_read_addr_1==Direct_write_addr2) Read_data_1=Direct_write_data2;
            if(Direct_read_addr_2==Direct_write_addr2) Read_data_2=Direct_write_data2;
        end
              
        if(Write_reg_en1==1) begin
            if(Write_raed_data_en1==0&&Mfc01==0) begin
                if(Direct_read_addr_1==Direct_write_addr1) Read_data_1=Direct_write_data1;
                if(Direct_read_addr_2==Direct_write_addr1) Read_data_2=Direct_write_data1;
            end else begin
                if((Direct_read_addr_1==Direct_write_addr1)&&(If_read[0]==1)) Block=1;
                if((Direct_read_addr_2==Direct_write_addr1)&&(If_read[1]==1)) Block=1;
            end          
        end
        
        //[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
        //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav 
        if(ALU_op_in==4'b0001) begin
            if(I_format_in==1'b0) begin
               //add
               ALU_result=Read_data_1+Read_data_2;
               if((Read_data_1[31]==Read_data_2[31])&&(ALU_result[31]!=Read_data_1[31])) begin
                   OF=1;
               end else begin
                   OF=0;
               end
            end
            if(I_format_in==1'b1) begin
               //addi
               ALU_result=Read_data_1+Extend_imme_in;
               if((Read_data_1[31]==Extend_imme_in[31])&&(ALU_result[31]!=Read_data_1[31])) begin
                   OF=1;
               end else begin
                   OF=0;
               end               
            end
        end
        
        if(ALU_op_in==4'b0010) begin
            if(I_format_in==1'b0) begin
               //addu
               ALU_result=Read_data_1+Read_data_2;
               Temp=Read_data_1+Read_data_2;
               if(Temp[32]==1) begin
                   CF=1;
               end else begin
                   CF=0;
               end
            end
            if(I_format_in==1'b1) begin
               //addui
               ALU_result=Read_data_1+Extend_imme_in;
               Temp=Read_data_1+Extend_imme_in;
               if(Temp[32]==1) begin
                   CF=1;
               end else begin
                   CF=0;
               end               
            end
        end   
        
        if(ALU_op_in==4'b0011) begin
            //sub
            ALU_result=Read_data_1-Read_data_2;
            if((Read_data_1[31]!=Read_data_2[31])&&(ALU_result[31]!=Read_data_1[31])) begin
                OF=1;
            end else begin
                OF=0;
            end
        end   
        
        if(ALU_op_in==4'b0100) begin
            //subu
            ALU_result=Read_data_1-Read_data_2;
            if(Read_data_1<Read_data_2) begin
                CF=1;
            end else begin
                CF=0;
            end
        end     
        
        if(ALU_op_in==4'b0101) begin
            //mult
            mult_result[62:0]=Read_data_1[30:0]*Read_data_2[30:0]; 
            mult_result[63]=Read_data_1[31]^Read_data_2[31];       
            ALU_result_HI=mult_result[63:32];
            ALU_result_LO=mult_result[31:0];
        end
        
        if(ALU_op_in==4'b0110) begin
            //multu
            multu_result=Read_data_1*Read_data_2;  
            ALU_result_HI=multu_result[63:32];
            ALU_result_LO=multu_result[31:0];            
        end
        
        if(ALU_op_in==4'b0111) begin
            //div
            ALU_result_HI[30:0]=Read_data_1[30:0]%Read_data_2[30:0];
            ALU_result_LO[30:0]=Read_data_1[30:0]/Read_data_2[30:0];  
            ALU_result_HI[31]=Read_data_1[31];
            ALU_result_LO[31]=Read_data_1[31]^Read_data_2[31];
            if(ALU_result_HI[30:0]==31'b0) begin
                ALU_result_HI[31]=0;
            end
            if(Read_data_2==0) begin
                ER=1;
            end else begin
                ER=0;
            end
        end
        
        if(ALU_op_in==4'b1000) begin
            //divu
            ALU_result_HI=Read_data_1%Read_data_2;
            ALU_result_LO=Read_data_1/Read_data_2;   
            if(Read_data_2==0) begin
                ER=1;
            end else begin
                ER=0;
            end                       
        end
        
        if(ALU_op_in==4'b1001) begin
            if(I_format_in==1'b0) begin
               //and
               ALU_result=Read_data_1&Read_data_2;
            end
            if(I_format_in==1'b1) begin
               //andi
               ALU_result=Read_data_1&Extend_imme_in;
            end
        end
        
        if(ALU_op_in==4'b1010) begin
            if(I_format_in==1'b0) begin
               //or
               ALU_result=Read_data_1|Read_data_2;
            end
            if(I_format_in==1'b1) begin
               //ori
               ALU_result=Read_data_1|Extend_imme_in;
            end
        end
        
        if(ALU_op_in==4'b1011) begin
            if(I_format_in==1'b0) begin
               //xor
               ALU_result=Read_data_1^Read_data_2;
            end
            if(I_format_in==1'b1) begin
               //xori
               ALU_result=Read_data_1^Extend_imme_in;
            end
        end
        
        if(ALU_op_in==4'b1100) begin
            //nor
            ALU_result=~(Read_data_1^Read_data_2);
        end
        
        if(ALU_op_in==4'b1101) begin
            if(Shift_opnum_in==1'b0) begin
               //sll
               ALU_result=Read_data_2<<Shamt_in;
            end
            if(Shift_opnum_in==1'b1) begin
               //sllv
               ALU_result=Read_data_2<<Read_data_1;
            end
        end
        
        if(ALU_op_in==4'b1110) begin
            if(Shift_opnum_in==1'b0) begin
               //srl
               ALU_result=Read_data_2>>Shamt_in;
            end
            if(Shift_opnum_in==1'b1) begin
               //srlv
               ALU_result=Read_data_2>>Read_data_1;
            end
        end
        
        if(ALU_op_in==4'b1111) begin
            if(Shift_opnum_in==1'b0) begin
               //sra
               ALU_result=$signed(Read_data_2)>>>Shamt_in;
            end
            if(Shift_opnum_in==1'b1) begin
               //srav
               ALU_result=$signed(Read_data_2)>>>Read_data_1;
            end
        end                                                                                           
        
        if(Lui_in==1'b1) begin
            //lui
            ALU_result[31:16]=Imme_in;
            ALU_result[15:0]=16'b0;
        end     
        
        //Zero
        Zero=(Read_data_1[31:0]==Read_data_2[31:0]);
        
        //Less
        if(Slt_in==4'b0001) begin//slt
            if((Read_data_1[31]==0)&&(Read_data_2[31]==0))
                Less=(Read_data_1[30:0]<Read_data_2[30:0]);
            else if((Read_data_1[31]==0)&&(Read_data_2[31]==1))
                Less=0;
            else if((Read_data_1[31]==1)&&(Read_data_2[31]==0))
                Less=1;
            else if((Read_data_1[31]==1)&&(Read_data_2[31]==1))
                Less=~(Read_data_1[30:0]<=Read_data_2[30:0]);
        end else if(Slt_in==4'b0010) begin//sltu
            if(Read_data_1<Read_data_2) Less=1;
            else Less=0;
        end else if(Slt_in==4'b0100) begin//slti
            if((Read_data_1[31]==0)&&(Extend_imme_in[31]==0))
                Less=(Read_data_1[30:0]<Extend_imme_in[30:0]);
            else if((Read_data_1[31]==0)&&(Extend_imme_in[31]==1))
                Less=0;
            else if((Read_data_1[31]==1)&&(Extend_imme_in[31]==0))
                Less=1;
            else if((Read_data_1[31]==1)&&(Extend_imme_in[31]==1))
                Less=~(Read_data_1[30:0]<=Extend_imme_in[30:0]);
        end else if(Slt_in==4'b1000) begin//sltiu
            if(Read_data_1<Extend_imme_in) Less=1;
            else Less=0;            
        end else begin //(rs)<0?
            if(Read_data_1[31]==1) Less=1;
            else if(Read_data_1[31]==0) Less=0;
        end
        
        //Bigger   
        //(rs)>0?
        if((Read_data_1[31]==0)&&(Read_data_1!=32'b0)) Bigger=1;
        else if((Read_data_1[31]==1)||(Read_data_1==32'b0))Bigger=0;
    end         
        
endmodule
