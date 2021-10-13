`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 16:29:12
// Design Name: 
// Module Name: execute_instruction
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


module execute_instruction(
    //input 
    clock,
    reset,
    //Direct
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
    //PC data
    PC_plus_4_in,
    Extend_imme_in,
    Read_data_1,
    //PC control
    Jmp_in,
    Jal_in,
    Jr_in,
    Jalr_in,
    Beq_in,
    Bne_in,
    Bgez_in,
    Bgtz_in,
    Blez_in,
    Bltz_in,
    Bgezal_in,
    Bltzal_in,
    //ALU
    Read_data_2,
    //Extend_imme_in
    I_format_in,
    Shamt_in,
    Imme_in,
    Lui_in,
    Slt_in,//[3:0]
    Shift_opnum_in,//0-shamt,1-(rs)
    ALU_op_in,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav    
    
    //output
    //block
    Block,
    Read_data_1_out,
    Read_data_2_out,    
    //PC
    PC_final_out,
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
    //PC data
    input [31:0] PC_plus_4_in;
    input [31:0] Extend_imme_in;
    input [31:0] Read_data_1;
    //PC control
    input Jmp_in;
    input Jal_in;
    input Jr_in;
    input Jalr_in;
    input Beq_in;
    input Bne_in;
    input Bgez_in;
    input Bgtz_in;
    input Blez_in;
    input Bltz_in;
    input Bgezal_in;
    input Bltzal_in;
    input [31:0] Read_data_2;
    input I_format_in;
    input [4:0] Shamt_in;
    input [15:0] Imme_in;
    input Lui_in;
    input [3:0] Slt_in;//[3:0]
    input Shift_opnum_in;//0-shamt,1-(rs)
    input [3:0] ALU_op_in;//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav       
    
    //output
    //block
    output Block;
    output [31:0] Read_data_1_out;
    output [31:0] Read_data_2_out;
    //PC
    output [31:0] PC_final_out; 
    //ALU
    output [31:0] ALU_result,ALU_result_HI,ALU_result_LO;
    output Zero;
    output Less;
    output Bigger;
    output OF,CF,ER;
    
    calculate_PC U0(
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
    
    ALU U1(
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
        
        Read_data_1,
        Read_data_2,
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
        Read_data_1_out,
        Read_data_2_out,
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
    
endmodule