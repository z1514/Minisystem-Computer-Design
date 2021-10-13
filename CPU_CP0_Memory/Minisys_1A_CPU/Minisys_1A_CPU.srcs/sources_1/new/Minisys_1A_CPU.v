`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 23:22:41
// Design Name: 
// Module Name: Minisys_1A_CPU
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


module Minisys_1A_CPU(
    //input
    clock,
    reset,
    
    //output
    //1: fetch instruction /instruction memory
    PC_plus_4_1_out,PC_1_out,Instruction_1_out,clear_1_out,    
    
    //2: if id
    PC_plus_4_2_out,Instruction_2_out,   
    
    //3: decode instruction
    Direct_read_addr_1_3_out,Direct_read_addr_2_3_out,If_read_3_out,
    Read_data_1_3_out,Read_data_2_3_out,Extend_imme_3_out,HI_3_out,LO_3_out,
    Shamt_3_out,
    Imme_3_out,
    RD_address_3_out,RT_address_3_out,
    I_format_3_out,Jmp_3_out,Jal_3_out,Jr_3_out,Jalr_3_out,Beq_3_out,Bne_3_out,Bgez_3_out,Bgtz_3_out,Blez_3_out,Bltz_3_out,Bgezal_3_out,Bltzal_3_out,
          Lui_3_out,Mfhi_3_out,Mflo_3_out,Reg_write_en_3_out,Write_ALU_result_3_out,Write_read_data_3_out,Mem_read_extend_3_out,
          Mem_write_en_3_out,Shift_opnum_3_out,Mfc0_3_out,Mtc0_3_out,Break_3_out,Syscall_3_out,Eret_3_out,
    Slt_3_out,ALU_op_3_out,
    HILO_write_en_3_out,Mem_read_type_3_out,Mem_write_type_3_out,
    Sel_3_out,
    Code_3_out,
    Ins_invalid_3_out,
                 
    //4: id ex
    PC_plus_4_4_out,Direct_read_addr_1_4_out,Direct_read_addr_2_4_out,If_read_4_out,
    Read_data_1_4_out,Read_data_2_4_out,Extend_imme_4_out,HI_4_out,LO_4_out,
    Shamt_4_out,RD_address_4_out,RT_address_4_out,
    Imme_4_out,
    I_format_4_out,Jmp_4_out,Jal_4_out,Jr_4_out,Jalr_4_out,Beq_4_out,Bne_4_out,Bgez_4_out,Bgtz_4_out,Blez_4_out,Bltz_4_out,Bgezal_4_out,Bltzal_4_out,
          Lui_4_out,Mfhi_4_out,Mflo_4_out,Reg_write_en_4_out,Write_ALU_result_4_out,Write_read_data_4_out,Mem_read_extend_4_out,
          Mem_write_en_4_out,Shift_opnum_4_out,Mfc0_4_out,Mtc0_4_out,Break_4_out,Syscall_4_out,Eret_4_out,
    Slt_4_out,ALU_op_4_out,
    HILO_write_en_4_out,Mem_read_type_4_out,Mem_write_type_4_out,
    Sel_4_out,
    Code_4_out,
    Ins_invalid_4_out,
    
    //5: execute instruction
    PC_5_out,ALU_result_5_out,ALU_result_HI_5_out,ALU_result_LO_5_out,
    Zero_5_out,Less_5_out,Bigger_5_out,
    Block_5_out,        
    Read_data_1_5_out,Read_data_2_5_out,
    OF_5_out,CF_5_out,ER_5_out,
    
    //6: ex mem
    Jmp_6_out,Jal_6_out,Jr_6_out,Jalr_6_out,Beq_6_out,Bne_6_out,Bgez_6_out,Bgtz_6_out,Blez_6_out,Bltz_6_out,Bgezal_6_out,Bltzal_6_out,Zero_6_out,
          Bigger_6_out,Less_6_out,Mfhi_6_out,Mflo_6_out,Write_ALU_result_6_out,Write_read_data_6_out,I_format_6_out,Mfc0_6_out,
          Reg_write_en_6_out,Mem_read_extend_6_out,Mem_write_en_6_out,
    Read_data_1_6_out,PC_6_out,PC_plus_4_6_out,ALU_result_6_out,HI_6_out,LO_6_out,ALU_result_HI_6_out,ALU_result_LO_6_out,
                 Read_data_2_6_out,
    Slt_6_out,
    RD_address_6_out,RT_address_6_out,
    HILO_write_en_6_out,Mem_read_type_6_out,Mem_write_type_6_out, 
    //Direct
    Direct_write_addr_6_out,
    Direct_write_data_6_out, 
    //CP0
    Mtc0_6_out,
    Break_6_out,
    Syscall_6_out,
    Eret_6_out,
    Ins_invalid_6_out,
    Sel_6_out,
    Code_6_out, 
    
    OF_6_out,
    CF_6_out,
    ER_6_out,

    //10: Mem or IO
    IO_data_10_out,
   // Pulse0,Pulse1,Count0,Count1,Pwm,
    //digital,ens,Row,Col,switches,
      leds_10,leds_high_10,
    
    //7: access data memory 
    Read_data_7_out,
    
    //9:CP0
    Access_error_9_out,
    CP0_data_9_out,
    PC_9_out,
    PC_CP0_en_9_out,
    clear_9_out,
    Interrupt_respond_9_out,
    EPC_out,
    
    //8: mem wb
    ALU_result_8_out,Read_data_8_out,HI_8_out,LO_8_out,PC_plus_4_8_out,CP0_data_8_out,ALU_result_HI_8_out,
                 ALU_result_LO_8_out,
    Jalr_8_out,Mfhi_8_out,Mflo_8_out,Write_ALU_result_8_out,Write_read_data_8_out,Less_8_out,
          Jal_8_out,Bgezal_8_out,Bltzal_8_out,I_format_8_out,Mfc0_8_out,Reg_write_en_8_out,
    Slt_8_out,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    RD_address_8_out,RT_address_8_out,
    HILO_write_en_8_out,
    Direct_write_addr_8_out,
    Direct_write_data_8_out,
    PC_8_out,
    PC_CP0_en_8_out,
    Read_data_1_8_out,
    
    //10: External device
    External_interrupt_10_out 
);
    //input
    input clock,reset;
    
    //output for test
    //1: fetch instruction /instruction memory
    output reg [31:0] PC_plus_4_1_out,PC_1_out,Instruction_1_out; 
    output reg clear_1_out;   
    
    //2: if id
    output reg  [31:0] PC_plus_4_2_out,Instruction_2_out;   
    
    //3: decode instruction
    //Direct
    output reg [4:0] Direct_read_addr_1_3_out,Direct_read_addr_2_3_out;
    output reg [1:0] If_read_3_out;
    output reg  [31:0] Read_data_1_3_out,Read_data_2_3_out,Extend_imme_3_out,HI_3_out,LO_3_out;
    output reg  [4:0] Shamt_3_out;
    output reg  [15:0] Imme_3_out;
    output reg  [4:0] RD_address_3_out,RT_address_3_out; 
    output reg  I_format_3_out,Jmp_3_out,Jal_3_out,Jr_3_out,Jalr_3_out,Beq_3_out,Bne_3_out,Bgez_3_out,Bgtz_3_out,Blez_3_out,Bltz_3_out,Bgezal_3_out,Bltzal_3_out,
          Lui_3_out,Mfhi_3_out,Mflo_3_out,Reg_write_en_3_out,Write_ALU_result_3_out,Write_read_data_3_out,Mem_read_extend_3_out,
          Mem_write_en_3_out,Shift_opnum_3_out,Mfc0_3_out,Mtc0_3_out,Break_3_out,Syscall_3_out,Eret_3_out;
    output reg  [3:0] Slt_3_out,ALU_op_3_out;
    output reg  [1:0] HILO_write_en_3_out,Mem_read_type_3_out,Mem_write_type_3_out;
    output reg  [2:0] Sel_3_out;
    output reg  [19:0] Code_3_out;  
    output reg Ins_invalid_3_out; 
                 
    //4: id ex
    //Direct
    output reg [4:0] Direct_read_addr_1_4_out,Direct_read_addr_2_4_out;
    output reg [1:0] If_read_4_out;
    output reg  [31:0] PC_plus_4_4_out,Read_data_1_4_out,Read_data_2_4_out,Extend_imme_4_out,HI_4_out,LO_4_out;
    output reg  [4:0] Shamt_4_out,RD_address_4_out,RT_address_4_out;
    output reg  [15:0] Imme_4_out;  
       output reg  I_format_4_out,Jmp_4_out,Jal_4_out,Jr_4_out,Jalr_4_out,Beq_4_out,Bne_4_out,Bgez_4_out,Bgtz_4_out,Blez_4_out,Bltz_4_out,Bgezal_4_out,Bltzal_4_out,
          Lui_4_out,Mfhi_4_out,Mflo_4_out,Reg_write_en_4_out,Write_ALU_result_4_out,Write_read_data_4_out,Mem_read_extend_4_out;
        output reg  Mem_write_en_4_out,Shift_opnum_4_out,Mfc0_4_out,Mtc0_4_out,Break_4_out,Syscall_4_out,Eret_4_out;
    output reg  [3:0] Slt_4_out,ALU_op_4_out;
    output reg  [1:0] HILO_write_en_4_out,Mem_read_type_4_out,Mem_write_type_4_out;
    output reg  [2:0] Sel_4_out;
    output reg  [19:0] Code_4_out;  
    output reg Ins_invalid_4_out;
    
    //5: execute instruction
    output reg  [31:0] PC_5_out,ALU_result_5_out,ALU_result_HI_5_out,ALU_result_LO_5_out;
    output reg  Zero_5_out,Less_5_out,Bigger_5_out,Block_5_out;
    output reg [31:0] Read_data_1_5_out,Read_data_2_5_out;
    output reg OF_5_out,CF_5_out,ER_5_out;
    
    //6: ex mem
    output reg  Jmp_6_out,Jal_6_out,Jr_6_out,Jalr_6_out,Beq_6_out,Bne_6_out,Bgez_6_out,Bgtz_6_out,Blez_6_out,Bltz_6_out,Bgezal_6_out,Bltzal_6_out,Zero_6_out,
          Bigger_6_out,Less_6_out,Mfhi_6_out,Mflo_6_out,Write_ALU_result_6_out,Write_read_data_6_out,I_format_6_out,Mfc0_6_out,
          Reg_write_en_6_out,Mem_read_extend_6_out,Mem_write_en_6_out;
    output reg  [31:0] Read_data_1_6_out,PC_6_out,PC_plus_4_6_out,ALU_result_6_out,HI_6_out,LO_6_out,ALU_result_HI_6_out,ALU_result_LO_6_out,
                 Read_data_2_6_out;
    output reg  [3:0] Slt_6_out;
    output reg  [4:0] RD_address_6_out,RT_address_6_out;
    output reg  [1:0] HILO_write_en_6_out,Mem_read_type_6_out,Mem_write_type_6_out;
    //Direct
    output reg [4:0]Direct_write_addr_6_out;
    output reg [31:0]Direct_write_data_6_out; 
    output reg Mtc0_6_out,Break_6_out,Syscall_6_out,Eret_6_out,Ins_invalid_6_out;
    output reg [2:0] Sel_6_out;
    output reg [19:0] Code_6_out;
    
    output reg OF_6_out,CF_6_out,ER_6_out;  
    
    //10: Mem or IO
    output reg [31:0] IO_data_10_out; 
//    input Pulse0,Pulse1;
//    output reg Count0,Count1,Pwm;
//    output reg [7:0]digital,ens;
//    output reg [3:0] Row;
//    input [3:0] Col;
//    input [15:0] switches;
    output [15:0] leds_10;
    output [7:0] leds_high_10;  

    //7: access data memory 
    output reg  [31:0] Read_data_7_out;
    
    //9:CP0
    output reg Access_error_9_out;
    output reg [31:0] CP0_data_9_out;
    output reg [31:0] PC_9_out;
    output reg PC_CP0_en_9_out;
    output reg clear_9_out;
    output reg [5:0] Interrupt_respond_9_out;
    output reg [31:0] EPC_out;
    
    //8: mem wb
    output reg  [31:0] ALU_result_8_out,Read_data_8_out,HI_8_out,LO_8_out,PC_plus_4_8_out,CP0_data_8_out,ALU_result_HI_8_out,
                 ALU_result_LO_8_out;
    output reg  Jalr_8_out,Mfhi_8_out,Mflo_8_out,Write_ALU_result_8_out,Write_read_data_8_out,Less_8_out,
          Jal_8_out,Bgezal_8_out,Bltzal_8_out,I_format_8_out,Mfc0_8_out,Reg_write_en_8_out;
    output reg  [3:0] Slt_8_out;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    output reg  [4:0] RD_address_8_out,RT_address_8_out;
    output reg  [1:0] HILO_write_en_8_out;
    output reg  [4:0] Direct_write_addr_8_out;
    output reg  [31:0] Direct_write_data_8_out;
    output reg [31:0] PC_8_out;
    output reg PC_CP0_en_8_out;
    output reg [31:0] Read_data_1_8_out;
    
    //10: External device
    output reg [5:0] External_interrupt_10_out;
    
    //1: fetch instruction /instruction memory
    wire [31:0] PC_plus_4_1,PC_1,Instruction_1;    
    wire clear_1;
    
    //2: if id
    wire [31:0] PC_plus_4_2,Instruction_2;   
    
    //3: decode instruction
    wire [4:0] Direct_read_addr_1_3,Direct_read_addr_2_3;
    wire [1:0] If_read_3;
    wire [31:0] Read_data_1_3,Read_data_2_3,Extend_imme_3,HI_3,LO_3;
    wire [4:0] Shamt_3;
    wire [15:0] Imme_3;
    wire [4:0] RD_address_3,RT_address_3; 
    wire I_format_3,Jmp_3,Jal_3,Jr_3,Jalr_3,Beq_3,Bne_3,Bgez_3,Bgtz_3,Blez_3,Bltz_3,Bgezal_3,Bltzal_3,
          Lui_3,Mfhi_3,Mflo_3,Reg_write_en_3,Write_ALU_result_3,Write_read_data_3,Mem_read_extend_3,
          Mem_write_en_3,Shift_opnum_3,Mfc0_3,Mtc0_3,Break_3,Syscall_3,Eret_3;
    wire [3:0] Slt_3,ALU_op_3;
    wire [1:0] HILO_write_en_3,Mem_read_type_3,Mem_write_type_3;
    wire [2:0] Sel_3;
    wire [19:0] Code_3;   
    wire Ins_invalid_3;
                 
    //4: id ex
    wire [31:0] PC_plus_4_4,Read_data_1_4,Read_data_2_4,Extend_imme_4,HI_4,LO_4;
    wire [4:0] Direct_read_addr_1_4,Direct_read_addr_2_4;
    wire [1:0] If_read_4;
    wire [4:0] Shamt_4,RD_address_4,RT_address_4;
    wire [15:0] Imme_4;  
    wire I_format_4,Jmp_4,Jal_4,Jr_4,Jalr_4,Beq_4,Bne_4,Bgez_4,Bgtz_4,Blez_4,Bltz_4,Bgezal_4,Bltzal_4,
          Lui_4,Mfhi_4,Mflo_4,Reg_write_en_4,Write_ALU_result_4,Write_read_data_4,Mem_read_extend_4,
          Mem_write_en_4,Shift_opnum_4,Mfc0_4,Mtc0_4,Break_4,Syscall_4,Eret_4;
    wire [3:0] Slt_4,ALU_op_4;
    wire [1:0] HILO_write_en_4,Mem_read_type_4,Mem_write_type_4;
    wire [2:0] Sel_4;
    wire [19:0] Code_4;  
    wire Ins_invalid_4;
    
    //5: execute instruction
    wire [31:0] PC_5,ALU_result_5,ALU_result_HI_5,ALU_result_LO_5;
    wire Zero_5,Less_5,Bigger_5,Block_5;
    wire [31:0] Read_data_1_5,Read_data_2_5;
    wire OF_5,CF_5,ER_5;
    
    //6: ex mem
    wire Jmp_6,Jal_6,Jr_6,Jalr_6,Beq_6,Bne_6,Bgez_6,Bgtz_6,Blez_6,Bltz_6,Bgezal_6,Bltzal_6,Zero_6,
          Bigger_6,Less_6,Mfhi_6,Mflo_6,Write_ALU_result_6,Write_read_data_6,I_format_6,Mfc0_6,
          Reg_write_en_6,Mem_read_extend_6,Mem_write_en_6;
    wire [31:0] Read_data_1_6,PC_6,PC_plus_4_6,ALU_result_6,HI_6,LO_6,ALU_result_HI_6,ALU_result_LO_6,
                 Read_data_2_6;
    wire [3:0] Slt_6;
    wire [4:0] RD_address_6,RT_address_6;
    wire [1:0] HILO_write_en_6,Mem_read_type_6,Mem_write_type_6;  
    //Direct
    wire [4:0] Direct_write_addr_6;
    wire [31:0] Direct_write_data_6;
    //CP0
    wire Mtc0_6,Break_6,Syscall_6,Eret_6,Ins_invalid_6;
    wire [2:0] Sel_6;
    wire [19:0] Code_6;
    wire OF_6,CF_6,ER_6;
    
    //10: Mem or IO
    wire [31:0] IO_data_10;

    //7: access data memory 
    wire [31:0] Read_data_7;
    
    //9:CP0
    wire Access_error_9;
    wire [31:0] CP0_data_9;
    wire [31:0] PC_9;
    wire PC_CP0_en_9;
    wire clear_9;
    wire [5:0] Interrupt_respond_9;
    wire [31:0] EPC;
    
    //8: mem wb
    wire [31:0] ALU_result_8,Read_data_8,HI_8,LO_8,PC_plus_4_8,CP0_data_8,ALU_result_HI_8,
                 ALU_result_LO_8;
    wire Jalr_8,Mfhi_8,Mflo_8,Write_ALU_result_8,Write_read_data_8,Less_8,
          Jal_8,Bgezal_8,Bltzal_8,I_format_8,Mfc0_8,Reg_write_en_8;
    wire [3:0] Slt_8;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    wire [4:0] RD_address_8,RT_address_8;
    wire [1:0] HILO_write_en_8;
    wire [4:0] Direct_write_addr_8;
    wire [31:0] Direct_write_data_8;
    wire [31:0] PC_8;
    wire PC_CP0_en_8;    
    wire [31:0] Read_data_1_8;
    
    //10: External device
    wire [5:0] External_interrupt_10;
    
    always @( PC_plus_4_1,PC_1,Instruction_1,PC_plus_4_2,Instruction_2,Read_data_1_3,
             Read_data_2_3,Extend_imme_3,HI_3,LO_3,Shamt_3,Imme_3,RD_address_3,
             RT_address_3,I_format_3,Jmp_3,Jal_3,Jr_3,Jalr_3,Beq_3,Bne_3,
             Bgez_3,Bgtz_3,Blez_3,Bltz_3,Bgezal_3,Bltzal_3,Lui_3,Mfhi_3,
             Mflo_3,Reg_write_en_3,Write_ALU_result_3,Write_read_data_3,Mem_read_extend_3,
             Mem_write_en_3,Shift_opnum_3,Mfc0_3,Mtc0_3,Break_3,Syscall_3,Eret_3,
             Slt_3,ALU_op_3,HILO_write_en_3,Mem_read_type_3,Mem_write_type_3,Sel_3,
             Code_3,PC_plus_4_4,Read_data_1_4,Read_data_2_4,Extend_imme_4,HI_4,
             LO_4,Shamt_4,RD_address_4,RT_address_4,Imme_4,
               I_format_4,Jmp_4,
               Jal_4,Jr_4,Jalr_4,Beq_4,Bne_4,Bgez_4,Bgtz_4,Blez_4,Bltz_4,
               Bgezal_4,Bltzal_4,Lui_4,Mfhi_4,Mflo_4,Reg_write_en_4,
             Write_ALU_result_4,Write_read_data_4,Mem_read_extend_4,
                Mem_write_en_4,
             Shift_opnum_4,Mfc0_4,Mtc0_4,Break_4,Syscall_4,Eret_4,Slt_4,
             ALU_op_4,HILO_write_en_4,Mem_read_type_4,Mem_write_type_4,Sel_4,Code_4,
             PC_5,ALU_result_5,ALU_result_HI_5,ALU_result_LO_5,Zero_5,Less_5,
             Bigger_5,Jmp_6,Jal_6,Jr_6,Jalr_6,Beq_6,Bne_6,Bgez_6,
             Bgtz_6,Blez_6,Bltz_6,Bgezal_6,Bltzal_6,Zero_6,Bigger_6,Less_6,
             Mfhi_6,Mflo_6,Write_ALU_result_6,Write_read_data_6,I_format_6,Mfc0_6,
             Reg_write_en_6,Mem_read_extend_6,Mem_write_en_6,Read_data_1_6,PC_6,
             PC_plus_4_6,ALU_result_6,HI_6,LO_6,ALU_result_HI_6,ALU_result_LO_6,
             Read_data_2_6,Slt_6,RD_address_6,RT_address_6,HILO_write_en_6,
             Mem_read_type_6,Mem_write_type_6,Read_data_7,ALU_result_8,Read_data_8,
             HI_8,LO_8,PC_plus_4_8,CP0_data_8,ALU_result_HI_8,ALU_result_LO_8,
             Jalr_8,Mfhi_8,Mflo_8,Write_ALU_result_8,Write_read_data_8,Less_8,
             Jal_8,Bgezal_8,Bltzal_8,I_format_8,Mfc0_8,Reg_write_en_8,Slt_8,
             RD_address_8,RT_address_8,HILO_write_en_8,
             Direct_read_addr_1_3,Direct_read_addr_2_3,Direct_read_addr_1_4,Direct_read_addr_2_4,
             Direct_write_addr_6,Direct_write_data_6,Direct_write_addr_8,Direct_write_data_8,
             Block_5,Read_data_1_5,Read_data_2_5,
             Mtc0_6,Break_6,Syscall_6,Eret_6,Sel_6,Code_6,
             OF_5,CF_5,ER_5,OF_6,CF_6,ER_6,Access_error_9,CP0_data_9,
             PC_8,PC_9,PC_CP0_en_8,PC_CP0_en_9,clear_9,Ins_invalid_3,Ins_invalid_4,Ins_invalid_6,clear_1,
             Interrupt_respond_9,External_interrupt_10,If_read_3,If_read_4,EPC,IO_data_10,Read_data_1_8
               ) begin
    
        PC_plus_4_1_out=PC_plus_4_1;
        PC_1_out=PC_1;
        Instruction_1_out=Instruction_1;
        PC_plus_4_2_out=PC_plus_4_2;
        Instruction_2_out=Instruction_2;
        Read_data_1_3_out=Read_data_1_3;
        Read_data_2_3_out=Read_data_2_3;
        Extend_imme_3_out=Extend_imme_3;
        HI_3_out=HI_3;
        LO_3_out=LO_3;
        Shamt_3_out=Shamt_3;
        Imme_3_out=Imme_3;
        RD_address_3_out=RD_address_3;
        RT_address_3_out=RT_address_3;
        I_format_3_out=I_format_3;
        Jmp_3_out=Jmp_3;
        Jal_3_out=Jal_3;
        Jr_3_out=Jr_3;
        Jalr_3_out=Jalr_3;
        Beq_3_out=Beq_3;
        Bne_3_out=Bne_3;
        Bgez_3_out=Bgez_3;
        Bgtz_3_out=Bgtz_3;
        Blez_3_out=Blez_3;
        Bltz_3_out=Bltz_3;
        Bgezal_3_out=Bgezal_3;
        Bltzal_3_out=Bltzal_3;
        Lui_3_out=Lui_3;
        Mfhi_3_out=Mfhi_3;
        Mflo_3_out=Mflo_3;
        Reg_write_en_3_out=Reg_write_en_3;
        Write_ALU_result_3_out=Write_ALU_result_3;
        Write_read_data_3_out=Write_read_data_3;
        Mem_read_extend_3_out=Mem_read_extend_3;
        Mem_write_en_3_out=Mem_write_en_3;
        Shift_opnum_3_out=Shift_opnum_3;
        Mfc0_3_out=Mfc0_3;
        Mtc0_3_out=Mtc0_3;
        Break_3_out=Break_3;
        Syscall_3_out=Syscall_3;
        Eret_3_out=Eret_3;
        Slt_3_out=Slt_3;
        ALU_op_3_out=ALU_op_3;
        HILO_write_en_3_out=HILO_write_en_3;
        Mem_read_type_3_out=Mem_read_type_3;
        Mem_write_type_3_out=Mem_write_type_3;
        Sel_3_out=Sel_3;
        Code_3_out=Code_3;
        PC_plus_4_4_out=PC_plus_4_4;
        Read_data_1_4_out=Read_data_1_4;
        Read_data_2_4_out=Read_data_2_4;
        Extend_imme_4_out=Extend_imme_4;
        HI_4_out=HI_4;
        LO_4_out=LO_4;
        Shamt_4_out=Shamt_4;
        RD_address_4_out=RD_address_4;
        RT_address_4_out=RT_address_4;
        Imme_4_out=Imme_4;
           I_format_4_out=I_format_4;
           Jmp_4_out=Jmp_4;
           Jal_4_out=Jal_4;
           Jr_4_out=Jr_4;
           Jalr_4_out=Jalr_4;
           Beq_4_out=Beq_4;
           Bne_4_out=Bne_4;
           Bgez_4_out=Bgez_4;
           Bgtz_4_out=Bgtz_4;
           Blez_4_out=Blez_4;
           Bltz_4_out=Bltz_4;
           Bgezal_4_out=Bgezal_4;
           Bltzal_4_out=Bltzal_4;
        Lui_4_out=Lui_4;
        Mfhi_4_out=Mfhi_4;
        Mflo_4_out=Mflo_4;
        Reg_write_en_4_out=Reg_write_en_4;
        Write_ALU_result_4_out=Write_ALU_result_4;
        Write_read_data_4_out=Write_read_data_4;
        Mem_read_extend_4_out=Mem_read_extend_4;
          Mem_write_en_4_out=Mem_write_en_4;
        Shift_opnum_4_out=Shift_opnum_4;
        Mfc0_4_out=Mfc0_4;
        Mtc0_4_out=Mtc0_4;
        Break_4_out=Break_4;
        Syscall_4_out=Syscall_4;
        Eret_4_out=Eret_4;
        Slt_4_out=Slt_4;
        ALU_op_4_out=ALU_op_4;
        HILO_write_en_4_out=HILO_write_en_4;
        Mem_read_type_4_out=Mem_read_type_4;
        Mem_write_type_4_out=Mem_write_type_4;
        Sel_4_out=Sel_4;
        Code_4_out=Code_4;
        PC_5_out=PC_5;
        ALU_result_5_out=ALU_result_5;
        ALU_result_HI_5_out=ALU_result_HI_5;
        ALU_result_LO_5_out=ALU_result_LO_5;
        Zero_5_out=Zero_5;
        Less_5_out=Less_5;
        Bigger_5_out=Bigger_5;
        Jmp_6_out=Jmp_6;
        Jal_6_out=Jal_6;
        Jr_6_out=Jr_6;
        Jalr_6_out=Jalr_6;
        Beq_6_out=Beq_6;
        Bne_6_out=Bne_6;
        Bgez_6_out=Bgez_6;
        Bgtz_6_out=Bgtz_6;
        Blez_6_out=Blez_6;
        Bltz_6_out=Bltz_6;
        Bgezal_6_out=Bgezal_6;
        Bltzal_6_out=Bltzal_6;
        Zero_6_out=Zero_6;
        Bigger_6_out=Bigger_6;
        Less_6_out=Less_6;
        Mfhi_6_out=Mfhi_6;
        Mflo_6_out=Mflo_6;
        Write_ALU_result_6_out=Write_ALU_result_6;
        Write_read_data_6_out=Write_read_data_6;
        I_format_6_out=I_format_6;
        Mfc0_6_out=Mfc0_6;
        Reg_write_en_6_out=Reg_write_en_6;
        Mem_read_extend_6_out=Mem_read_extend_6;
        Mem_write_en_6_out=Mem_write_en_6;
        Read_data_1_6_out=Read_data_1_6;
        PC_6_out=PC_6;
        PC_plus_4_6_out=PC_plus_4_6;
        ALU_result_6_out=ALU_result_6;
        HI_6_out=HI_6;
        LO_6_out=LO_6;
        ALU_result_HI_6_out=ALU_result_HI_6;
        ALU_result_LO_6_out=ALU_result_LO_6;
        Read_data_2_6_out=Read_data_2_6;
        Slt_6_out=Slt_6;
        RD_address_6_out=RD_address_6;
        RT_address_6_out=RT_address_6;
        HILO_write_en_6_out=HILO_write_en_6;
        Mem_read_type_6_out=Mem_read_type_6;
        Mem_write_type_6_out=Mem_write_type_6;
        Read_data_7_out=Read_data_7;
        ALU_result_8_out=ALU_result_8;
        Read_data_8_out=Read_data_8;
        HI_8_out=HI_8;
        LO_8_out=LO_8;
        PC_plus_4_8_out=PC_plus_4_8;
        CP0_data_8_out=CP0_data_8;
        ALU_result_HI_8_out=ALU_result_HI_8;
        ALU_result_LO_8_out=ALU_result_LO_8;
        Jalr_8_out=Jalr_8;
        Mfhi_8_out=Mfhi_8;
        Mflo_8_out=Mflo_8;
        Write_ALU_result_8_out=Write_ALU_result_8;
        Write_read_data_8_out=Write_read_data_8;
        Less_8_out=Less_8;
        Jal_8_out=Jal_8;
        Bgezal_8_out=Bgezal_8;
        Bltzal_8_out=Bltzal_8;
        I_format_8_out=I_format_8;
        Mfc0_8_out=Mfc0_8;
        Reg_write_en_8_out=Reg_write_en_8;
        Slt_8_out=Slt_8;
        RD_address_8_out=RD_address_8;
        RT_address_8_out=RT_address_8;
        HILO_write_en_8_out=HILO_write_en_8;
        Direct_read_addr_1_3_out=Direct_read_addr_1_3;
        Direct_read_addr_2_3_out=Direct_read_addr_2_3;
        //Direct
        Direct_read_addr_1_4_out=Direct_read_addr_1_4;
        Direct_read_addr_2_4_out=Direct_read_addr_2_4;
        Direct_write_addr_6_out=Direct_write_addr_6;
        Direct_write_data_6_out=Direct_write_data_6;
        Direct_write_addr_8_out=Direct_write_addr_8;
        Direct_write_data_8_out=Direct_write_data_8;
        Block_5_out=Block_5;
        Read_data_1_5_out=Read_data_1_5;
        Read_data_2_5_out=Read_data_2_5;
        //CP0
        Mtc0_6_out=Mtc0_6;
        Break_6_out=Break_6;
        Syscall_6_out=Syscall_6;
        Eret_6_out=Eret_6;
        Sel_6_out=Sel_6;
        Code_6_out=Code_6;
        
        OF_5_out=OF_5;
        CF_5_out=CF_5;
        ER_5_out=ER_5;
        
        OF_6_out=OF_6;
        CF_6_out=CF_6;
        ER_6_out=ER_6;
        
        Access_error_9_out=Access_error_9;
        
        CP0_data_9_out=CP0_data_9;
        
        PC_8_out=PC_8;               
        PC_9_out=PC_9;               
        PC_CP0_en_8_out=PC_CP0_en_8;        
        PC_CP0_en_9_out=PC_CP0_en_9;     
        clear_9_out=clear_9;   
        Ins_invalid_3_out=Ins_invalid_3;
        Ins_invalid_4_out=Ins_invalid_4;
        Ins_invalid_6_out=Ins_invalid_6;
        
        clear_1_out=clear_1;
        
        Interrupt_respond_9_out=Interrupt_respond_9;
        
        //External_interrupt_10_out=External_interrupt_10;
        External_interrupt_10_out=6'b111111;
        
        If_read_3_out=If_read_3;
        If_read_4_out=If_read_4;
        
        EPC_out=EPC;
        
        IO_data_10_out=IO_data_10;
        
        Read_data_1_8_out=Read_data_1_8;
    end

 
    //fetch_instruction
    fetch_instruction U0(
        //input
        reset,
        clock,
        Block_5,
        
        Jmp_6,//j instruction
        Jal_6,//jal instruction
        Jr_6,//jr ins
        Jalr_6,//jalr ins
        Beq_6,//beq ins (rt)==(rs)
        Bne_6,//bne ins (rt)!=(rs)
        Bgez_6,//bgez ins (rs)>=0
        Bgtz_6,//bgtz ins (rs)>0
        Blez_6,//blez ins (rs)<=0
        Bltz_6,//bltz ins (rs)<0
        Bgezal_6,//bgezal ins (rs)>=0
        Bltzal_6,//bltzal ins (rs)<0
        Zero_6,//if (rs)==(rt) Zero=1, else Zero=0
        Bigger_6,//if (rs)>0 Bigger=1, else Bigger=0
        Less_6,//if (rs)<0 Less=1, else Less=0
        
        Read_data_1_6,//register data 1 (rs)
        PC_6,
        
        PC_8,
        PC_CP0_en_8,
        
        //output
        PC_plus_4_1,//PC+4
        PC_1,
        clear_1   
    );
    
    instruction_memory U1(
        //input
        clock,
        PC_1,
        
        //output
        Instruction_1
    );
    
    if_id U2(
        //input
        clock,
        Block_5,
        reset,
        clear_9,
        PC_plus_4_1,
        Instruction_1,
        //output
        PC_plus_4_2,
        Instruction_2    
    );
    
    decode_instruction U3(
        //input
        clock,
        reset,
        
        Instruction_2,
        
        //write reg data
        ALU_result_8,
        Read_data_8,//Mem or I/O
        HI_8,
        LO_8,
        PC_plus_4_8,
        CP0_data_8,
        
        //write reg data control
        //Jal_in
        Jalr_8,
        Slt_8,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_8,//read HI
        Mflo_8,//read LO
        Write_ALU_result_8,
        Write_read_data_8,
        Less_8,
               
        //write reg address
        RD_address_8,
        RT_address_8,
        
        //write reg address control
        Jal_8,
        Bgezal_8,
        Bltzal_8,
        I_format_8,
        Mfc0_8,
        Reg_write_en_8,
        
        //write HI/LO reg
        ALU_result_HI_8,
        ALU_result_LO_8,
        Read_data_1_8,
        HILO_write_en_8,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
        
        
        //output
        //Direct
        Direct_read_addr_1_3,
        Direct_read_addr_2_3,   
        If_read_3,
        //data
        Read_data_1_3,
        Read_data_2_3,
        Extend_imme_3,  
        HI_3,
        LO_3,
        Shamt_3,
        Imme_3,
        //address
        RD_address_3,
        RT_address_3,    
        //control
        I_format_3,
        Jmp_3,
        Jal_3,
        Jr_3,
        Jalr_3,
        Beq_3,
        Bne_3,
        Bgez_3,
        Bgtz_3,
        Blez_3,
        Bltz_3,
        Bgezal_3,
        Bltzal_3,
        Lui_3,
        Slt_3,//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_3,
        Mflo_3,
        Reg_write_en_3,
        HILO_write_en_3,
        Write_ALU_result_3,//judge if write reg from ALU_result
        Write_read_data_3,//judge if write reg from memory
        Mem_read_type_3,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
        Mem_read_extend_3,//0-zero extend,1-sign extend
        Mem_write_type_3,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
        Mem_write_en_3,//0-X,1-write memory 
        
        //ALU
        Shift_opnum_3,//0-shamt,1-(rs)
        ALU_op_3,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
               //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
        
        //CP0
        Mfc0_3,
        Mtc0_3,
        Break_3,
        Syscall_3,
        Eret_3,
        Ins_invalid_3, 
        Sel_3,
        Code_3
    );
    
    id_ex U4(
        //input
        clock,
        Block_5,
        reset,
        clear_9,
        clear_1,
        
        PC_plus_4_2,
        //Direct
        Direct_read_addr_1_3,
        Direct_read_addr_2_3,        
        If_read_3,
        //data
        Read_data_1_3,
        Read_data_2_3,
        Extend_imme_3,  
        HI_3,
        LO_3,
        Shamt_3,
        Imme_3,
        //address
        RD_address_3,
        RT_address_3,    
        //control
        I_format_3,
        Jmp_3,
        Jal_3,
        Jr_3,
        Jalr_3,
        Beq_3,
        Bne_3,
        Bgez_3,
        Bgtz_3,
        Blez_3,
        Bltz_3,
        Bgezal_3,
        Bltzal_3,
        Lui_3,
        Slt_3,//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_3,
        Mflo_3,
        Reg_write_en_3,
        HILO_write_en_3,
        Write_ALU_result_3,//judge if write reg from ALU_result
        Write_read_data_3,//judge if write reg from memory
        Mem_read_type_3,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
        Mem_read_extend_3,//0-zero extend,1-sign extend
        Mem_write_type_3,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
        Mem_write_en_3,//0-X,1-write memory 
        
        //ALU
        Shift_opnum_3,//0-shamt,1-(rs)
        ALU_op_3,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
               //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
        
        //CP0
        Mfc0_3,
        Mtc0_3,
        Break_3,
        Syscall_3,
        Eret_3,
        Ins_invalid_3,
        Sel_3,
        Code_3,
        
        //output
        PC_plus_4_4,
        
        //Direct
        Direct_read_addr_1_4,
        Direct_read_addr_2_4,        
        If_read_4,
        //data
        Read_data_1_4,
        Read_data_2_4,
        Extend_imme_4,  
        HI_4,
        LO_4,
        Shamt_4,
        Imme_4,
        //address
        RD_address_4,
        RT_address_4,    
        //control
        I_format_4,
        Jmp_4,
        Jal_4,
        Jr_4,
        Jalr_4,
        Beq_4,
        Bne_4,
        Bgez_4,
        Bgtz_4,
        Blez_4,
        Bltz_4,
        Bgezal_4,
        Bltzal_4,
        Lui_4,
        Slt_4,//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_4,
        Mflo_4,
        Reg_write_en_4,
        HILO_write_en_4,
        Write_ALU_result_4,//judge if write reg from ALU_result
        Write_read_data_4,//judge if write reg from memory
        Mem_read_type_4,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
        Mem_read_extend_4,//0-zero extend,1-sign extend
        Mem_write_type_4,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
        Mem_write_en_4,//0-X,1-write memory 
        
        //ALU
        Shift_opnum_4,//0-shamt,1-(rs)
        ALU_op_4,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
               //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
        
        //CP0
        Mfc0_4,
        Mtc0_4,
        Break_4,
        Syscall_4,
        Eret_4,
        Ins_invalid_4, 
        Sel_4,
        Code_4    
    );
    
    execute_instruction U5(
        //input 
        clock,
        reset,
        //Direct
        Direct_read_addr_1_4,
        Direct_read_addr_2_4,    
        If_read_4, 
        //input from ex_mem  
        Reg_write_en_6,
        Write_read_data_6,
        Mfc0_6,
        Direct_write_addr_6,
        Direct_write_data_6,
        //input from mem_wb  
        Reg_write_en_8,
        Write_read_data_8,
        Mfc0_8,
        Direct_write_addr_8,
        Direct_write_data_8,         
        //PC data
        PC_plus_4_4,
        Extend_imme_4,
        Read_data_1_4,
        //PC control
        Jmp_4,
        Jal_4,
        Jr_4,
        Jalr_4,
        Beq_4,
        Bne_4,
        Bgez_4,
        Bgtz_4,
        Blez_4,
        Bltz_4,
        Bgezal_4,
        Bltzal_4,
        //ALU
        Read_data_2_4,
        //Extend_imme_in
        I_format_4,
        Shamt_4,
        Imme_4,
        Lui_4,
        Slt_4,//[3:0]
        Shift_opnum_4,//0-shamt,1-(rs)
        ALU_op_4,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
               //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav    
        
        //output
        Block_5,
        Read_data_1_5,
        Read_data_2_5,        
        //PC
        PC_5,
        //ALU
        ALU_result_5,
        ALU_result_HI_5,
        ALU_result_LO_5,
        Zero_5,
        Less_5,
        Bigger_5,
        OF_5,
        CF_5,
        ER_5       
    );
    
    ex_mem U6(
        //input 
        clock,
        Block_5,
        reset,
        clear_9,
        clear_1,
        //calculate PC
        PC_plus_4_4,
        PC_5,
        //ALU
        ALU_result_5,
        Zero_5,
        Less_5,
        Bigger_5,
        
        HI_4,
        LO_4,
        //Jal_in,
        Jalr_4,
        Slt_4,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_4,//read HI
        Mflo_4,//read LO
        Write_ALU_result_4,
        Write_read_data_4,    
        
        //write reg address
        RD_address_4,
        RT_address_4,
        
        //write reg address control
        Jal_4,
        Bgezal_4,
        Bltzal_4,
        I_format_4,
        Mfc0_4,
        Reg_write_en_4,      
        
        //write HI/LO reg
        ALU_result_HI_5,
        ALU_result_LO_5,
        HILO_write_en_4,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO      
        
        Read_data_1_5,
        Read_data_2_5,
        Mem_read_type_4,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
        Mem_read_extend_4,//0-zero extend,1-sign extend
        Mem_write_type_4,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
        Mem_write_en_4,//0-X,1-write memory 
        
        Jmp_4,
        Jr_4,
        Beq_4,
        Bne_4,
        Bgez_4,
        Bgtz_4,
        Blez_4,
        Bltz_4,
        
        Mtc0_4,
        Break_4,
        Syscall_4,
        Eret_4,
        Ins_invalid_4,
        Sel_4,
        Code_4,     
        
        OF_5,
        CF_5,
        ER_5,   
        
        //output
        //Direct
        Direct_write_addr_6,
        Direct_write_data_6,
        //calculate PC
        PC_plus_4_6,
        PC_6,
        //ALU
        ALU_result_6,
        Zero_6,
        Less_6,
        Bigger_6,
        
        HI_6,
        LO_6,
        //Jal_in,
        Jalr_6,
        Slt_6,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_6,//read HI
        Mflo_6,//read LO
        Write_ALU_result_6,
        Write_read_data_6,    
        
        //write reg address
        RD_address_6,
        RT_address_6,
        
        //write reg address control
        Jal_6,
        Bgezal_6,
        Bltzal_6,
        I_format_6,
        Mfc0_6,
        Reg_write_en_6,      
        
        //write HI/LO reg
        ALU_result_HI_6,
        ALU_result_LO_6,
        HILO_write_en_6,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO      
        
        Read_data_1_6,
        Read_data_2_6,
        Mem_read_type_6,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
        Mem_read_extend_6,//0-zero extend,1-sign extend
        Mem_write_type_6,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
        Mem_write_en_6,//0-X,1-write memory     
        
        Jmp_6,
        Jr_6,
        Beq_6,
        Bne_6,
        Bgez_6,
        Bgtz_6,
        Blez_6,
        Bltz_6,
        
        Mtc0_6,
        Break_6,
        Syscall_6,
        Eret_6,
        Ins_invalid_6,
        Sel_6,
        Code_6,     
        
        OF_6,
        CF_6,
        ER_6  
    );
    
    Mem_or_IO U10(
    Mem_write_en_6,
    ALU_result_6,
    Read_data_2_6,
    clock,
    IO_data_10,
    reset,
    //Pulse0,Pulse1,Count0,Count1,Pwm,
    //wea,
    //digital,ens,Row,Col,switches,
    leds_10,leds_high_10
    );
    
    access_datamemory U7(
        //input
        clock,
        reset,
        
        Mem_read_type_6,
        Mem_read_extend_6,
        Mem_write_type_6,
        Mem_write_en_6,
        
        Read_data_2_6,
        ALU_result_6,
        
        //output
        Read_data_7   
    );
    
    CP0 U9(
        //input
        clock,
        reset,
        
        Mfc0_6,
        Mtc0_6,
        Sel_6,
        RD_address_6,
        Read_data_2_6,
        
        Break_6,
        Syscall_6,
        
        External_interrupt_10,
        
        //Internal exception
        OF_6,
        CF_6,
        ER_6,
        Ins_invalid_6,
        Access_error_9,
        
        PC_plus_4_6, 
        
        Eret_6,
        
        
        //output
        Interrupt_respond_9,
        CP0_data_9,
        PC_9,
        PC_CP0_en_9,
        Access_error_9,
        clear_9,   
        
        //test
        EPC
    );
    
    mem_wb U8(
        //input
        clock,
        reset,
        //Direct
        Direct_write_addr_6,
        Direct_write_data_6,
        //memory output
        Read_data_7,
        IO_data_10,
        
        //needed input
        //write back
        //write reg data
        ALU_result_6,
        //Read_data,//Mem or I/O
        HI_6,
        LO_6,
        PC_plus_4_6,
        //CP0_data_in,
        
        //write reg data control
        //Jal_in,
        Jalr_6,
        Slt_6,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_6,//read HI
        Mflo_6,//read LO
        Write_ALU_result_6,
        Write_read_data_6,
        Less_6,
               
        //write reg address
        RD_address_6,
        RT_address_6,
        
        //write reg address control
        Jal_6,
        Bgezal_6,
        Bltzal_6,
        I_format_6,
        Mfc0_6,
        Reg_write_en_6,
        
        //write HI/LO reg
        ALU_result_HI_6,
        ALU_result_LO_6,
        Read_data_1_6,
        HILO_write_en_6,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO  
        CP0_data_9,
        PC_9,
        PC_CP0_en_9,
        
        //output
        //Direct
        Direct_write_addr_8,
        Direct_write_data_8,
        //memory output
        Read_data_8,
        
        //needed input
        //write back
        //write reg data
        ALU_result_8,
        //Read_data,//Mem or I/O
        HI_8,
        LO_8,
        PC_plus_4_8,
        //CP0_data_in,
        
        //write reg data control
        //Jal_in,
        Jalr_8,
        Slt_8,//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        Mfhi_8,//read HI
        Mflo_8,//read LO
        Write_ALU_result_8,
        Write_read_data_8,
        Less_8,
               
        //write reg address
        RD_address_8,
        RT_address_8,
        
        //write reg address control
        Jal_8,
        Bgezal_8,
        Bltzal_8,
        I_format_8,
        Mfc0_8,
        Reg_write_en_8,
        
        //write HI/LO reg
        ALU_result_HI_8,
        ALU_result_LO_8,
        Read_data_1_8,
        HILO_write_en_8,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
        CP0_data_8,
        PC_8,
        PC_CP0_en_8
    );
    

    
    
endmodule
