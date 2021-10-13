`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/12 16:18:51
// Design Name: 
// Module Name: Minisys_1A_CPU_sim
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


module Minisys_1A_CPU_sim();
    //input
    reg clock=0;
    reg reset;
    
    //output
    //1: fetch instruction /instruction memory
    wire [31:0] PC_plus_4_1_out,PC_1_out,Instruction_1_out;  
    wire clear_1_out;  
    
    //2: if id
    wire  [31:0] PC_plus_4_2_out,Instruction_2_out;   
    
    //3: decode instruction
    wire [4:0] Direct_read_addr_1_3_out,Direct_read_addr_2_3_out;
    wire [1:0] If_read_3_out;
    wire  [31:0] Read_data_1_3_out,Read_data_2_3_out,Extend_imme_3_out,HI_3_out,LO_3_out;
    wire  [4:0] Shamt_3_out;
    wire  [15:0] Imme_3_out;
    wire  [4:0] RD_address_3_out,RT_address_3_out; 
    wire  I_format_3_out,Jmp_3_out,Jal_3_out,Jr_3_out,Jalr_3_out,Beq_3_out,Bne_3_out,Bgez_3_out,Bgtz_3_out,Blez_3_out,Bltz_3_out,Bgezal_3_out,Bltzal_3_out,
          Lui_3_out,Mfhi_3_out,Mflo_3_out,Reg_write_en_3_out,Write_ALU_result_3_out,Write_read_data_3_out,Mem_read_extend_3_out,
          Mem_write_en_3_out,Shift_opnum_3_out,Mfc0_3_out,Mtc0_3_out,Break_3_out,Syscall_3_out,Eret_3_out;
    wire  [3:0] Slt_3_out,ALU_op_3_out;
    wire  [1:0] HILO_write_en_3_out,Mem_read_type_3_out,Mem_write_type_3_out;
    wire  [2:0] Sel_3_out;
    wire  [19:0] Code_3_out;   
    wire Ins_invalid_3_out;
                 
    //4: id ex
    wire [4:0] Direct_read_addr_1_4_out,Direct_read_addr_2_4_out;
    wire [1:0] If_read_4_out;
    wire  [31:0] PC_plus_4_4_out,Read_data_1_4_out,Read_data_2_4_out,Extend_imme_4_out,HI_4_out,LO_4_out;
    wire  [4:0] Shamt_4_out,RD_address_4_out,RT_address_4_out;
    wire  [15:0] Imme_4_out;  
    wire  I_format_4_out,Jmp_4_out,Jal_4_out,Jr_4_out,Jalr_4_out,Beq_4_out,Bne_4_out,Bgez_4_out,Bgtz_4_out,Blez_4_out,Bltz_4_out,Bgezal_4_out,Bltzal_4_out,
          Lui_4_out,Mfhi_4_out,Mflo_4_out,Reg_write_en_4_out,Write_ALU_result_4_out,Write_read_data_4_out,Mem_read_extend_4_out,
          Mem_write_en_4_out,Shift_opnum_4_out,Mfc0_4_out,Mtc0_4_out,Break_4_out,Syscall_4_out,Eret_4_out;
    wire  [3:0] Slt_4_out,ALU_op_4_out;
    wire  [1:0] HILO_write_en_4_out,Mem_read_type_4_out,Mem_write_type_4_out;
    wire  [2:0] Sel_4_out;
    wire  [19:0] Code_4_out;  
    wire Ins_invalid_4_out;
    
    //5: execute instruction
    wire  [31:0] PC_5_out,ALU_result_5_out,ALU_result_HI_5_out,ALU_result_LO_5_out;
    wire  Zero_5_out,Less_5_out,Bigger_5_out,Block_5_out;
    wire [31:0] Read_data_1_5_out,Read_data_2_5_out;
    wire OF_5_out,CF_5_out,ER_5_out;  
    
    //6: ex mem
    wire  Jmp_6_out,Jal_6_out,Jr_6_out,Jalr_6_out,Beq_6_out,Bne_6_out,Bgez_6_out,Bgtz_6_out,Blez_6_out,Bltz_6_out,Bgezal_6_out,Bltzal_6_out,Zero_6_out,
          Bigger_6_out,Less_6_out,Mfhi_6_out,Mflo_6_out,Write_ALU_result_6_out,Write_read_data_6_out,I_format_6_out,Mfc0_6_out,
          Reg_write_en_6_out,Mem_read_extend_6_out,Mem_write_en_6_out;
    wire  [31:0] Read_data_1_6_out,PC_6_out,PC_plus_4_6_out,ALU_result_6_out,HI_6_out,LO_6_out,ALU_result_HI_6_out,ALU_result_LO_6_out,
                 Read_data_2_6_out;
    wire  [3:0] Slt_6_out;
    wire  [4:0] RD_address_6_out,RT_address_6_out;
    wire  [1:0] HILO_write_en_6_out,Mem_read_type_6_out,Mem_write_type_6_out; 
    wire [4:0] Direct_write_addr_6_out;
    wire [31:0] Direct_write_data_6_out;  
    wire Mtc0_6_out,Break_6_out,Syscall_6_out,Eret_6_out,Ins_invalid_6_out;
    wire [2:0] Sel_6_out;
    wire [19:0] Code_6_out; 
    wire OF_6_out,CF_6_out,ER_6_out;    
    
    //10: Mem or IO
    wire [31:0] IO_data_10_out;
   // Pulse0,Pulse1,Count0,Count1,Pwm,
    //digital,ens,Row,Col,switches,
    wire [15:0] leds_10;
    wire [7:0] leds_high_10;

    //7: access data memory 
    wire  [31:0] Read_data_7_out;
    
    //9: CP0
    wire Access_error_9_out,PC_CP0_en_9_out,clear_9_out;
    wire [31:0] CP0_data_9_out,PC_9_out;
    wire [5:0] Interrupt_respond_9_out;
    wire [31:0] EPC_out;
    
    //8: mem wb
    wire  [31:0] ALU_result_8_out,Read_data_8_out,HI_8_out,LO_8_out,PC_plus_4_8_out,CP0_data_8_out,ALU_result_HI_8_out,
                 ALU_result_LO_8_out;
    wire  Jalr_8_out,Mfhi_8_out,Mflo_8_out,Write_ALU_result_8_out,Write_read_data_8_out,Less_8_out,
          Jal_8_out,Bgezal_8_out,Bltzal_8_out,I_format_8_out,Mfc0_8_out,Reg_write_en_8_out;
    wire  [3:0] Slt_8_out;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    wire  [4:0] RD_address_8_out,RT_address_8_out;
    wire  [1:0] HILO_write_en_8_out;
    wire [4:0] Direct_write_addr_8_out;
    wire [31:0] Direct_write_data_8_out;  
    wire [31:0] PC_8_out;
    wire PC_CP0_en_8_out;          
    wire [31:0] Read_data_1_8_out; 
    
    //10: external device
    wire [5:0] External_interrupt_10_out;
    
    Minisys_1A_CPU uut(
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
    
    always #2 clock=~clock;
    
    initial fork
        #0 reset=0;
        #1 reset=1;
        #5 reset=0;
    join
endmodule
