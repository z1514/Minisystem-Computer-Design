`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 16:29:12
// Design Name: 
// Module Name: decode_instruction
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


module decode_instruction(
    //input
    clock,
    reset,
    
    Instruction_in,
    
    //write reg data
    ALU_result,
    Read_data,//Mem or I/O
    HI_in,
    LO_in,
    PC_plus_4_in,
    CP0_data_in,
    
    //write reg data control
    //Jal_in
    Jalr_in,
    Slt_in,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    Mfhi_in,//read HI
    Mflo_in,//read LO
    Write_ALU_result_in,
    Write_read_data_in,
    Less,
           
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
    ALU_result_HI,
    ALU_result_LO,
    Read_data_1_in,
    HILO_write_en_in,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    
    
    //output
    //Direct
    Direct_read_addr_1,
    Direct_read_addr_2,
    If_read,
    //data
    Read_data_1,
    Read_data_2,
    Extend_imme,  
    HI_out,
    LO_out,
    Shamt_out,
    Imme_out,
    //address
    RD_address_out,
    RT_address_out,    
    //control
    I_format_out,
    Jmp_out,
    Jal_out,
    Jr_out,
    Jalr_out,
    Beq_out,
    Bne_out,
    Bgez_out,
    Bgtz_out,
    Blez_out,
    Bltz_out,
    Bgezal_out,
    Bltzal_out,
    Lui_out,
    Slt_out,//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    Mfhi_out,
    Mflo_out,
    Reg_write_en_out,
    HILO_write_en_out,
    Write_ALU_result_out,//judge if write reg from ALU_result
    Write_read_data_out,//judge if write reg from memory
    Mem_read_type,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    Mem_read_extend,//0-zero extend,1-sign extend
    Mem_write_type,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    Mem_write_en,//0-X,1-write memory 
    
    //ALU
    Shift_opnum,//0-shamt,1-(rs)
    ALU_op,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
    
    //CP0
    Mfc0_out,
    Mtc0_out,
    Break_out,
    Syscall_out,
    Eret_out,
    Ins_invalid_out,
    Sel_out,
    Code_out
    );
    
    //input
    input clock,reset;
    
    input [31:0]Instruction_in;
    
    //write reg data
    input [31:0] ALU_result;
    input [31:0] Read_data;//Mem or I/O
    input [31:0] HI_in;
    input [31:0] LO_in;
    input [31:0] PC_plus_4_in;
    input [31:0] CP0_data_in;
    
    //write reg data control
    //Jal_in
    input Jalr_in,Bgezal_in,Bltzal_in;
    input [3:0] Slt_in;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    input Mfhi_in;//write reg from HI
    input Mflo_in;//write reg from LO
    input Write_ALU_result_in;
    input Write_read_data_in;
    input Less;
           
    //write reg address
    input [4:0] RD_address_in,RT_address_in;
    
    //write reg address control
    input Jal_in,I_format_in,Reg_write_en_in,Mfc0_in;
    
    //write HI/LO reg
    input [31:0] ALU_result_HI;
    input [31:0] ALU_result_LO;
    input [31:0] Read_data_1_in;
    input [1:0] HILO_write_en_in;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    
    
    //output
    //Direct
    output [4:0] Direct_read_addr_1,Direct_read_addr_2;
    output [1:0] If_read;
    //data
    output [31:0] Read_data_1;
    output [31:0] Read_data_2;
    output [31:0] Extend_imme;  
    output [31:0] HI_out;
    output [31:0] LO_out;
    output reg [4:0] Shamt_out;
    output reg [15:0] Imme_out;
    //address
    output reg [4:0] RD_address_out;
    output reg [4:0] RT_address_out;    
    //control
    output I_format_out;
    output Jmp_out;
    output Jal_out;
    output Jr_out;
    output Jalr_out;
    output Beq_out;
    output Bne_out;
    output Bgez_out;
    output Bgtz_out;
    output Blez_out;
    output Bltz_out;
    output Bgezal_out;
    output Bltzal_out;
    output Lui_out;
    output [3:0] Slt_out;//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    output Mfhi_out;
    output Mflo_out;
    output Reg_write_en_out;
    output [1:0]HILO_write_en_out;
    output Write_ALU_result_out;//judge if write reg from ALU_result
    output Write_read_data_out;//judge if write reg from memory
    output [1:0] Mem_read_type;//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    output Mem_read_extend;//0-zero extend,1-sign extend
    output [1:0] Mem_write_type;//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    output Mem_write_en;//0-X,1-write memory
    
    //ALU
    output Shift_opnum;//0-shamt,1-(rs)
    output [3:0] ALU_op;//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
    
    //CP0
    output Mfc0_out,Mtc0_out,Break_out,Syscall_out,Eret_out,Ins_invalid_out;
    output reg [2:0] Sel_out;
    output reg [19:0] Code_out;
   
    
   /* wire tempIfReg,tempIfAddr,ifSign,tempWriteRegEn,tempWriteMemEn,tempHIEn,tempLOEn,tempIfJump,tempOpNum;
    wire [3:0] tempResultCtrl;
    wire writeRegAddrSel;*/
    
    wire Imme_extend_type;
    
    decode U0(
        //input
        Instruction_in,
        //output
        //control
        I_format_out,
        Jmp_out,
        Jal_out,
        Jr_out,
        Jalr_out,
        Beq_out,
        Bne_out,
        Bgez_out,
        Bgtz_out,
        Blez_out,
        Bltz_out,
        Bgezal_out,
        Bltzal_out,
        Lui_out,
        Slt_out,//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_out,
        Mflo_out,
        Reg_write_en_out,
        HILO_write_en_out,
        Write_ALU_result_out,//judge if write reg from ALU_result
        Write_read_data_out,//judge if write reg from memory
        Mem_read_type,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
        Mem_read_extend,//0-zero extend,1-sign extend
        Mem_write_type,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
        Mem_write_en,//0-X,1-write memory
    
        //ALU
        Shift_opnum,//0-shamt,1-(rs)
        ALU_op,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
               //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
    
        //CP0
        Mfc0_out,
        Mtc0_out,
        Break_out,
        Syscall_out,
        Eret_out,  
        Ins_invalid_out,   
    
        //inside
        Imme_extend_type,//0-zero extend,1-sign extend
        
        If_read
        );
        
    extend U1(
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
        Extend_imme
        );
    
    registers U2(
        //input
        clock,
        //function read
        Instruction_in,
        Mfc0_out,
        Mtc0_out,
        //function write
        //write reg data
        ALU_result,
        Read_data,//Mem or I/O
        HI_in,
        LO_in,
        PC_plus_4_in,  
        CP0_data_in,
        //write reg data control
        //Jal_in
        Jalr_in,
        Slt_in,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_in,//write reg from HI
        Mflo_in,//write reg from LO
        Write_ALU_result_in,
        Write_read_data_in,   
        Less,       
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
    
        //output
        //function read
        Read_data_1,
        Read_data_2,
        Direct_read_addr_1,
        Direct_read_addr_2
        );
    
    HILOreg U3(
        //input
        clock,
        //write HI/LO reg
        ALU_result_HI,
        ALU_result_LO,
        Read_data_1_in,
        HILO_write_en_in,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    
        //output
        HI_out,
        LO_out
        );
        
    always @(negedge clock) begin      
        //Shamt_out
        Shamt_out=Instruction_in[10:6];
        
        //Imme_out
        Imme_out=Instruction_in[15:0];
        
        //RD_address_out
        RD_address_out=Instruction_in[15:11];
        
        //RT_address_out
        RT_address_out=Instruction_in[20:16];
        
        //Sel_out
        Sel_out=Instruction_in[2:0];
        
        //Code_out
        Code_out=Instruction_in[25:6];
        
    end
    
endmodule
