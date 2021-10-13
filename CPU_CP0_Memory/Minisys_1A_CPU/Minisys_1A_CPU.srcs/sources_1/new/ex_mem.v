`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 16:29:12
// Design Name: 
// Module Name: ex_mem
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

module ex_mem(
    //input 
    clock,
    Block,
    reset,
    clear_9,
    clear_1,
    //calculate PC
    PC_plus_4_in,
    PC_final_in,
    //ALU
    ALU_result_in,
    Zero_in,
    Less_in,
    Bigger_in,
    
    HI_in,
    LO_in,
    //Jal_in,
    Jalr_in,
    Slt_in,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    Mfhi_in,//read HI
    Mflo_in,//read LO
    Write_ALU_result_in,
    Write_read_data_in,    
    
    //write reg address
    RD_address_in,
    RT_address_in,
    
    //write reg address control
    Jal_in,
    Bgezal_in,
    Bltzal_in,
    I_format_in,
    Mfc0_in,
    Reg_write_en_in,      
    
    //write HI/LO reg
    ALU_result_HI_in,
    ALU_result_LO_in,
    HILO_write_en_in,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO      
    
    Read_data_1_in,
    Read_data_2_in,
    Mem_read_type_in,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    Mem_read_extend_in,//0-zero extend,1-sign extend
    Mem_write_type_in,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    Mem_write_en_in,//0-X,1-write memory 
    
    Jmp_in,
    Jr_in,
    Beq_in,
    Bne_in,
    Bgez_in,
    Bgtz_in,
    Blez_in,
    Bltz_in,
    
    //CP0
    //Mfc0_in
    Mtc0_in,
    Break_in,
    Syscall_in,
    Eret_in,
    Ins_invalid_in, 
    Sel_in,
    Code_in,
    
    OF_in,
    CF_in,
    ER_in,
    
    //output
    //Direct
    Direct_write_addr,
    Direct_write_data,
    //calculate PC
    PC_plus_4_out,
    PC_final_out,
    //ALU
    ALU_result_out,
    Zero_out,
    Less_out,
    Bigger_out,
    
    HI_out,
    LO_out,
    //Jal_in,
    Jalr_out,
    Slt_out,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    Mfhi_out,//read HI
    Mflo_out,//read LO
    Write_ALU_result_out,
    Write_read_data_out,    
    
    //write reg address
    RD_address_out,
    RT_address_out,
    
    //write reg address control
    Jal_out,
    Bgezal_out,
    Bltzal_out,
    I_format_out,
    Mfc0_out,
    Reg_write_en_out,      
    
    //write HI/LO reg
    ALU_result_HI_out,
    ALU_result_LO_out,
    HILO_write_en_out,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO      
    
    Read_data_1_out,
    Read_data_2_out,
    Mem_read_type_out,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    Mem_read_extend_out,//0-zero extend,1-sign extend
    Mem_write_type_out,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    Mem_write_en_out,//0-X,1-write memory     
    
    Jmp_out,
    Jr_out,
    Beq_out,
    Bne_out,
    Bgez_out,
    Bgtz_out,
    Blez_out,
    Bltz_out,
    
    //CP0
    //Mfc0_out
    Mtc0_out,
    Break_out,
    Syscall_out,
    Eret_out,
    Ins_invalid_out, 
    Sel_out,
    Code_out,  
    
    OF_out,
    CF_out,
    ER_out
    );
    
    //input 
    input clock;
    input Block;
    input reset,clear_9,clear_1;
    //calculate PC
    input [31:0] PC_plus_4_in;
    input [31:0] PC_final_in;
    //ALU
    input [31:0] ALU_result_in;
    input Zero_in;
    input Less_in;
    input Bigger_in;
    
    input [31:0] Read_data_2_in,Read_data_1_in;
    input [31:0] HI_in;
    input [31:0] LO_in;
    //Jal_in,
    input Jalr_in;
    input [3:0] Slt_in;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    input Mfhi_in;//read HI
    input Mflo_in;//read LO
    input Write_ALU_result_in;
    input Write_read_data_in;   
    
    //write reg address
    input [4:0] RD_address_in;
    input [4:0] RT_address_in;
    
    //write reg address control
    input Jal_in;
    input Bgezal_in;
    input Bltzal_in;
    input I_format_in;
    input Mfc0_in;
    input Reg_write_en_in;   
    
    //write HI/LO reg
    input [31:0] ALU_result_HI_in;
    input [31:0] ALU_result_LO_in;
    input [1:0] HILO_write_en_in;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO      
    
    input [1:0] Mem_read_type_in;//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    input Mem_read_extend_in;//0-zero extend,1-sign extend
    input [1:0] Mem_write_type_in;//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    input Mem_write_en_in;//0-X,1-write memory 
    
    input Jmp_in,Jr_in,Beq_in,Bne_in,Bgez_in,Bgtz_in,Blez_in,Bltz_in;
    
    input Mtc0_in,Break_in,Syscall_in,Eret_in,Ins_invalid_in;
    input [2:0] Sel_in;
    input [19:0] Code_in;
    input OF_in,CF_in,ER_in;
    
    //output
    //Direct
    output reg [4:0] Direct_write_addr;
    output reg [31:0] Direct_write_data;
    //calculate PC
    output reg [31:0] PC_plus_4_out;
    output reg [31:0] PC_final_out;
    //ALU
    output reg [31:0] ALU_result_out;
    output reg Zero_out;
    output reg Less_out;
    output reg Bigger_out;
    
    output reg [31:0] Read_data_2_out,Read_data_1_out;
    output reg [31:0] HI_out;
    output reg [31:0] LO_out;
    //Jal_in,
    output reg Jalr_out;
    output reg [3:0] Slt_out;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    output reg Mfhi_out;//read HI
    output reg Mflo_out;//read LO
    output reg Write_ALU_result_out;
    output reg Write_read_data_out;   
    
    //write reg address
    output reg [4:0] RD_address_out;
    output reg [4:0] RT_address_out;
    
    //write reg address control
    output reg Jal_out;
    output reg Bgezal_out;
    output reg Bltzal_out;
    output reg I_format_out;
    output reg Mfc0_out;
    output reg Reg_write_en_out;    
    
    //write HI/LO reg
    output reg [31:0] ALU_result_HI_out;
    output reg [31:0] ALU_result_LO_out;
    output reg [1:0] HILO_write_en_out;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO      
    
    output reg [1:0] Mem_read_type_out;//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    output reg Mem_read_extend_out;//0-zero extend,1-sign extend
    output reg [1:0] Mem_write_type_out;//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    output reg Mem_write_en_out;//0-X,1-write memory      
    
    output reg Jmp_out,Jr_out,Beq_out,Bne_out,Bgez_out,Bgtz_out,Blez_out,Bltz_out;
    
    output reg Mtc0_out,Break_out,Syscall_out,Eret_out,Ins_invalid_out;
    output reg [2:0] Sel_out;
    output reg [19:0] Code_out;
    output reg OF_out,CF_out,ER_out;
    
    always @(posedge clock) begin   
        //Direct
        Direct_write_addr=0;
        Direct_write_data=0;
        if((I_format_in==1)||(Mfc0_in==1)) begin
            if(Mfc0_in==1) begin//mfc0
                Direct_write_addr=RT_address_in;
                //Direct_write_data=CP0_data_in;
            end else if(Write_ALU_result_in==1) begin//addi,addiu,andi,ori,xori,lui
                Direct_write_addr=RT_address_in;
                Direct_write_data=ALU_result_in;
            end else if(Write_read_data_in==1) begin//lb,lbu,lh,lhu,lw
                Direct_write_addr=RT_address_in;
                Direct_write_data=0;
            end else if((Bgezal_in==1)&&(Less_in==0)) begin//bgezal
                Direct_write_addr=5'b11111;
                Direct_write_data=PC_plus_4_in;
            end else if((Bltzal_in==1)&&(Less_in==1)) begin//bltzal
                Direct_write_addr=5'b11111;
                Direct_write_data=PC_plus_4_in;
            end else if(Slt_in==4'b0100) begin//slti
                if(Less_in==1) begin//(rt)<-1
                    Direct_write_addr=RT_address_in;
                    Direct_write_data=32'h1;
                end else begin//(rt)<-0
                    Direct_write_addr=RT_address_in;
                    Direct_write_data=32'h0;
                end
            end else if(Slt_in==4'b1000) begin//sltiu
                if(Less_in==1) begin//(rt)<-1
                    Direct_write_addr=RT_address_in;
                    Direct_write_data=32'h1;
                end else begin//(rt)<-0
                    Direct_write_addr=RT_address_in;
                    Direct_write_data=32'h0;
                end    
             end                
        end else begin//write (rd) or write $31(jal)
            if(Write_ALU_result_in==1) begin//add,addu,sub,subu,and,or,xor,nor,sll,srl,sra,sllv,srav.
                Direct_write_addr=RD_address_in;
                Direct_write_data=ALU_result_in;
            end else if(Mfhi_in==1) begin//mfhi
                Direct_write_addr=RD_address_in;
                Direct_write_data=HI_in;
            end else if(Mflo_in==1) begin//mflo
                Direct_write_addr=RD_address_in;
                Direct_write_data=LO_in;
            end else if(Slt_in==4'b0001) begin//slt
                if(Less_in==1) begin
                    Direct_write_addr=RD_address_in;
                    Direct_write_data=32'h1;
                end else begin
                    Direct_write_addr=RD_address_in;
                    Direct_write_data=32'h0;
                end
            end else if(Slt_in==4'b0010) begin//sltu
                if(Less_in==1) begin
                    Direct_write_addr=RD_address_in;
                    Direct_write_data=32'h1;
                end else begin
                    Direct_write_addr=RD_address_in;
                    Direct_write_data=32'h0;
                end
            end else if(Jalr_in==1) begin//jalr
                Direct_write_addr=RD_address_in;
                Direct_write_data=PC_plus_4_in;
            end else if(Jal_in==1) begin//jal
                Direct_write_addr=5'b11111;
                Direct_write_data=PC_plus_4_in;
            end
        end 
        //calculate PC
        PC_plus_4_out=PC_plus_4_in;
        PC_final_out=PC_final_in;
        //ALU
        ALU_result_out=ALU_result_in;
        Zero_out=Zero_in;
        Less_out=Less_in;
        Bigger_out=Bigger_in;
        Read_data_1_out=Read_data_1_in;
        Read_data_2_out=Read_data_2_in;
        HI_out=HI_in;
        LO_out=LO_in;
        //Jal_in
        Jalr_out=Jalr_in;
        Slt_out=Slt_in;
        Mfhi_out=Mfhi_in;
        Mflo_out=Mflo_in;
        Write_ALU_result_out=Write_ALU_result_in;
        Write_read_data_out=Write_read_data_in;  
                            
        //write reg address
        RD_address_out=RD_address_in;
        RT_address_out=RT_address_in;
                            
        //write reg address 
        Jal_out=Jal_in;
        Bgezal_out=Bgezal_in;
        Bltzal_out=Bltzal_in;
        I_format_out=I_format_in;
        Mfc0_out=Mfc0_in;
        Reg_write_en_out=Reg_write_en_in;    
                            
        //write HI/LO reg
        ALU_result_HI_out=ALU_result_HI_in;
        ALU_result_LO_out=ALU_result_LO_in;
        HILO_write_en_out=HILO_write_en_in;  
                            
        Mem_read_type_out=Mem_read_type_in;
        Mem_read_extend_out=Mem_read_extend_in;
        Mem_write_type_out=Mem_write_type_in;
        Mem_write_en_out=Mem_write_en_in;
        
        Jmp_out=Jmp_in;  
        Jr_out=Jr_in;    
        Beq_out=Beq_in;   
        Bne_out=Bne_in;   
        Bgez_out=Bgez_in; 
        Bgtz_out=Bgtz_in;  
        Blez_out=Blez_in; 
        Bltz_out=Bltz_in;
        
        Mtc0_out=Mtc0_in;
        Break_out=Break_in;
        Syscall_out=Syscall_in;
        Eret_out=Eret_in;
        Ins_invalid_out=Ins_invalid_in;
        Sel_out=Sel_in;
        Code_out=Code_in;  
        
        OF_out=OF_in;
        CF_out=CF_in;
        ER_out=ER_in;
        
        if(reset==1'b1||Block==1'b1||clear_9==1||clear_1==1) begin          
            //calculate PC      
            PC_plus_4_out=32'hX;   
            PC_final_out=32'hX;
            //ALU               
            ALU_result_out=32'hX;
            Zero_out=1'bX;       
            Less_out=1'bX;          
            Bigger_out=1'bX;        
            
            Read_data_1_out=32'hX;            
            Read_data_2_out=32'hX;
            HI_out=32'hX;        
            LO_out=32'hX; 
            //Jal_in,           
            Jalr_out=1'bX;     
            Slt_out=4'bX;
            Mfhi_out=1'bX;
            Mflo_out=1'bX;
            Write_ALU_result_out=1'bX;
            Write_read_data_out=1'bX;
                                
            //write reg address 
            RD_address_out=5'bX;
            RT_address_out=5'bX;   
                                
            //write reg address 
            Jal_out=1'bX;       
            Bgezal_out=1'bX;      
            Bltzal_out=1'bX; 
            I_format_out=1'bX;  
            Mfc0_out=1'bX;    
            Reg_write_en_out=1'bX;
                                
            //write HI/LO reg   
            ALU_result_HI_out=32'hX;
            ALU_result_LO_out=32'hX;
            HILO_write_en_out=2'bX;
                                
            Mem_read_type_out=2'bX;
            Mem_read_extend_out=1'bX;
            Mem_write_type_out=2'bX;
            Mem_write_en_out=1'bX;
            
            Jmp_out=1'bX;  
            Jr_out=1'bX;    
            Beq_out=1'bX;   
            Bne_out=1'bX;   
            Bgez_out=1'bX; 
            Bgtz_out=1'bX;  
            Blez_out=1'bX; 
            Bltz_out=1'bX;    
            
            Direct_write_addr=1'bX;
            Direct_write_data=1'bX;   
            
            Mtc0_out=1'bX;
            Break_out=1'bX;
            Syscall_out=1'bX;
            Eret_out=1'bX;
            Ins_invalid_out=1'hX;
            Sel_out=3'bX;
            Code_out=20'bX;     
            
            OF_out=1'bX;
            CF_out=1'bX;
            ER_out=1'bX; 
        end
    end
endmodule
