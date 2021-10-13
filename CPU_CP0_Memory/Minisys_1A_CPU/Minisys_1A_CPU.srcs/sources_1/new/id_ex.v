`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 16:29:12
// Design Name: 
// Module Name: id_ex
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


module id_ex(
    //input
    clock,
    Block,
    reset,
    clear_9,
    clear_1,
    
    PC_plus_4_in,
    
    //Direct
    Direct_read_addr_1_in,
    Direct_read_addr_2_in,
    If_read_in,
    //data
    Read_data_1_in,
    Read_data_2_in,
    Extend_imme_in,  
    HI_in,
    LO_in,
    Shamt_in,
    Imme_in,
    //address
    RD_address_in,
    RT_address_in,    
    //control
    I_format_in,
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
    Lui_in,
    Slt_in,//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    Mfhi_in,
    Mflo_in,
    Reg_write_en_in,
    HILO_write_en_in,
    Write_ALU_result_in,//judge if write reg from ALU_result
    Write_read_data_in,//judge if write reg from memory
    Mem_read_type_in,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    Mem_read_extend_in,//0-zero extend,1-sign extend
    Mem_write_type_in,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    Mem_write_en_in,//0-X,1-write memory 
    
    //ALU
    Shift_opnum_in,//0-shamt,1-(rs)
    ALU_op_in,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
    
    //CP0
    Mfc0_in,
    Mtc0_in,
    Break_in,
    Syscall_in,
    Eret_in,
    Ins_invalid_in, 
    Sel_in,
    Code_in,
    
    //output
    PC_plus_4_out,
    
    //Direct
    Direct_read_addr_1_out,
    Direct_read_addr_2_out,   
    If_read_out, 
    //data
    Read_data_1_out,
    Read_data_2_out,
    Extend_imme_out,  
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
    Mem_read_type_out,//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    Mem_read_extend_out,//0-zero extend,1-sign extend
    Mem_write_type_out,//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    Mem_write_en_out,//0-X,1-write memory 
    
    //ALU
    Shift_opnum_out,//0-shamt,1-(rs)
    ALU_op_out,//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
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
    input clock,Block,reset,clear_9,clear_1;
    
    input [31:0] PC_plus_4_in;
    
    //Direct
    input [4:0] Direct_read_addr_1_in,Direct_read_addr_2_in;
    input [1:0] If_read_in;
    //data
    input [31:0] Read_data_1_in,Read_data_2_in,Extend_imme_in,HI_in,LO_in;
    input [4:0] Shamt_in;
    input [15:0] Imme_in;
    //address
    input [4:0] RD_address_in,RT_address_in;  
    //control
    input I_format_in,Jmp_in,Jal_in,Jr_in,Jalr_in,Beq_in,Bne_in,Bgez_in,Bgtz_in,Blez_in,Bltz_in,Bgezal_in,Bltzal_in,Lui_in;
    input [3:0] Slt_in;//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    input Mfhi_in,Mflo_in;
    input Reg_write_en_in;
    input [1:0] HILO_write_en_in;
    input Write_ALU_result_in;//judge if write reg from ALU_result
    input Write_read_data_in;//judge if write reg from memory
    input [1:0] Mem_read_type_in;//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    input Mem_read_extend_in;//0-zero extend,1-sign extend
    input [1:0] Mem_write_type_in;//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    input Mem_write_en_in;//0-X,1-write memory 
    
    //ALU
    input Shift_opnum_in;//0-shamt,1-(rs)
    input [3:0] ALU_op_in;//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
    
    //CP0
    input Mfc0_in,Mtc0_in,Break_in,Syscall_in,Eret_in,Ins_invalid_in;
    input [2:0] Sel_in;
    input [19:0] Code_in;
    
    //output
    output reg [31:0] PC_plus_4_out;
    
    //Direct
    output reg [4:0] Direct_read_addr_1_out,Direct_read_addr_2_out;
    output reg [1:0] If_read_out;
    //data
    output reg [31:0] Read_data_1_out,Read_data_2_out,Extend_imme_out,HI_out,LO_out;
    output reg [4:0] Shamt_out;
    output reg [15:0] Imme_out;
    //address
    output reg [4:0] RD_address_out,RT_address_out;  
    //control
    output reg I_format_out,Jmp_out,Jal_out,Jr_out,Jalr_out,Beq_out,Bne_out,Bgez_out,Bgtz_out,Blez_out,
               Bltz_out,Bgezal_out,Bltzal_out,Lui_out;
    output reg [3:0] Slt_out;//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    output reg Mfhi_out,Mflo_out;
    output reg Reg_write_en_out;
    output reg [1:0] HILO_write_en_out;
    output reg Write_ALU_result_out;//judge if write reg from ALU_result
    output reg Write_read_data_out;//judge if write reg from memory
    output reg [1:0] Mem_read_type_out;//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    output reg Mem_read_extend_out;//0-zero extend,1-sign extend
    output reg [1:0] Mem_write_type_out;//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    output reg Mem_write_en_out;//0-X,1-write memory 
    
    //ALU
    output reg Shift_opnum_out;//0-shamt,1-(rs)
    output reg [3:0] ALU_op_out;//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
    
    //CP0
    output reg Mfc0_out,Mtc0_out,Break_out,Syscall_out,Eret_out,Ins_invalid_out;
    output reg [2:0] Sel_out;
    output reg [19:0] Code_out;
    
    always @(posedge clock) begin
        if(Block==0) begin
            PC_plus_4_out=PC_plus_4_in;
            //Direct
            Direct_read_addr_1_out=Direct_read_addr_1_in;
            Direct_read_addr_2_out=Direct_read_addr_2_in;
            If_read_out=If_read_in;
            //data
            Read_data_1_out=Read_data_1_in;
            Read_data_2_out=Read_data_2_in;
            Extend_imme_out=Extend_imme_in;  
            HI_out=HI_in;
            LO_out=LO_in;
            Shamt_out=Shamt_in;
            Imme_out=Imme_in;
            //address
            RD_address_out=RD_address_in;
            RT_address_out=RT_address_in; 
            //control
            I_format_out=I_format_in;
            Jmp_out=Jmp_in;
            Jal_out=Jal_in;
            Jr_out=Jr_in;
            Jalr_out=Jalr_in;
            Beq_out=Beq_in;
            Bne_out=Bne_in;
            Bgez_out=Bgez_in;
            Bgtz_out=Bgtz_in;
            Blez_out=Blez_in;
            Bltz_out=Bltz_in;
            Bgezal_out=Bgezal_in;
            Bltzal_out=Bltzal_in;
            Lui_out=Lui_in;
            Slt_out=Slt_in;//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
            Mfhi_out=Mfhi_in;
            Mflo_out=Mflo_in;
            Reg_write_en_out=Reg_write_en_in;
            HILO_write_en_out=HILO_write_en_in;
            Write_ALU_result_out=Write_ALU_result_in;//judge if write reg from ALU_result
            Write_read_data_out=Write_read_data_in;//judge if write reg from memory
            Mem_read_type_out=Mem_read_type_in;//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
            Mem_read_extend_out=Mem_read_extend_in;//0-zero extend,1-sign extend
            Mem_write_type_out=Mem_write_type_in;//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
            Mem_write_en_out=Mem_write_en_in;//0-X,1-write memory 
    
            //ALU
            Shift_opnum_out=Shift_opnum_in;//0-shamt,1-(rs)
            ALU_op_out=ALU_op_in;//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
               //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
    
            //CP0
            Mfc0_out=Mfc0_in;
            Mtc0_out=Mtc0_in;
            Break_out=Break_in;
            Syscall_out=Syscall_in;
            Eret_out=Eret_in;
            Ins_invalid_out=Ins_invalid_in; 
            Sel_out=Sel_in;
            Code_out=Code_in;
            
            if(reset==1||clear_9==1||clear_1) begin
                PC_plus_4_out=32'hX;
                
                //data
                Read_data_1_out=32'hX;
                Read_data_2_out=32'hX;
                Extend_imme_out=32'hX;  
                HI_out=32'hX;
                LO_out=32'hX;
                Shamt_out=5'hX;
                Imme_out=16'hX;
                //address
                RD_address_out=5'hX;
                RT_address_out=5'hX; 
                //control
                I_format_out=1'hX;
                Jmp_out=1'hX;
                Jal_out=1'hX;
                Jr_out=1'hX;
                Jalr_out=1'hX;
                Beq_out=1'hX;
                Bne_out=1'hX;
                Bgez_out=1'hX;
                Bgtz_out=1'hX;
                Blez_out=1'hX;
                Bltz_out=1'hX;
                Bgezal_out=1'hX;
                Bltzal_out=1'hX;
                Lui_out=1'hX;
                Slt_out=4'hX;//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
                Mfhi_out=1'hX;
                Mflo_out=1'hX;
                Reg_write_en_out=1'hX;
                HILO_write_en_out=2'hX;
                Write_ALU_result_out=1'hX;//judge if write reg from ALU_result
                Write_read_data_out=1'hX;//judge if write reg from memory
                Mem_read_type_out=2'hX;//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
                Mem_read_extend_out=1'hX;//0-zero extend,1-sign extend
                Mem_write_type_out=2'hX;//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
                Mem_write_en_out=1'hX;//0-X,1-write memory 
    
                //ALU
                Shift_opnum_out=1'hX;//0-shamt,1-(rs)
                ALU_op_out=4'hX;//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
               //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
    
                //CP0
                Mfc0_out=1'hX;
                Mtc0_out=1'hX;
                Break_out=1'hX;
                Syscall_out=1'hX;
                Eret_out=1'hX;
                Ins_invalid_out=1'hX;
                Sel_out=3'hX;
                Code_out=20'hX;
                
                Direct_read_addr_1_out=5'hX;
                Direct_read_addr_2_out=5'hX;
                If_read_out=2'bX;
            end 
        end
    end  
endmodule
