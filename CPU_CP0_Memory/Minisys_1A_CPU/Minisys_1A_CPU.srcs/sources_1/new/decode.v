`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 17:31:45
// Design Name: 
// Module Name: decode
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


module decode(
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
    
    //Direct
    If_read
    );
    
    //input
    input [31:0]Instruction_in;
    
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
    
    //inside
    output Imme_extend_type;//0-zero extend,1-sign extend
    
    //Direct
    output [1:0] If_read;
    
    //I_format_out
    assign I_format_out=((Instruction_in[31:26]==6'b000000)||(Instruction_in[31:26]==6'b010000)||(Instruction_in[31:26]==6'b000010)||(Instruction_in[31:26]==6'b000011))? 1'b0:1'b1;
    
    //Jmp_out
    assign Jmp_out=(Instruction_in[31:26]==6'b000010)? 1'b1:1'b0;
    
    //Jal_out
    assign Jal_out=(Instruction_in[31:26]==6'b000011)? 1'b1:1'b0;    
    
    //Jr_out
    assign Jr_out=((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001000))? 1'b1:1'b0; 
    
    //Jalr_out
    assign Jalr_out=((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001001))? 1'b1:1'b0;
    
    //Beq_out
    assign Beq_out=(Instruction_in[31:26]==6'b000100)? 1'b1:1'b0; 
    
    //Bne_out
    assign Bne_out=(Instruction_in[31:26]==6'b000101)? 1'b1:1'b0;      
    
    //Bgez_out   
    assign Bgez_out=((Instruction_in[31:26]==6'b000001)&&(Instruction_in[20:16]==5'b00001))? 1'b1:1'b0;  
    
    //Bgtz_out  
    assign Bgtz_out=(Instruction_in[31:26]==6'b000111)? 1'b1:1'b0;     
    
    //Blez_out
    assign Blez_out=(Instruction_in[31:26]==6'b000110)? 1'b1:1'b0;   
    
    //Bltz_out
    assign Bltz_out=((Instruction_in[31:26]==6'b000001)&&(Instruction_in[20:16]==5'b00000))? 1'b1:1'b0;   
    
    //Bgezal_out
    assign Bgezal_out=((Instruction_in[31:26]==6'b000001)&&(Instruction_in[20:16]==5'b10001))? 1'b1:1'b0;  
    
    //Bltzal_out
    assign Bltzal_out=((Instruction_in[31:26]==6'b000001)&&(Instruction_in[20:16]==5'b10000))? 1'b1:1'b0;  
    
    //Lui_out
    assign Lui_out=(Instruction_in[31:26]==6'b001111)? 1'b1:1'b0;    
    
    //Mfhi_out                  
    assign Mfhi_out=((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b010000))? 1'b1:1'b0;    
    
    //Mflo_out
    assign Mflo_out=((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b010010))? 1'b1:1'b0;  
    
    //Slt_out
    assign Slt_out[0]=((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b101010))? 1'b1:1'b0;//Slt
    assign Slt_out[1]=((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b101011))? 1'b1:1'b0;//Sltu    
    assign Slt_out[2]=(Instruction_in[31:26]==6'b001010)? 1'b1:1'b0;//Slti
    assign Slt_out[3]=(Instruction_in[31:26]==6'b001011)? 1'b1:1'b0;//Sltiu
    
    //Reg_write_en_out    
    assign Reg_write_en_out=(((Instruction_in[31:26]==6'b000000)&&((Instruction_in[5:3]==3'b011)||(Instruction_in[5:0]==6'b010001)||(Instruction_in[5:0]==6'b010011)||(Instruction_in[5:0]==6'b001100)||(Instruction_in[5:0]==6'b001101)||(Instruction_in[5:0]==6'b001000)))
                             ||((Instruction_in[31:26]==6'b010000)&&((Instruction_in[25:21]==5'b00100)||(Instruction_in[5:0]==6'b011000)))
                             ||(Instruction_in[31:29]==3'b101)
                             ||(Instruction_in[31:26]==6'b000100)
                             ||(Instruction_in[31:26]==6'b000101)
                             ||(Instruction_in[31:26]==6'b000111)
                             ||(Instruction_in[31:26]==6'b000110)
                             ||(Instruction_in[31:26]==6'b000010)
                             ||((Instruction_in[31:26]==6'b000001)&&((Instruction_in[20:16]==5'b00000)||(Instruction_in[20:16]==5'b00001))))? 1'b0:1'b1;                       
    
    //HILO_write_en_out
    assign HILO_write_en_out[0]=((Instruction_in[31:26]==6'b000000)&&((Instruction_in[5:3]==3'b011)||(Instruction_in[5:0]==6'b010011)))? 1'b1:1'b0;//LO
    assign HILO_write_en_out[1]=((Instruction_in[31:26]==6'b000000)&&((Instruction_in[5:3]==3'b011)||(Instruction_in[5:0]==6'b010001)))? 1'b1:1'b0;//HI
    
    //Write_ALU_result_out
    assign Write_ALU_result_out=((Instruction_in[31:26]==6'b000000)&&((Instruction_in[5:3]==3'b100)||(Instruction_in[5:3]==3'b000))
                                 ||(Instruction_in[31:26]==6'b001000)
                                 ||(Instruction_in[31:26]==6'b001001)
                                 ||(Instruction_in[31:26]==6'b001100)
                                 ||(Instruction_in[31:26]==6'b001101)
                                 ||(Instruction_in[31:26]==6'b001110)
                                 ||(Instruction_in[31:26]==6'b001111))? 1'b1:1'b0;
    
    //Write_read_data_out
    assign Write_read_data_out=(Instruction_in[31:29]==3'b100)? 1'b1:1'b0;    
    
    //Mem_read_type
    assign Mem_read_type[0]=((Instruction_in[31:26]==6'b100000)||(Instruction_in[31:26]==6'b100100)||(Instruction_in[31:26]==6'b100011))? 1'b1:1'b0;
    assign Mem_read_type[1]=((Instruction_in[31:26]==6'b100001)||(Instruction_in[31:26]==6'b100101)||(Instruction_in[31:26]==6'b100011))? 1'b1:1'b0;
    
    //Mem_read_extend
    assign Mem_read_extend=((Instruction_in[31:26]==6'b100100)||(Instruction_in[31:26]==6'b100101))? 1'b0:1'b1;
    
    //Mem_write_type
    assign Mem_write_type[0]=((Instruction_in[31:26]==6'b101000)||(Instruction_in[31:26]==6'b101011))? 1'b1:1'b0;
    assign Mem_write_type[1]=((Instruction_in[31:26]==6'b101001)||(Instruction_in[31:26]==6'b101011))? 1'b1:1'b0;
  
    //Mem_write_en
    assign Mem_write_en=((Instruction_in[31:26]==6'b101000)||(Instruction_in[31:26]==6'b101001)||(Instruction_in[31:26]==6'b101011))? 1'b1:1'b0;
   
    //Shift_opnum
    assign Shift_opnum=((Instruction_in[31:26]==6'b000000)&&((Instruction_in[5:0]==6'b000000)||(Instruction_in[5:0]==6'b000010)||(Instruction_in[5:0]==6'b000011)))? 1'b0:1'b1;
  
    //ALU_op
    assign ALU_op[0]=(((Instruction_in[31:26]==6'b000000)&&((Instruction_in[5:0]==6'b100000)||(Instruction_in[5:0]==6'b100010)||(Instruction_in[5:0]==6'b011000)||(Instruction_in[5:0]==6'b011010)||(Instruction_in[5:0]==6'b100100)||(Instruction_in[5:0]==6'b100110)||(Instruction_in[5:0]==6'b000000)||(Instruction_in[5:0]==6'b000100)||(Instruction_in[5:0]==6'b000011)||(Instruction_in[5:0]==6'b000111)||(Instruction_in[5:0]==6'b101010)))
                     ||(Instruction_in[31:26]==6'b001000)
                     ||(Instruction_in[31:26]==6'b001100)
                     ||(Instruction_in[31:26]==6'b001110)
                     ||(Instruction_in[31:26]==6'b100000)
                     ||(Instruction_in[31:26]==6'b100100)
                     ||(Instruction_in[31:26]==6'b100001)
                     ||(Instruction_in[31:26]==6'b100101)
                     ||(Instruction_in[31:26]==6'b101000)
                     ||(Instruction_in[31:26]==6'b101001)
                     ||(Instruction_in[31:26]==6'b100011)
                     ||(Instruction_in[31:26]==6'b101011)
                     ||(Instruction_in[31:26]==6'b001010)
                     ||(Instruction_in[31:26]==6'b000100)
                     ||(Instruction_in[31:26]==6'b000101)
                     ||(Instruction_in[31:26]==6'b000001)
                     ||(Instruction_in[31:26]==6'b000110)
                     ||(Instruction_in[31:26]==6'b000111))? 1'b1:1'b0;
    assign ALU_op[1]=(((Instruction_in[31:26]==6'b000000)&&((Instruction_in[5:0]==6'b100001)||(Instruction_in[5:0]==6'b100010)||(Instruction_in[5:0]==6'b011001)||(Instruction_in[5:0]==6'b011010)||(Instruction_in[5:0]==6'b100101)||(Instruction_in[5:0]==6'b100110)||(Instruction_in[5:0]==6'b000010)||(Instruction_in[5:0]==6'b000110)||(Instruction_in[5:0]==6'b000011)||(Instruction_in[5:0]==6'b000111)||(Instruction_in[5:0]==6'b101010)))
                     ||(Instruction_in[31:26]==6'b001001)
                     ||(Instruction_in[31:26]==6'b001101)
                     ||(Instruction_in[31:26]==6'b001110)
                     ||(Instruction_in[31:26]==6'b001010)
                     ||(Instruction_in[31:26]==6'b000100)
                     ||(Instruction_in[31:26]==6'b000101)
                     ||(Instruction_in[31:26]==6'b000001)
                     ||(Instruction_in[31:26]==6'b000110)
                     ||(Instruction_in[31:26]==6'b000111))? 1'b1:1'b0;              
    assign ALU_op[2]=(((Instruction_in[31:26]==6'b000000)&&((Instruction_in[5:0]==6'b100011)||(Instruction_in[5:0]==6'b011000)||(Instruction_in[5:0]==6'b011001)||(Instruction_in[5:0]==6'b011010)||(Instruction_in[5:0]==6'b100111)||(Instruction_in[5:0]==6'b000000)||(Instruction_in[5:0]==6'b000100)||(Instruction_in[5:0]==6'b000010)||(Instruction_in[5:0]==6'b000110)||(Instruction_in[5:0]==6'b000011)||(Instruction_in[5:0]==6'b000111)||(Instruction_in[5:0]==6'b101011)))
                     ||(Instruction_in[31:26]==6'b001011))? 1'b1:1'b0; 
    assign ALU_op[3]=(((Instruction_in[31:26]==6'b000000)&&((Instruction_in[5:0]==6'b011011)||(Instruction_in[5:0]==6'b100100)||(Instruction_in[5:0]==6'b100101)||(Instruction_in[5:0]==6'b100110)||(Instruction_in[5:0]==6'b100111)||(Instruction_in[5:0]==6'b000000)||(Instruction_in[5:0]==6'b000100)||(Instruction_in[5:0]==6'b000010)||(Instruction_in[5:0]==6'b000110)||(Instruction_in[5:0]==6'b000011)||(Instruction_in[5:0]==6'b000111)))
                     ||(Instruction_in[31:26]==6'b001100)
                     ||(Instruction_in[31:26]==6'b001101)
                     ||(Instruction_in[31:26]==6'b001110))? 1'b1:1'b0; 
                     
    //CP0
    //Mfc0_out
    assign Mfc0_out=((Instruction_in[31:26]==6'b010000)&&(Instruction_in[25:21]==5'b00000))? 1'b1:1'b0;  
    
    //Mtc0_out
    assign Mtc0_out=((Instruction_in[31:26]==6'b010000)&&(Instruction_in[25:21]==5'b00100))? 1'b1:1'b0;  
    
    //Break_out
    assign Break_out=((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001101))? 1'b1:1'b0;  
    
    //Syscall_out
    assign Syscall_out=((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001100))? 1'b1:1'b0;  
    
    //Eret_out
    assign Eret_out=(Instruction_in[31:0]==32'b010000_10000_00000_00000_00000_011000)? 1'b1:1'b0;  
    
    //Ins_invalid_out
    assign Ins_invalid_out=(((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100000))||//add
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100001))||//addu
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100010))||//sub
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100011))||//subu
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100100))||//and
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b011000))||//mult
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b011001))||//multu
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b011010))||//div
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b011011))||//divu
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b010000))||//mfhi
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b010010))||//mflo
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b010001))||//mthi
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b010011))||//mtlo
                            ((Instruction_in[31:26]==6'b010000)&&(Instruction_in[25:21]==5'b00000))||//mfc0
                            ((Instruction_in[31:26]==6'b010000)&&(Instruction_in[25:21]==6'b00100))||//mtc0
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100101))||//or
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100110))||//xor
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100111))||//nor
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b101010))||//slt
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b101011))||//sltu
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000000))||//sll
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000010))||//srl
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000011))||//sra
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000100))||//sllv
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000110))||//srlv
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000111))||//srav
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001000))||//jr
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001001))||//jalr
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001101))||//break
                            ((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001100))||//syscall
                            (Instruction_in[31:0]==32'b010000_10000_00000_00000_00000_011000)||//eret
                            (Instruction_in[31:26]==6'b001000)||//addi
                            (Instruction_in[31:26]==6'b001001)||//addiu
                            (Instruction_in[31:26]==6'b001100)||//andi
                            (Instruction_in[31:26]==6'b001101)||//ori
                            (Instruction_in[31:26]==6'b001110)||//xori
                            (Instruction_in[31:26]==6'b001111)||//lui
                            (Instruction_in[31:26]==6'b100000)||//lb
                            (Instruction_in[31:26]==6'b100100)||//lbu
                            (Instruction_in[31:26]==6'b100001)||//lh
                            (Instruction_in[31:26]==6'b100101)||//lhu
                            (Instruction_in[31:26]==6'b101000)||//sb
                            (Instruction_in[31:26]==6'b101001)||//sh
                            (Instruction_in[31:26]==6'b100011)||//lw
                            (Instruction_in[31:26]==6'b101011)||//sw
                            (Instruction_in[31:26]==6'b000100)||//beq
                            (Instruction_in[31:26]==6'b000101)||//bne
                            ((Instruction_in[31:26]==6'b000001)&&(Instruction_in[20:16]==5'b00001))||//bgez
                            (Instruction_in[31:26]==6'b000111)||//bgtz
                            (Instruction_in[31:26]==6'b000110)||//blez
                            ((Instruction_in[31:26]==6'b000001)&&(Instruction_in[20:16]==5'b00000))||//bltz
                            ((Instruction_in[31:26]==6'b000001)&&(Instruction_in[20:16]==5'b10001))||//bgezal
                            ((Instruction_in[31:26]==6'b000001)&&(Instruction_in[20:16]==5'b10000))||//bltzal
                            (Instruction_in[31:26]==6'b001010)||//slti
                            (Instruction_in[31:26]==6'b001011)||//sltiu
                            (Instruction_in[31:26]==6'b000010)||//j
                            (Instruction_in[31:26]==6'b000011)//jal
                            )? 1'b0:1'b1;
  
    //Imme_extend_type    
    assign Imme_extend_type=((Instruction_in[31:26]==6'b001100)||(Instruction_in[31:26]==6'b001101)||(Instruction_in[31:26]==6'b001110)||(Instruction_in[31:26]==6'b001011))? 1'b0:1'b1;

    //Direct
    assign If_read[0]=(((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b010000))
                    ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b010010))
                    ||((Instruction_in[31:26]==6'b010000)&&(Instruction_in[25:21]==5'b00000))
                    ||((Instruction_in[31:26]==6'b010000)&&(Instruction_in[25:21]==5'b00100))
                    ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000000))
                    ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000010))
                    ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000011))
                    ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001101))
                    ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b001100))
                    ||(Instruction_in[31:0]==32'b010000_10000_00000_00000_00000_011000)
                    ||(Instruction_in[31:26]==6'b001111)
                    ||(Instruction_in[31:26]==6'b000010)
                    ||(Instruction_in[31:26]==6'b000011))?1'b0:1'b1;
                    
    assign If_read[1]=(((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100000))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100001))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100010))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100011))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100100))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b011000))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b011001))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b011010))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b011011))
                       ||((Instruction_in[31:26]==6'b010000)&&(Instruction_in[25:21]==5'b00100))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100101))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100110))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b100111))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b101010))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b101011))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000000))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000010))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000011))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000100))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000110))
                       ||((Instruction_in[31:26]==6'b000000)&&(Instruction_in[5:0]==6'b000111))
                       ||(Instruction_in[31:26]==6'b101000)
                       ||(Instruction_in[31:26]==6'b101001)
                       ||(Instruction_in[31:26]==6'b101011)
                       ||(Instruction_in[31:26]==6'b000100)
                       ||(Instruction_in[31:26]==6'b000101))? 1:0;
endmodule
