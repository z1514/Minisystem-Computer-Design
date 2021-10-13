`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 16:29:12
// Design Name: 
// Module Name: mem_wb
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


module mem_wb(
    //input
    clock,
    reset,
    //Direct
    Direct_write_addr_in,
    Direct_write_data_in,
    //memory output
    Read_data_in,
    IO_data_in,
    
    //needed input
    //write back
    //write reg data
    ALU_result_in,
    //Read_data,//Mem or I/O
    HI_in,
    LO_in,
    PC_plus_4_in,
    //CP0_data_in,
    
    //write reg data control
    //Jal_in,
    Jalr_in,
    Slt_in,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    Mfhi_in,//read HI
    Mflo_in,//read LO
    Write_ALU_result_in,
    Write_read_data_in,
    Less_in,
           
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
    Read_data_1_in,
    HILO_write_en_in,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    
    CP0_data_in,
    PC_CP0_in, 
    PC_CP0_en_in,
    
    //output
    //Direct
    Direct_write_addr_out,
    Direct_write_data_out,
    //memory output
    Read_data_out,
    
    //needed input
    //write back
    //write reg data
    ALU_result_out,
    //Read_data,//Mem or I/O
    HI_out,
    LO_out,
    PC_plus_4_out,
    //CP0_data_in,
    
    //write reg data control
    //Jal_in,
    Jalr_out,
    Slt_out,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    Mfhi_out,//read HI
    Mflo_out,//read LO
    Write_ALU_result_out,
    Write_read_data_out,
    Less_out,
           
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
    Read_data_1_out,
    HILO_write_en_out,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    CP0_data_out,
    PC_CP0_out,
    PC_CP0_en_out
    );
    
    //input
    input clock,reset;
    //Direct
    input [4:0] Direct_write_addr_in;
    input [31:0] Direct_write_data_in;
    //memory output
    input [31:0] Read_data_in,IO_data_in;
    
    //needed input
    //write back
    //write reg data
    input [31:0] ALU_result_in;
    //Read_data,//Mem or I/O
    input [31:0] HI_in;
    input [31:0] LO_in;
    input [31:0] PC_plus_4_in;
    //CP0_data_in,
    
    //write reg data control
    //Jal_in,
    input Jalr_in;
    input [3:0] Slt_in;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    input Mfhi_in,//read HI
          Mflo_in,//read LO
          Write_ALU_result_in,
          Write_read_data_in,
          Less_in;
           
    //write reg address
    input [4:0] RD_address_in;
    input [4:0] RT_address_in;
    
    //write reg address control
    input Jal_in,Bgezal_in,Bltzal_in,I_format_in,Mfc0_in,Reg_write_en_in;
    
    //write HI/LO reg
    input [31:0] ALU_result_HI_in;
    input [31:0] ALU_result_LO_in;
    input [31:0] Read_data_1_in;
    input [1:0] HILO_write_en_in;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    input [31:0] CP0_data_in;
    input [31:0] PC_CP0_in;
    input PC_CP0_en_in;
    
    //output
    //Direct
    output reg [4:0] Direct_write_addr_out;
    output reg [31:0] Direct_write_data_out;    
    //memory output
    output reg [31:0] Read_data_out;
    
    //needed input
    //write back
    //write reg data
    output reg [31:0] ALU_result_out;
    //Read_data,//Mem or I/O
    output reg [31:0] HI_out;
    output reg [31:0] LO_out;
    output reg [31:0] PC_plus_4_out;
    //CP0_data_in,
    
    //write reg data control
    //Jal_in,
    output reg Jalr_out;
    output reg [3:0] Slt_out;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    output reg 
    Mfhi_out,//read HI
    Mflo_out,//read LO
    Write_ALU_result_out,
    Write_read_data_out,
    Less_out; 
           
    //write reg address
    output reg [4:0] RD_address_out;
    output reg [4:0] RT_address_out;
    
    //write reg address control
    output reg Jal_out,Bgezal_out,Bltzal_out,I_format_out,Mfc0_out,Reg_write_en_out;
    
    //write HI/LO reg
    output reg [31:0] ALU_result_HI_out;
    output reg [31:0] ALU_result_LO_out;
    output reg [31:0] Read_data_1_out;
    output reg [1:0] HILO_write_en_out;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    output reg [31:0] CP0_data_out;
    output reg [31:0] PC_CP0_out; 
    output reg PC_CP0_en_out;
    
    always @(posedge clock) begin
        if(ALU_result_in[31:10]==22'h3FFFF) begin
            Read_data_out=IO_data_in;
        end else begin
            Read_data_out=Read_data_in;
        end
        
        if((Reg_write_en_in==1)&&(Write_read_data_in==1)) begin
            Direct_write_data_out=Read_data_in;
        end else if((Reg_write_en_in==1)&&(Mfc0_in==1)) begin
            Direct_write_data_out=CP0_data_in;
        end else begin
            Direct_write_data_out=Direct_write_data_in;
        end
        
        Direct_write_addr_out=Direct_write_addr_in;
        ALU_result_out=ALU_result_in;
        HI_out=HI_in;
        LO_out=LO_in;
        PC_plus_4_out=PC_plus_4_in;
        Jalr_out=Jalr_in;
        Slt_out=Slt_in;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_out=Mfhi_in;//read HI
        Mflo_out=Mflo_in;//read LO
        Write_ALU_result_out=Write_ALU_result_in;
        Write_read_data_out=Write_read_data_in;
        Less_out=Less_in;
        RD_address_out=RD_address_in;
        RT_address_out=RT_address_in;
        Jal_out=Jal_in;
        Bgezal_out=Bgezal_in;
        Bltzal_out=Bltzal_in;
        I_format_out=I_format_in;
        Mfc0_out=Mfc0_in;
        Reg_write_en_out=Reg_write_en_in;
        ALU_result_HI_out=ALU_result_HI_in;
        ALU_result_LO_out=ALU_result_LO_in;
        HILO_write_en_out=HILO_write_en_in;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
        CP0_data_out=CP0_data_in;
        PC_CP0_out=PC_CP0_in; 
        PC_CP0_en_out=PC_CP0_en_in;
        Read_data_1_out=Read_data_1_in;
        
        if(reset==1) begin
            Direct_write_addr_out=5'bX;
            Direct_write_data_out=32'bX;
            Read_data_out=32'bX;
            ALU_result_out=32'bX;
            HI_out=32'bX;
            LO_out=32'bX;
            PC_plus_4_out=32'bX;
            Jalr_out=1'hX;
            Slt_out=4'hX;
            Mfhi_out=1'hX;
            Mflo_out=1'hX;
            Write_ALU_result_out=1'hX;
            Write_read_data_out=1'hX;
            Less_out=1'hX;
            RD_address_out=5'hX;
            RT_address_out=5'hX;
            Jal_out=1'hX;
            Bgezal_out=1'hX;
            Bltzal_out=1'hX;
            I_format_out=1'hX;
            Mfc0_out=1'hX;
            Reg_write_en_out=1'hX;
            ALU_result_HI_out=32'bX;
            ALU_result_LO_out=32'bX;
            HILO_write_en_out=2'hX;
            CP0_data_out=32'bX;
            PC_CP0_out=32'bX;
            PC_CP0_en_out=1'hX;       
            Read_data_1_out=32'bX;   
        end
    end 
     
endmodule
