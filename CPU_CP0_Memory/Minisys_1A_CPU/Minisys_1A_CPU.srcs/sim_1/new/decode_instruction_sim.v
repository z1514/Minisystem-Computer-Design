`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/06 22:17:14
// Design Name: 
// Module Name: decode_instruction_sim
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


module decode_instruction_sim();
    //input
    reg clock=1;
    reg reset;
    
    reg [31:0]Instruction_in;
    
    //write reg data
    reg [31:0]ALU_result;
    reg [31:0]Read_data;//Mem or I/O
    reg [31:0]HI_in;
    reg [31:0]LO_in;
    reg [31:0]PC_plus_4_in;
    reg [31:0]CP0_data_in;
    
    //write reg data control
    //Jal_in
    reg Jalr_in;
    reg [3:0] Slt_in;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    reg Mfhi_in;//read HI
    reg Mflo_in;//read LO
    reg Write_ALU_result_in;
    reg Write_read_data_in;
    reg Less;
           
    //write reg address
    reg [4:0] RD_address_in;
    reg [4:0] RT_address_in;
    
    //write reg address control
    reg Jal_in;
    reg Bgezal_in;
    reg Bltzal_in;
    reg I_format_in;
    reg Mfc0_in;
    reg Reg_write_en_in;
    
    //write HI/LO reg
    reg [31:0] ALU_result_HI;
    reg [31:0] ALU_result_LO;
    reg [1:0] HILO_write_en_in;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    
    
    //output
    //data
    wire [31:0] Read_data_1;
    wire [31:0] Read_data_2;
    wire [31:0] Extend_imme;  
    wire [31:0] HI_out;
    wire [31:0] LO_out;
    wire [4:0] Shamt_out;
    wire [15:0] Imme_out;
    //address
    wire [4:0] RD_address_out;
    wire [4:0] RT_address_out;  
    //control
    wire I_format_out;
    wire Jmp_out;
    wire Jal_out;
    wire Jr_out;
    wire Jalr_out;
    wire Beq_out;
    wire Bne_out;
    wire Bgez_out;
    wire Bgtz_out;
    wire Blez_out;
    wire Bltz_out;
    wire Bgezal_out;
    wire Bltzal_out;
    wire Lui_out;
    wire [3:0] Slt_out;//[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    wire Mfhi_out;
    wire Mflo_out;
    wire Reg_write_en_out;
    wire [1:0]HILO_write_en_out;
    wire Write_ALU_result_out;//judge if write reg from ALU_result
    wire Write_read_data_out;//judge if write reg from memory
    wire [1:0] Mem_read_type;//read data memmory type  00-X,01-8bit read,10-16bit read, 11-32bit read
    wire Mem_read_extend;//0-zero extend,1-sign extend
    wire [1:0] Mem_write_type;//write data memory type 00-X,01-8bit write,10-16bit wirte,11-32bit write
    wire Mem_write_en;//0-X,1-write memory 
    
    //ALU
    wire Shift_opnum;//0-shamt,1-(rs)
    wire [3:0] ALU_op;//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav
    
    //CP0
    wire Mfc0_out;
    wire Mtc0_out;
    wire Break_out;
    wire Syscall_out;
    wire Eret_out;
    wire [2:0] Sel_out;
    wire [19:0] Code_out;
    
    decode_instruction uut(
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
        HILO_write_en_in,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
        
        
        //output
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
        Sel_out,
        Code_out
    );
    
    always #2 clock=~clock;

    initial fork
        //initialize write address 
        #0 RD_address_in=5'b00001;
        #0 RT_address_in=5'b00010;
        
        //jalr  en==0
        #1 ALU_result=32'h11111111;
        #1 Read_data=32'h22222222;//Mem or I/O
        #1 HI_in=32'h33333333;
        #1 LO_in=32'h44444444;
        #1 PC_plus_4_in=32'h55555555;  
        #1 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #1 Jalr_in=1'b1;
        #1 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #1 Mfhi_in=1'b0;//write reg from HI
        #1 Mflo_in=1'b0;//write reg from LO
        #1 Write_ALU_result_in=1'b0;
        #1 Write_read_data_in=1'b0;   
        #1 Less=1'b1;       
        //write reg address control
        #1 Jal_in=1'b0;
        #1 Bgezal_in=1'b0;
        #1 Bltzal_in=1'b0;
        #1 I_format_in=1'b0;
        #1 Mfc0_in=1'b0;
        #1 Reg_write_en_in=1'b0;
        #1 Instruction_in=32'b000000_00000_00000_00000_00000_100000;

        
        //jalr  en==1
        #5 ALU_result=32'h11111111;
        #5 Read_data=32'h22222222;//Mem or I/O
        #5 HI_in=32'h33333333;
        #5 LO_in=32'h44444444;
        #5 PC_plus_4_in=32'h55555555;  
        #5 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #5 Jalr_in=1'b1;
        #5 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #5 Mfhi_in=1'b0;//write reg from HI
        #5 Mflo_in=1'b0;//write reg from LO
        #5 Write_ALU_result_in=1'b0;
        #5 Write_read_data_in=1'b0;   
        #5 Less=1'b1;       
        //write reg address control
        #5 Jal_in=1'b0;
        #5 Bgezal_in=1'b0;
        #5 Bltzal_in=1'b0;
        #5 I_format_in=1'b0;
        #5 Mfc0_in=1'b0;
        #5 Reg_write_en_in=1'b1;        
        #5 Instruction_in=32'b010000_00000_00010_00001_00000_000000;     
        
        //bgezal
        #9 ALU_result=32'h11111111;
        #9 Read_data=32'h22222222;//Mem or I/O
        #9 HI_in=32'h33333333;
        #9 LO_in=32'h44444444;
        #9 PC_plus_4_in=32'h55555555;  
        #9 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #9 Jalr_in=1'b0;
        #9 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #9 Mfhi_in=1'b0;//write reg from HI
        #9 Mflo_in=1'b0;//write reg from LO
        #9 Write_ALU_result_in=1'b0;
        #9 Write_read_data_in=1'b0;   
        #9 Less=1'b1;       
        //write reg address control
        #9 Jal_in=1'b0;
        #9 Bgezal_in=1'b1;
        #9 Bltzal_in=1'b0;
        #9 I_format_in=1'b1;
        #9 Mfc0_in=1'b0;
        #9 Reg_write_en_in=1'b1;
        
        //bgezal
        #13 ALU_result=32'h11111111;
        #13 Read_data=32'h22222222;//Mem or I/O
        #13 HI_in=32'h33333333;
        #13 LO_in=32'h44444444;
        #13 PC_plus_4_in=32'h55555555;  
        #13 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #13 Jalr_in=1'b0;
        #13 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #13 Mfhi_in=1'b0;//write reg from HI
        #13 Mflo_in=1'b0;//write reg from LO
        #13 Write_ALU_result_in=1'b0;
        #13 Write_read_data_in=1'b0;   
        #13 Less=1'b0;       
        //write reg address control
        #13 Jal_in=1'b0;
        #13 Bgezal_in=1'b1;
        #13 Bltzal_in=1'b0;
        #13 I_format_in=1'b1;
        #13 Mfc0_in=1'b0;
        #13 Reg_write_en_in=1'b1;       
        #13 Instruction_in=32'b000000_11111_00010_00001_00000_100000;

        //bltzal
        #17 ALU_result=32'h11111111;
        #17 Read_data=32'h22222222;//Mem or I/O
        #17 HI_in=32'h33333333;
        #17 LO_in=32'h44444444;
        #17 PC_plus_4_in=32'h55555556;  
        #17 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #17 Jalr_in=1'b0;
        #17 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #17 Mfhi_in=1'b0;//write reg from HI
        #17 Mflo_in=1'b0;//write reg from LO
        #17 Write_ALU_result_in=1'b0;
        #17 Write_read_data_in=1'b0;   
        #17 Less=1'b0;       
        //write reg address control
        #17 Jal_in=1'b0;
        #17 Bgezal_in=1'b0;
        #17 Bltzal_in=1'b1;
        #17 I_format_in=1'b1;
        #17 Mfc0_in=1'b0;
        #17 Reg_write_en_in=1'b1;     
        
        
        //bgezal
        #21 ALU_result=32'h11111111;
        #21 Read_data=32'h22222222;//Mem or I/O
        #21 HI_in=32'h33333333;
        #21 LO_in=32'h44444444;
        #21 PC_plus_4_in=32'h55555556;  
        #21 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #21 Jalr_in=1'b0;
        #21 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #21 Mfhi_in=1'b0;//write reg from HI
        #21 Mflo_in=1'b0;//write reg from LO
        #21 Write_ALU_result_in=1'b0;
        #21 Write_read_data_in=1'b0;   
        #21 Less=1'b1;       
        //write reg address control
        #21 Jal_in=1'b0;
        #21 Bgezal_in=1'b0;
        #21 Bltzal_in=1'b1;
        #21 I_format_in=1'b1;
        #21 Mfc0_in=1'b0;
        #21 Reg_write_en_in=1'b1;                
        
        
        //jal
        #25 ALU_result=32'h11111111;
        #25 Read_data=32'h22222222;//Mem or I/O
        #25 HI_in=32'h33333333;
        #25 LO_in=32'h44444444;
        #25 PC_plus_4_in=32'h55555557;  
        #25 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #25 Jalr_in=1'b0;
        #25 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #25 Mfhi_in=1'b0;//write reg from HI
        #25 Mflo_in=1'b0;//write reg from LO
        #25 Write_ALU_result_in=1'b0;
        #25 Write_read_data_in=1'b0;   
        #25 Less=1'b0;       
        //write reg address control
        #25 Jal_in=1'b1;
        #25 Bgezal_in=1'b0;
        #25 Bltzal_in=1'b0;
        #25 I_format_in=1'b0;
        #25 Mfc0_in=1'b0;
        #25 Reg_write_en_in=1'b1;     
      
        //slt
        #29 ALU_result=32'h11111111;
        #29 Read_data=32'h22222222;//Mem or I/O
        #29 HI_in=32'h33333333;
        #29 LO_in=32'h44444444;
        #29 PC_plus_4_in=32'h55555555;  
        #29 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #29 Jalr_in=1'b0;
        #29 Slt_in=4'b0001;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #29 Mfhi_in=1'b0;//write reg from HI
        #29 Mflo_in=1'b0;//write reg from LO
        #29 Write_ALU_result_in=1'b0;
        #29 Write_read_data_in=1'b0;   
        #29 Less=1'b0;       
        //write reg address control
        #29 Jal_in=1'b0;
        #29 Bgezal_in=1'b0;
        #29 Bltzal_in=1'b0;
        #29 I_format_in=1'b0;
        #29 Mfc0_in=1'b0;
        #29 Reg_write_en_in=1'b1;  
              
        //slt
        #33 ALU_result=32'h11111111;
        #33 Read_data=32'h22222222;//Mem or I/O
        #33 HI_in=32'h33333333;
        #33 LO_in=32'h44444444;
        #33 PC_plus_4_in=32'h55555555;  
        #33 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #33 Jalr_in=1'b0;
        #33 Slt_in=4'b0001;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #33 Mfhi_in=1'b0;//write reg from HI
        #33 Mflo_in=1'b0;//write reg from LO
        #33 Write_ALU_result_in=1'b0;
        #33 Write_read_data_in=1'b0;   
        #33 Less=1'b1;       
        //write reg address control
        #33 Jal_in=1'b0;
        #33 Bgezal_in=1'b0;
        #33 Bltzal_in=1'b0;
        #33 I_format_in=1'b0;
        #33 Mfc0_in=1'b0;
        #33 Reg_write_en_in=1'b1;    
        #33 Instruction_in=32'b010000_00100_00010_00001_00000_000000;          
        
        //sltu
        #37 ALU_result=32'h11111111;
        #37 Read_data=32'h22222222;//Mem or I/O
        #37 HI_in=32'h33333333;
        #37 LO_in=32'h44444444;
        #37 PC_plus_4_in=32'h55555555;  
        #37 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #37 Jalr_in=1'b0;
        #37 Slt_in=4'b0010;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #37 Mfhi_in=1'b0;//write reg from HI
        #37 Mflo_in=1'b0;//write reg from LO
        #37 Write_ALU_result_in=1'b0;
        #37 Write_read_data_in=1'b0;   
        #37 Less=1'b0;       
        //write reg address control
        #37 Jal_in=1'b0;
        #37 Bgezal_in=1'b0;
        #37 Bltzal_in=1'b0;
        #37 I_format_in=1'b0;
        #37 Mfc0_in=1'b0;
        #37 Reg_write_en_in=1'b1;  
              
        //sltu
        #41 ALU_result=32'h11111111;
        #41 Read_data=32'h22222222;//Mem or I/O
        #41 HI_in=32'h33333333;
        #41 LO_in=32'h44444444;
        #41 PC_plus_4_in=32'h55555555;  
        #41 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #41 Jalr_in=1'b0;
        #41 Slt_in=4'b0010;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #41 Mfhi_in=1'b0;//write reg from HI
        #41 Mflo_in=1'b0;//write reg from LO
        #41 Write_ALU_result_in=1'b0;
        #41 Write_read_data_in=1'b0;   
        #41 Less=1'b1;       
        //write reg address control
        #41 Jal_in=1'b0;
        #41 Bgezal_in=1'b0;
        #41 Bltzal_in=1'b0;
        #41 I_format_in=1'b0;
        #41 Mfc0_in=1'b0;
        #41 Reg_write_en_in=1'b1;                           
     
        //slti
        #45 ALU_result=32'h11111111;
        #45 Read_data=32'h22222222;//Mem or I/O
        #45 HI_in=32'h33333333;
        #45 LO_in=32'h44444444;
        #45 PC_plus_4_in=32'h55555555;  
        #45 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #45 Jalr_in=1'b0;
        #45 Slt_in=4'b0100;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #45 Mfhi_in=1'b0;//write reg from HI
        #45 Mflo_in=1'b0;//write reg from LO
        #45 Write_ALU_result_in=1'b0;
        #45 Write_read_data_in=1'b0;   
        #45 Less=1'b0;       
        //write reg address control
        #45 Jal_in=1'b0;
        #45 Bgezal_in=1'b0;
        #45 Bltzal_in=1'b0;
        #45 I_format_in=1'b1;
        #45 Mfc0_in=1'b0;
        #45 Reg_write_en_in=1'b1;  
              
        //slt
        #49 ALU_result=32'h11111111;
        #49 Read_data=32'h22222222;//Mem or I/O
        #49 HI_in=32'h33333333;
        #49 LO_in=32'h44444444;
        #49 PC_plus_4_in=32'h55555555;  
        #49 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #49 Jalr_in=1'b0;
        #49 Slt_in=4'b0100;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #49 Mfhi_in=1'b0;//write reg from HI
        #49 Mflo_in=1'b0;//write reg from LO
        #49 Write_ALU_result_in=1'b0;
        #49 Write_read_data_in=1'b0;   
        #49 Less=1'b1;       
        //write reg address control
        #49 Jal_in=1'b0;
        #49 Bgezal_in=1'b0;
        #49 Bltzal_in=1'b0;
        #49 I_format_in=1'b1;
        #49 Mfc0_in=1'b0;
        #49 Reg_write_en_in=1'b1;   
        
        //sltiu
        #53 ALU_result=32'h11111111;
        #53 Read_data=32'h22222222;//Mem or I/O
        #53 HI_in=32'h33333333;
        #53 LO_in=32'h44444444;
        #53 PC_plus_4_in=32'h55555555;  
        #53 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #53 Jalr_in=1'b0;
        #53 Slt_in=4'b1000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #53 Mfhi_in=1'b0;//write reg from HI
        #53 Mflo_in=1'b0;//write reg from LO
        #53 Write_ALU_result_in=1'b0;
        #53 Write_read_data_in=1'b0;   
        #53 Less=1'b0;       
        //write reg address control
        #53 Jal_in=1'b0;
        #53 Bgezal_in=1'b0;
        #53 Bltzal_in=1'b0;
        #53 I_format_in=1'b1;
        #53 Mfc0_in=1'b0;
        #53 Reg_write_en_in=1'b1;  
              
        //sltiu
        #57 ALU_result=32'h11111111;
        #57 Read_data=32'h22222222;//Mem or I/O
        #57 HI_in=32'h33333333;
        #57 LO_in=32'h44444444;
        #57 PC_plus_4_in=32'h55555555;  
        #57 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #57 Jalr_in=1'b0;
        #57 Slt_in=4'b1000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #57 Mfhi_in=1'b0;//write reg from HI
        #57 Mflo_in=1'b0;//write reg from LO
        #57 Write_ALU_result_in=1'b0;
        #57 Write_read_data_in=1'b0;   
        #57 Less=1'b1;       
        //write reg address control
        #57 Jal_in=1'b0;
        #57 Bgezal_in=1'b0;
        #57 Bltzal_in=1'b0;
        #57 I_format_in=1'b1;
        #57 Mfc0_in=1'b0;
        #57 Reg_write_en_in=1'b1; 
        
        //mfhi
        #61 ALU_result=32'h11111111;
        #61 Read_data=32'h22222222;//Mem or I/O
        #61 HI_in=32'h33333333;
        #61 LO_in=32'h44444444;
        #61 PC_plus_4_in=32'h55555555;  
        #61 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #61 Jalr_in=1'b0;
        #61 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #61 Mfhi_in=1'b1;//write reg from HI
        #61 Mflo_in=1'b0;//write reg from LO
        #61 Write_ALU_result_in=1'b0;
        #61 Write_read_data_in=1'b0;   
        #61 Less=1'b0;       
        //write reg address control
        #61 Jal_in=1'b0;
        #61 Bgezal_in=1'b0;
        #61 Bltzal_in=1'b0;
        #61 I_format_in=1'b0;
        #61 Mfc0_in=1'b0;
        #61 Reg_write_en_in=1'b1;  
              
        //mflo
        #65 ALU_result=32'h11111111;
        #65 Read_data=32'h22222222;//Mem or I/O
        #65 HI_in=32'h33333333;
        #65 LO_in=32'h44444444;
        #65 PC_plus_4_in=32'h55555555;  
        #65 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #65 Jalr_in=1'b0;
        #65 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #65 Mfhi_in=1'b0;//write reg from HI
        #65 Mflo_in=1'b1;//write reg from LO
        #65 Write_ALU_result_in=1'b0;
        #65 Write_read_data_in=1'b0;   
        #65 Less=1'b1;       
        //write reg address control
        #65 Jal_in=1'b0;
        #65 Bgezal_in=1'b0;
        #65 Bltzal_in=1'b0;
        #65 I_format_in=1'b0;
        #65 Mfc0_in=1'b0;
        #65 Reg_write_en_in=1'b1;              
        
        //add
        #69 ALU_result=32'h11111111;
        #69 Read_data=32'h22222222;//Mem or I/O
        #69 HI_in=32'h33333333;
        #69 LO_in=32'h44444444;
        #69 PC_plus_4_in=32'h55555555;  
        #69 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #69 Jalr_in=1'b0;
        #69 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #69 Mfhi_in=1'b0;//write reg from HI
        #69 Mflo_in=1'b0;//write reg from LO
        #69 Write_ALU_result_in=1'b1;
        #69 Write_read_data_in=1'b0;   
        #69 Less=1'b0;       
        //write reg address control
        #69 Jal_in=1'b0;
        #69 Bgezal_in=1'b0;
        #69 Bltzal_in=1'b0;
        #69 I_format_in=1'b0;
        #69 Mfc0_in=1'b0;
        #69 Reg_write_en_in=1'b1;  
              
        //addu
        #73 ALU_result=32'h11111112;
        #73 Read_data=32'h22222222;//Mem or I/O
        #73 HI_in=32'h33333333;
        #73 LO_in=32'h44444444;
        #73 PC_plus_4_in=32'h55555555;  
        #73 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #73 Jalr_in=1'b0;
        #73 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #73 Mfhi_in=1'b0;//write reg from HI
        #73 Mflo_in=1'b0;//write reg from LO
        #73 Write_ALU_result_in=1'b1;
        #73 Write_read_data_in=1'b0;   
        #73 Less=1'b1;       
        //write reg address control
        #73 Jal_in=1'b0;
        #73 Bgezal_in=1'b0;
        #73 Bltzal_in=1'b0;
        #73 I_format_in=1'b0;
        #73 Mfc0_in=1'b0;
        #73 Reg_write_en_in=1'b1;        
                   
        //sub
        #77 ALU_result=32'h11111113;
        #77 Read_data=32'h22222222;//Mem or I/O
        #77 HI_in=32'h33333333;
        #77 LO_in=32'h44444444;
        #77 PC_plus_4_in=32'h55555555;  
        #77 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #77 Jalr_in=1'b0;
        #77 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #77 Mfhi_in=1'b0;//write reg from HI
        #77 Mflo_in=1'b0;//write reg from LO
        #77 Write_ALU_result_in=1'b1;
        #77 Write_read_data_in=1'b0;   
        #77 Less=1'b1;       
        //write reg address control
        #77 Jal_in=1'b0;
        #77 Bgezal_in=1'b0;
        #77 Bltzal_in=1'b0;
        #77 I_format_in=1'b0;
        #77 Mfc0_in=1'b0;
        #77 Reg_write_en_in=1'b1;   
        
        //subu
        #81 ALU_result=32'h11111114;
        #81 Read_data=32'h22222222;//Mem or I/O
        #81 HI_in=32'h33333333;
        #81 LO_in=32'h44444444;
        #81 PC_plus_4_in=32'h55555555;  
        #81 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #81 Jalr_in=1'b0;
        #81 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #81 Mfhi_in=1'b0;//write reg from HI
        #81 Mflo_in=1'b0;//write reg from LO
        #81 Write_ALU_result_in=1'b1;
        #81 Write_read_data_in=1'b0;   
        #81 Less=1'b1;       
        //write reg address control
        #81 Jal_in=1'b0;
        #81 Bgezal_in=1'b0;
        #81 Bltzal_in=1'b0;
        #81 I_format_in=1'b0;
        #81 Mfc0_in=1'b0;
        #81 Reg_write_en_in=1'b1;   
        
        //and
        #85 ALU_result=32'h11111115;
        #85 Read_data=32'h22222222;//Mem or I/O
        #85 HI_in=32'h33333333;
        #85 LO_in=32'h44444444;
        #85 PC_plus_4_in=32'h55555555;  
        #85 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #85 Jalr_in=1'b0;
        #85 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #85 Mfhi_in=1'b0;//write reg from HI
        #85 Mflo_in=1'b0;//write reg from LO
        #85 Write_ALU_result_in=1'b1;
        #85 Write_read_data_in=1'b0;   
        #85 Less=1'b1;       
        //write reg address control
        #85 Jal_in=1'b0;
        #85 Bgezal_in=1'b0;
        #85 Bltzal_in=1'b0;
        #85 I_format_in=1'b0;
        #85 Mfc0_in=1'b0;
        #85 Reg_write_en_in=1'b1;     
        
        //or
        #89 ALU_result=32'h11111116;
        #89 Read_data=32'h22222222;//Mem or I/O
        #89 HI_in=32'h33333333;
        #89 LO_in=32'h44444444;
        #89 PC_plus_4_in=32'h55555555;  
        #89 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #89 Jalr_in=1'b0;
        #89 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #89 Mfhi_in=1'b0;//write reg from HI
        #89 Mflo_in=1'b0;//write reg from LO
        #89 Write_ALU_result_in=1'b1;
        #89 Write_read_data_in=1'b0;   
        #89 Less=1'b1;       
        //write reg address control
        #89 Jal_in=1'b0;
        #89 Bgezal_in=1'b0;
        #89 Bltzal_in=1'b0;
        #89 I_format_in=1'b0;
        #89 Mfc0_in=1'b0;
        #89 Reg_write_en_in=1'b1;  
        
        //xor
        #93 ALU_result=32'h11111117;
        #93 Read_data=32'h22222222;//Mem or I/O
        #93 HI_in=32'h33333333;
        #93 LO_in=32'h44444444;
        #93 PC_plus_4_in=32'h55555555;  
        #93 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #93 Jalr_in=1'b0;
        #93 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #93 Mfhi_in=1'b0;//write reg from HI
        #93 Mflo_in=1'b0;//write reg from LO
        #93 Write_ALU_result_in=1'b1;
        #93 Write_read_data_in=1'b0;   
        #93 Less=1'b1;       
        //write reg address control
        #93 Jal_in=1'b0;
        #93 Bgezal_in=1'b0;
        #93 Bltzal_in=1'b0;
        #93 I_format_in=1'b0;
        #93 Mfc0_in=1'b0;
        #93 Reg_write_en_in=1'b1;    
        
        //nor
        #97 ALU_result=32'h11111118;
        #97 Read_data=32'h22222222;//Mem or I/O
        #97 HI_in=32'h33333333;
        #97 LO_in=32'h44444444;
        #97 PC_plus_4_in=32'h55555555;  
        #97 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #97 Jalr_in=1'b0;
        #97 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #97 Mfhi_in=1'b0;//write reg from HI
        #97 Mflo_in=1'b0;//write reg from LO
        #97 Write_ALU_result_in=1'b1;
        #97 Write_read_data_in=1'b0;   
        #97 Less=1'b1;       
        //write reg address control
        #97 Jal_in=1'b0;
        #97 Bgezal_in=1'b0;
        #97 Bltzal_in=1'b0;
        #97 I_format_in=1'b0;
        #97 Mfc0_in=1'b0;
        #97 Reg_write_en_in=1'b1;      
        
        //sll
        #101 ALU_result=32'h11111119;
        #101 Read_data=32'h22222222;//Mem or I/O
        #101 HI_in=32'h33333333;
        #101 LO_in=32'h44444444;
        #101 PC_plus_4_in=32'h55555555;  
        #101 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #101 Jalr_in=1'b0;
        #101 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #101 Mfhi_in=1'b0;//write reg from HI
        #101 Mflo_in=1'b0;//write reg from LO
        #101 Write_ALU_result_in=1'b1;
        #101 Write_read_data_in=1'b0;   
        #101 Less=1'b1;       
        //write reg address control
        #101 Jal_in=1'b0;
        #101 Bgezal_in=1'b0;
        #101 Bltzal_in=1'b0;
        #101 I_format_in=1'b0;
        #101 Mfc0_in=1'b0;
        #101 Reg_write_en_in=1'b1;       
        
        //srl
        #105 ALU_result=32'h1111111a;
        #105 Read_data=32'h22222222;//Mem or I/O
        #105 HI_in=32'h33333333;
        #105 LO_in=32'h44444444;
        #105 PC_plus_4_in=32'h55555555;  
        #105 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #105 Jalr_in=1'b0;
        #105 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #105 Mfhi_in=1'b0;//write reg from HI
        #105 Mflo_in=1'b0;//write reg from LO
        #105 Write_ALU_result_in=1'b1;
        #105 Write_read_data_in=1'b0;   
        #105 Less=1'b1;       
        //write reg address control
        #105 Jal_in=1'b0;
        #105 Bgezal_in=1'b0;
        #105 Bltzal_in=1'b0;
        #105 I_format_in=1'b0;
        #105 Mfc0_in=1'b0;
        #105 Reg_write_en_in=1'b1;  
        
        //sra
        #109 ALU_result=32'h1111111b;
        #109 Read_data=32'h22222222;//Mem or I/O
        #109 HI_in=32'h33333333;
        #109 LO_in=32'h44444444;
        #109 PC_plus_4_in=32'h55555555;  
        #109 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #109 Jalr_in=1'b0;
        #109 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #109 Mfhi_in=1'b0;//write reg from HI
        #109 Mflo_in=1'b0;//write reg from LO
        #109 Write_ALU_result_in=1'b1;
        #109 Write_read_data_in=1'b0;   
        #109 Less=1'b1;       
        //write reg address control
        #109 Jal_in=1'b0;
        #109 Bgezal_in=1'b0;
        #109 Bltzal_in=1'b0;
        #109 I_format_in=1'b0;
        #109 Mfc0_in=1'b0;
        #109 Reg_write_en_in=1'b1;      
        
        //sllv
        #113 ALU_result=32'h1111111c;
        #113 Read_data=32'h22222222;//Mem or I/O
        #113 HI_in=32'h33333333;
        #113 LO_in=32'h44444444;
        #113 PC_plus_4_in=32'h55555555;  
        #113 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #113 Jalr_in=1'b0;
        #113 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #113 Mfhi_in=1'b0;//write reg from HI
        #113 Mflo_in=1'b0;//write reg from LO
        #113 Write_ALU_result_in=1'b1;
        #113 Write_read_data_in=1'b0;   
        #113 Less=1'b1;       
        //write reg address control
        #113 Jal_in=1'b0;
        #113 Bgezal_in=1'b0;
        #113 Bltzal_in=1'b0;
        #113 I_format_in=1'b0;
        #113 Mfc0_in=1'b0;
        #113 Reg_write_en_in=1'b1;     
        
        //srlv
        #117 ALU_result=32'h1111111d;
        #117 Read_data=32'h22222222;//Mem or I/O
        #117 HI_in=32'h33333333;
        #117 LO_in=32'h44444444;
        #117 PC_plus_4_in=32'h55555555;  
        #117 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #117 Jalr_in=1'b0;
        #117 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #117 Mfhi_in=1'b0;//write reg from HI
        #117 Mflo_in=1'b0;//write reg from LO
        #117 Write_ALU_result_in=1'b1;
        #117 Write_read_data_in=1'b0;   
        #117 Less=1'b1;       
        //write reg address control
        #117 Jal_in=1'b0;
        #117 Bgezal_in=1'b0;
        #117 Bltzal_in=1'b0;
        #117 I_format_in=1'b0;
        #117 Mfc0_in=1'b0;
        #117 Reg_write_en_in=1'b1;   
        
        //srav
        #121 ALU_result=32'h1111111e;
        #121 Read_data=32'h22222222;//Mem or I/O
        #121 HI_in=32'h33333333;
        #121 LO_in=32'h44444444;
        #121 PC_plus_4_in=32'h55555555;  
        #121 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #121 Jalr_in=1'b0;
        #121 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #121 Mfhi_in=1'b0;//write reg from HI
        #121 Mflo_in=1'b0;//write reg from LO
        #121 Write_ALU_result_in=1'b1;
        #121 Write_read_data_in=1'b0;   
        #121 Less=1'b1;       
        //write reg address control
        #121 Jal_in=1'b0;
        #121 Bgezal_in=1'b0;
        #121 Bltzal_in=1'b0;
        #121 I_format_in=1'b0;
        #121 Mfc0_in=1'b0;
        #121 Reg_write_en_in=1'b1; 
        
        //addi
        #125 ALU_result=32'h1111111f;
        #125 Read_data=32'h22222222;//Mem or I/O
        #125 HI_in=32'h33333333;
        #125 LO_in=32'h44444444;
        #125 PC_plus_4_in=32'h55555555;  
        #125 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #125 Jalr_in=1'b0;
        #125 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #125 Mfhi_in=1'b0;//write reg from HI
        #125 Mflo_in=1'b0;//write reg from LO
        #125 Write_ALU_result_in=1'b1;
        #125 Write_read_data_in=1'b0;   
        #125 Less=1'b1;       
        //write reg address control
        #125 Jal_in=1'b0;
        #125 Bgezal_in=1'b0;
        #125 Bltzal_in=1'b0;
        #125 I_format_in=1'b1;
        #125 Mfc0_in=1'b0;
        #125 Reg_write_en_in=1'b1;      
        
        //addiu
        #129 ALU_result=32'h11111120;
        #129 Read_data=32'h22222222;//Mem or I/O
        #129 HI_in=32'h33333333;
        #129 LO_in=32'h44444444;
        #129 PC_plus_4_in=32'h55555555;  
        #129 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #129 Jalr_in=1'b0;
        #129 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #129 Mfhi_in=1'b0;//write reg from HI
        #129 Mflo_in=1'b0;//write reg from LO
        #129 Write_ALU_result_in=1'b1;
        #129 Write_read_data_in=1'b0;   
        #129 Less=1'b1;       
        //write reg address control
        #129 Jal_in=1'b0;
        #129 Bgezal_in=1'b0;
        #129 Bltzal_in=1'b0;
        #129 I_format_in=1'b1;
        #129 Mfc0_in=1'b0;
        #129 Reg_write_en_in=1'b1;  
        #129 Instruction_in=32'b000000_00001_00010_00000_00000_100000;       
        
        //andi
        #133 ALU_result=32'h11111121;
        #133 Read_data=32'h22222222;//Mem or I/O
        #133 HI_in=32'h33333333;
        #133 LO_in=32'h44444444;
        #133 PC_plus_4_in=32'h55555555;  
        #133 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #133 Jalr_in=1'b0;
        #133 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #133 Mfhi_in=1'b0;//write reg from HI
        #133 Mflo_in=1'b0;//write reg from LO
        #133 Write_ALU_result_in=1'b1;
        #133 Write_read_data_in=1'b0;   
        #133 Less=1'b1;       
        //write reg address control
        #133 Jal_in=1'b0;
        #133 Bgezal_in=1'b0;
        #133 Bltzal_in=1'b0;
        #133 I_format_in=1'b1;
        #133 Mfc0_in=1'b0;
        #133 Reg_write_en_in=1'b1;          
        
        //ori
        #137 ALU_result=32'h11111122;
        #137 Read_data=32'h22222222;//Mem or I/O
        #137 HI_in=32'h33333333;
        #137 LO_in=32'h44444444;
        #137 PC_plus_4_in=32'h55555555;  
        #137 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #137 Jalr_in=1'b0;
        #137 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #137 Mfhi_in=1'b0;//write reg from HI
        #137 Mflo_in=1'b0;//write reg from LO
        #137 Write_ALU_result_in=1'b1;
        #137 Write_read_data_in=1'b0;   
        #137 Less=1'b1;       
        //write reg address control
        #137 Jal_in=1'b0;
        #137 Bgezal_in=1'b0;
        #137 Bltzal_in=1'b0;
        #137 I_format_in=1'b1;
        #137 Mfc0_in=1'b0;
        #137 Reg_write_en_in=1'b1;       
        
        //xori
        #141 ALU_result=32'h11111123;
        #141 Read_data=32'h22222222;//Mem or I/O
        #141 HI_in=32'h33333333;
        #141 LO_in=32'h44444444;
        #141 PC_plus_4_in=32'h55555555;  
        #141 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #141 Jalr_in=1'b0;
        #141 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #141 Mfhi_in=1'b0;//write reg from HI
        #141 Mflo_in=1'b0;//write reg from LO
        #141 Write_ALU_result_in=1'b1;
        #141 Write_read_data_in=1'b0;   
        #141 Less=1'b1;       
        //write reg address control
        #141 Jal_in=1'b0;
        #141 Bgezal_in=1'b0;
        #141 Bltzal_in=1'b0;
        #141 I_format_in=1'b1;
        #141 Mfc0_in=1'b0;
        #141 Reg_write_en_in=1'b1; 
        
        //lui
        #145 ALU_result=32'h11111124;
        #145 Read_data=32'h22222222;//Mem or I/O
        #145 HI_in=32'h33333333;
        #145 LO_in=32'h44444444;
        #145 PC_plus_4_in=32'h55555555;  
        #145 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #145 Jalr_in=1'b0;
        #145 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #145 Mfhi_in=1'b0;//write reg from HI
        #145 Mflo_in=1'b0;//write reg from LO
        #145 Write_ALU_result_in=1'b1;
        #145 Write_read_data_in=1'b0;   
        #145 Less=1'b1;       
        //write reg address control
        #145 Jal_in=1'b0;
        #145 Bgezal_in=1'b0;
        #145 Bltzal_in=1'b0;
        #145 I_format_in=1'b1;
        #145 Mfc0_in=1'b0;
        #145 Reg_write_en_in=1'b1;    
        
        //lb
        #149 ALU_result=32'h1111111f;
        #149 Read_data=32'h22222222;//Mem or I/O
        #149 HI_in=32'h33333333;
        #149 LO_in=32'h44444444;
        #149 PC_plus_4_in=32'h55555555;  
        #149 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #149 Jalr_in=1'b0;
        #149 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #149 Mfhi_in=1'b0;//write reg from HI
        #149 Mflo_in=1'b0;//write reg from LO
        #149 Write_ALU_result_in=1'b0;
        #149 Write_read_data_in=1'b1;   
        #149 Less=1'b1;       
        //write reg address control
        #149 Jal_in=1'b0;
        #149 Bgezal_in=1'b0;
        #149 Bltzal_in=1'b0;
        #149 I_format_in=1'b1;
        #149 Mfc0_in=1'b0;
        #149 Reg_write_en_in=1'b1;        
        
        //lbu
        #153 ALU_result=32'h1111111f;
        #153 Read_data=32'h22222223;//Mem or I/O
        #153 HI_in=32'h33333333;
        #153 LO_in=32'h44444444;
        #153 PC_plus_4_in=32'h55555555;  
        #153 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #153 Jalr_in=1'b0;
        #153 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #153 Mfhi_in=1'b0;//write reg from HI
        #153 Mflo_in=1'b0;//write reg from LO
        #153 Write_ALU_result_in=1'b0;
        #153 Write_read_data_in=1'b1;   
        #153 Less=1'b1;       
        //write reg address control
        #153 Jal_in=1'b0;
        #153 Bgezal_in=1'b0;
        #153 Bltzal_in=1'b0;
        #153 I_format_in=1'b1;
        #153 Mfc0_in=1'b0;
        #153 Reg_write_en_in=1'b1;  
        
        //lh
        #157 ALU_result=32'h1111111f;
        #157 Read_data=32'h22222224;//Mem or I/O
        #157 HI_in=32'h33333333;
        #157 LO_in=32'h44444444;
        #157 PC_plus_4_in=32'h55555555;  
        #157 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #157 Jalr_in=1'b0;
        #157 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #157 Mfhi_in=1'b0;//write reg from HI
        #157 Mflo_in=1'b0;//write reg from LO
        #157 Write_ALU_result_in=1'b0;
        #157 Write_read_data_in=1'b1;   
        #157 Less=1'b1;       
        //write reg address control
        #157 Jal_in=1'b0;
        #157 Bgezal_in=1'b0;
        #157 Bltzal_in=1'b0;
        #157 I_format_in=1'b1;
        #157 Mfc0_in=1'b0;
        #157 Reg_write_en_in=1'b1;    
        
        //lhu
        #161 ALU_result=32'h1111111f;
        #161 Read_data=32'h22222225;//Mem or I/O
        #161 HI_in=32'h33333333;
        #161 LO_in=32'h44444444;
        #161 PC_plus_4_in=32'h55555555;  
        #161 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #161 Jalr_in=1'b0;
        #161 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #161 Mfhi_in=1'b0;//write reg from HI
        #161 Mflo_in=1'b0;//write reg from LO
        #161 Write_ALU_result_in=1'b0;
        #161 Write_read_data_in=1'b1;   
        #161 Less=1'b1;       
        //write reg address control
        #161 Jal_in=1'b0;
        #161 Bgezal_in=1'b0;
        #161 Bltzal_in=1'b0;
        #161 I_format_in=1'b1;
        #161 Mfc0_in=1'b0;
        #161 Reg_write_en_in=1'b1;          
        
        //lw
        #165 ALU_result=32'h1111111f;
        #165 Read_data=32'h22222226;//Mem or I/O
        #165 HI_in=32'h33333333;
        #165 LO_in=32'h44444444;
        #165 PC_plus_4_in=32'h55555555;  
        #165 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #165 Jalr_in=1'b0;
        #165 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #165 Mfhi_in=1'b0;//write reg from HI
        #165 Mflo_in=1'b0;//write reg from LO
        #165 Write_ALU_result_in=1'b0;
        #165 Write_read_data_in=1'b1;   
        #165 Less=1'b1;       
        //write reg address control
        #165 Jal_in=1'b0;
        #165 Bgezal_in=1'b0;
        #165 Bltzal_in=1'b0;
        #165 I_format_in=1'b1;
        #165 Mfc0_in=1'b0;
        #165 Reg_write_en_in=1'b1;    
        
        //mfc0
        #169 ALU_result=32'h1111111f;
        #169 Read_data=32'h22222222;//Mem or I/O
        #169 HI_in=32'h33333333;
        #169 LO_in=32'h44444444;
        #169 PC_plus_4_in=32'h55555555;  
        #169 CP0_data_in=32'h66666666;
        //write reg data control
        //Jal_in
        #169 Jalr_in=1'b0;
        #169 Slt_in=4'b0000;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
        #169 Mfhi_in=1'b0;//write reg from HI
        #169 Mflo_in=1'b0;//write reg from LO
        #169 Write_ALU_result_in=1'b0;
        #169 Write_read_data_in=1'b0;   
        #169 Less=1'b1;       
        //write reg address control
        #169 Jal_in=1'b0;
        #169 Bgezal_in=1'b0;
        #169 Bltzal_in=1'b0;
        #169 I_format_in=1'b0;
        #169 Mfc0_in=1'b1;
        #169 Reg_write_en_in=1'b1;                      
        
        
        
        //not write HILO
        #173 ALU_result_HI=32'h11111111;   
        #173 ALU_result_LO=32'h22222222;   
        #173 HILO_write_en_in=2'b00;
        
        //write LO
        #177 ALU_result_HI=32'h11111111;   
        #177 ALU_result_LO=32'h22222222;   
        #177 HILO_write_en_in=2'b01;
        
        //write HI
        #181 ALU_result_HI=32'h11111111;   
        #181 ALU_result_LO=32'h22222222;   
        #181 HILO_write_en_in=2'b10;
        
        //write LO/HI
        #185 ALU_result_HI=32'h33333333;   
        #185 ALU_result_LO=32'h44444444;   
        #185 HILO_write_en_in=2'b11;
        
        //not write
        #189 ALU_result_HI=32'h55555555;   
        #189 ALU_result_LO=32'h66666666;   
        #189 HILO_write_en_in=2'b00;             
        
        
        
        
        #193 Instruction_in=32'b000000_00001_00010_00011_00000_100000;
        #197 Instruction_in=32'b000000_00001_00010_00011_00000_100001;
        #201 Instruction_in=32'b000000_00001_00010_00011_00000_100010;
        #205 Instruction_in=32'b000000_00001_00010_00011_00000_100011;
        #209 Instruction_in=32'b000000_00001_00010_00011_00000_100100;
        
        #213 Instruction_in=32'b000000_00001_00010_00000_00000_011000;
        #217 Instruction_in=32'b000000_00001_00010_00000_00000_011001;
        #221 Instruction_in=32'b000000_00001_00010_00000_00000_011010;
        #225 Instruction_in=32'b000000_00001_00010_00000_00000_011011;
        
        #229 Instruction_in=32'b000000_00000_00000_00011_00000_010000;
        #233 Instruction_in=32'b000000_00000_00000_00011_00000_010010;      
        
        #237 Instruction_in=32'b000000_00001_00000_00000_00000_010001;
        #241 Instruction_in=32'b000000_00001_00000_00000_00000_010011;
        
        #245 Instruction_in=32'b010000_00000_00001_00010_00000_000011;
        #249 Instruction_in=32'b010000_00100_00001_00010_00000_000011;
        
        #253 Instruction_in=32'b000000_00001_00010_00011_00000_100101;
        #257 Instruction_in=32'b000000_00001_00010_00011_00000_100110;
        #261 Instruction_in=32'b000000_00001_00010_00011_00000_100111;
        #265 Instruction_in=32'b000000_00001_00010_00011_00000_101010;
        #269 Instruction_in=32'b000000_00001_00010_00011_00000_101011;
        
        #273 Instruction_in=32'b000000_00000_00001_00010_00000_000000;
        #277 Instruction_in=32'b000000_00000_00001_00010_11111_000010;
        #281 Instruction_in=32'b000000_00000_00001_00010_10101_000011;
        
        #285 Instruction_in=32'b000000_00001_00010_00011_00000_000100;
        #289 Instruction_in=32'b000000_00001_00010_00011_00000_000110;
        #293 Instruction_in=32'b000000_00001_00010_00011_00000_000111;
        
        #297 Instruction_in=32'b000000_00001_00000_00000_00000_001000;
        
        #301 Instruction_in=32'b000000_00001_00000_00011_00000_001001;
        
        #305 Instruction_in=32'b000000_00100_00101_00010_00000_001101;
        #309 Instruction_in=32'b000000_00100_00101_00010_11110_001100;
        
        #313 Instruction_in=32'b010000_10000_00000_00000_00000_011000;

        #317 Instruction_in=32'b001000_00001_00010_00010_00000_011000;
        #321 Instruction_in=32'b001001_00001_00010_00010_10000_011000;
        #325 Instruction_in=32'b001100_00001_00010_00010_01000_011000;
        #329 Instruction_in=32'b001101_00001_00010_00010_00100_011000;
        #333 Instruction_in=32'b001110_00001_00010_00010_00010_011000;
        
        #337 Instruction_in=32'b001111_00000_00100_00010_00111_011000;
        
        #341 Instruction_in=32'b100000_00001_00010_10010_00000_011000;
        #345 Instruction_in=32'b100100_00001_00010_01010_00000_011000;
        #349 Instruction_in=32'b100001_00001_00010_00110_00000_011000;
        #353 Instruction_in=32'b100101_00001_00010_00011_00000_011000;
        #357 Instruction_in=32'b101000_00001_00010_00010_10000_011000;
        #361 Instruction_in=32'b101001_00001_00010_00010_01000_011000;
        #365 Instruction_in=32'b100011_00001_00010_00010_00100_011000;
        #369 Instruction_in=32'b101011_00001_00010_00010_00010_011000;
        #373 Instruction_in=32'b000100_00001_00010_00010_00001_011000;
        #377 Instruction_in=32'b000101_00001_00010_00010_00000_111000;
        
        #381 Instruction_in=32'b000001_00001_00001_10010_00000_011000;
        #385 Instruction_in=32'b000111_00001_00101_00110_00000_011000;
        #389 Instruction_in=32'b000110_00001_00101_00010_10000_011000;
        #393 Instruction_in=32'b000001_00001_00000_00010_00100_011000;
        #397 Instruction_in=32'b000001_00001_10001_00010_00010_011000;
        #401 Instruction_in=32'b000001_00001_10000_00010_00000_011010;
        
        #405 Instruction_in=32'b001010_00001_00010_00010_11100_011000;
        #409 Instruction_in=32'b001011_00001_00010_00010_01110_011000;
        
        #413 Instruction_in=32'b000010_00100_00101_00010_01010_011000;
        #417 Instruction_in=32'b000011_00100_00101_00010_11110_011000;               
    join


endmodule
