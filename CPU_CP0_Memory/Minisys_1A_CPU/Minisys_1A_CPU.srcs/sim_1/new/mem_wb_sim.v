`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 12:39:49
// Design Name: 
// Module Name: MEM_WB_sim
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


module mem_wb_sim();
    //input
    reg clock=0;
    reg reset;
    //memory output
    reg [31:0] Read_data_in;
    
    //needed input
    //write back
    //write reg data
    reg [31:0] ALU_result_in;
    //Read_data,//Mem or I/O
    reg [31:0] HI_in;
    reg [31:0]  LO_in;

    reg [31:0] PC_plus_4_in;
    //CP0_data_in,
    
    //write reg data control
    //Jal_in,
    reg Jalr_in;
    reg [3:0] Slt_in;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    reg Mfhi_in,//read HI
    Mflo_in,//read LO
    Write_ALU_result_in,
    Write_read_data_in,
    Less_in;
           
    reg [4:0] Direct_write_addr_in;
    reg [31:0] Direct_write_data_in;           
           
    //write reg address
    reg [4:0] RD_address_in;
    reg [4:0] RT_address_in;
    
    //write reg address control
    reg Jal_in,Bgezal_in,Bltzal_in,I_format_in,Mfc0_in,Reg_write_en_in;
        
    //write HI/LO reg
    reg [31:0] ALU_result_HI_in;
    reg [31:0] ALU_result_LO_in;
    reg [1:0] HILO_write_en_in;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    
    reg [31:0] CP0_data_in;
    reg [31:0]PC_CP0_in;
    reg PC_CP0_en_in;
    
    reg [31:0] IO_data_in;
    
    //fetch instruction
    reg Jmp_in,//j instruction
    //Jal,//jal instruction
    Jr_in,//jr ins
    //Jalr,//jalr ins
    Beq_in,//beq ins (rt)==(rs)
    Bne_in,//bne ins (rt)!=(rs)
    Bgez_in,//bgez ins (rs)>=0
    Bgtz_in,//bgtz ins (rs)>0
    Blez_in,//blez ins (rs)<=0
    Bltz_in,//bltz ins (rs)<0
    //Bgezal,//bgezal ins (rs)>=0
    //Bltzal,//bltzal ins (rs)<0
    Zero_in,//if (rs)==(rt) Zero=1, else Zero=0
    Bigger_in;//if (rs)>0 Bigger=1, else Bigger=0
    //Less,//if (rs)<0 Less=1, else Less=0
        
    reg [31:0] Read_data_1_in;//register data 1 (rs)
    reg [31:0] Add_result_in;   
    
    //output
    //memory output
    wire [31:0] Read_data_out;
    
    //needed input
    //write back
    //write reg data
    wire [31:0] ALU_result_out;
    //Read_data,//Mem or I/O
    wire [31:0] HI_out;
    wire [31:0] LO_out;
    wire [31:0] PC_plus_4_out;
    //CP0_data_in,
    
    //write reg data control
    //Jal_in,
    wire Jalr_out;
    wire [3:0] Slt_out;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
    wire Mfhi_out,//read HI
    Mflo_out,//read LO
    Write_ALU_result_out,
    Write_read_data_out,
    Less_out;
           
    //write reg address
    wire [4:0] RD_address_out;
    wire [4:0] RT_address_out;
    
    //write reg address control
    wire Jal_out,Bgezal_out,Bltzal_out,I_format_out,Mfc0_out,Reg_write_en_out;
    
    //write HI/LO reg
    wire [31:0] ALU_result_HI_out;
    wire [31:0] ALU_result_LO_out;
    wire [1:0] HILO_write_en_out;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    
    wire [4:0] Direct_write_addr_out;
    wire [31:0] Direct_write_data_out;
    
    //fetch instruction
    wire Jmp_out,//j instruction
    //Jal,//jal instruction
    Jr_out,//jr ins
    //Jalr,//jalr ins
    Beq_out,//beq ins (rt)==(rs)
    Bne_out,//bne ins (rt)!=(rs)
    Bgez_out,//bgez ins (rs)>=0
    Bgtz_out,//bgtz ins (rs)>0
    Blez_out,//blez ins (rs)<=0
    Bltz_out,//bltz ins (rs)<0
    //Bgezal,//bgezal ins (rs)>=0
    //Bltzal,//bltzal ins (rs)<0
    Zero_out,//if (rs)==(rt) Zero=1, else Zero=0
    Bigger_out;//if (rs)>0 Bigger=1, else Bigger=0
    //Less,//if (rs)<0 Less=1, else Less=0
        
    wire [31:0] Read_data_1_out;//register data 1 (rs)
    wire [31:0] Add_result_out;

    wire [31:0] CP0_data_out;
    wire [31:0]PC_CP0_out;
    wire PC_CP0_en_out;
    
    mem_wb uut(
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
    
    always #2 clock=~clock;
    
    initial fork
    
        #2 Read_data_1_in=32'hfffffffe;
//        #3 Read_data_in=1;
//        #3 ALU_result_in=1;
//        #3 HI_in=1;
//        #3 LO_in=1;
//        #3 PC_plus_4_in=1;
//        #3 Jalr_in=1;
//        #3 Slt_in=1;//Slt_in[3:0],0001-slt,0010-sltu,0100-slti,1000-sltiu
//        #3 Mfhi_in=1;//read HI
//        #3 Mflo_in=1;//read LO
//        #3 Write_ALU_result_in=1;
//        #3 Write_read_data_in=1;
//        #3 Less_in=1;
//        #3 RD_address_in=1;
//        #3 RT_address_in=1;
//        #3 Jal_in=1;
//        #3 Bgezal_in=1;
//        #3 Bltzal_in=1;
//        #3 I_format_in=1;
//        #3 Mfc0_in=1;
//        #3 Reg_write_en_in=1;
//        #3 ALU_result_HI_in=1;
//        #3 ALU_result_LO_in=1;
//        #3 HILO_write_en_in=1;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LOinstruction
//        #3 Jmp_in=1;//j instruction
//        #3 Jr_in=1;//jr ins
//        #3 Beq_in=1;//beq ins (rt)==(rs)
//        #3 Bne_in=1;//bne ins (rt)!=(rs)
//        #3 Bgez_in=1;//bgez ins (rs)>=0
//        #3 Bgtz_in=1;//bgtz ins (rs)>0
//        #3 Blez_in=1;//blez ins (rs)<=0
//        #3 Bltz_in=1;//bltz ins (rs)<0
//        #3 Zero_in=1;//if (rs)==(rt) Zero=1, else Zero=0
//        #3 Bigger_in=1;//if (rs)>0 Bigger=1, else Bigger=0
//        #3 Read_data_1_in=1;//register data 1 (rs)
//        #3 Add_result_in=1;    
    join
endmodule

