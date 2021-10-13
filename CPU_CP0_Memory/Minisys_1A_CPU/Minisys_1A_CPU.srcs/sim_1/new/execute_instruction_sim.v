`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 00:39:40
// Design Name: 
// Module Name: execute_instruction_sim
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


module execute_instruction_sim();
    //input 
    reg clock=1;
    reg reset;
    //PC data
    reg [31:0] PC_plus_4_in;
    reg [31:0] Extend_imme_in;
    reg [31:0] Read_data_1;
    //PC control
    reg Jmp_in;
    reg Jal_in;
    reg Jr_in;
    reg Jalr_in;
    reg Beq_in;
    reg Bne_in;
    reg Bgez_in;
    reg Bgtz_in;
    reg Blez_in;
    reg Bltz_in;
    reg Bgezal_in;
    reg Bltzal_in;
    //ALU
    reg [31:0] Read_data_2;
    //Extend_imme_in
    reg I_format_in;
    reg [4:0] Shamt_in;
    reg [15:0] Imme_in;
    reg Lui_in;
    reg [3:0] Slt_in;//[3:0]
    reg Shift_opnum_in;//0-shamt,1-(rs)
    reg [3:0] ALU_op_in;//[3:0] 0000-X,0001-add/addi,0010-addu/addiu,0011-sub,0100-subu,0101-mult,0110-multu,0111-div,1000-divu,
           //1001-and/andi,1010-or/ori,1011-xor/xori,1100-nor,1101-sll/sllv,1110-srl/srlv,1111-sra/srav    
    
    //output
    //PC
    wire [31:0] PC_final_out;
    //ALU
    wire [31:0] ALU_result;
    wire [31:0] ALU_result_HI;
    wire [31:0] ALU_result_LO;
    wire Zero;
    wire Less;
    wire Bigger;
    
    execute_instruction uut(
        //input 
        clock,
        reset,
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
        //PC
        PC_final_out,
        //ALU
        ALU_result,
        ALU_result_HI,
        ALU_result_LO,
        Zero,
        Less,
        Bigger
    );
    
    always #2 clock=~clock;
    
    initial fork
        //add
        #0 Read_data_1=32'h1111_1111;
        #0 Read_data_2=32'h2222_2222;
        #0 I_format_in=1'b0;
        #0 Lui_in=1'b0;
        #0 Slt_in=4'b0000;
        #0 ALU_op_in=4'b0001;
        
        //add
        #4 Read_data_1=32'h8111_1111;
        #4 Read_data_2=32'h8222_2222;
        #4 I_format_in=1'b0;
        #4 Lui_in=1'b0;
        #4 Slt_in=4'b0000;
        #4 ALU_op_in=4'b0001;
        
        //add
        #8 Read_data_1=32'hF111_1111;
        #8 Read_data_2=32'h2222_2222;
        #8 I_format_in=1'b0;
        #8 Lui_in=1'b0;
        #8 Slt_in=4'b0000;
        #8 ALU_op_in=4'b0001;  
        
        //addi
        #12 Read_data_1=32'h1111_1111;
        #12 Extend_imme_in=32'h3333_3333;
        #12 I_format_in=1'b1;
        #12 Lui_in=1'b0;
        #12 Slt_in=4'b0000;
        #12 ALU_op_in=4'b0001;    
        
        //addi
        #16 Read_data_1=32'h8111_1111;
        #16 Extend_imme_in=32'h8333_3333;
        #16 I_format_in=1'b1;
        #16 Lui_in=1'b0;
        #16 Slt_in=4'b0000;
        #16 ALU_op_in=4'b0001;     
        
        //bne
        #20 PC_plus_4_in=32'h1111_1111;
        #20 Extend_imme_in=32'h2222_2222;    
        #20 Jmp_in=0;
        #20 Jal_in=0;
        #20 Beq_in=0;
        #20 Bne_in=1;
        #20 Bgez_in=0;
        #20 Bgtz_in=0;
        #20 Blez_in=0;
        #20 Bltz_in=0;
        #20 Bgezal_in=0;
        #20 Bltzal_in=0;     
        #20 I_format_in=1'b1;
        #20 Lui_in=1'b0;
        #20 Slt_in=4'b0000;
        #20 ALU_op_in=4'b0000;                     
        
    join
endmodule
