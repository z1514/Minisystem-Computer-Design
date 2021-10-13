`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 17:33:30
// Design Name: 
// Module Name: registers
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


module registers(
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
    //input
    input clock,Mfc0_out,Mtc0_out,
          Jalr_in,Mfhi_in,Mflo_in,Write_ALU_result_in,Write_read_data_in,Less,
          Jal_in,Bgezal_in,Bltzal_in,I_format_in,Mfc0_in,Reg_write_en_in;
    input [3:0] Slt_in;
    input [4:0] RD_address_in,RT_address_in;
    input [31:0] Instruction_in,ALU_result,Read_data,HI_in,LO_in,PC_plus_4_in,CP0_data_in;
    //output
    output reg [31:0] Read_data_1,Read_data_2;
    output reg [4:0] Direct_read_addr_1,Direct_read_addr_2;
    
    reg [31:0] regs [31:0];
    
    always @(negedge clock) begin
        //function write
        if(Reg_write_en_in==1) begin
            //write (rt) /write $31(bgezal,bltzal)
            if((I_format_in==1)||(Mfc0_in==1)) begin
                if(Mfc0_in==1) begin//mfc0
                    regs[RT_address_in]=CP0_data_in;
                end else if(Write_ALU_result_in==1) begin//addi,addiu,andi,ori,xori,lui
                    regs[RT_address_in]=ALU_result;
                end else if(Write_read_data_in==1) begin//lb,lbu,lh,lhu,lw
                    regs[RT_address_in]=Read_data;
                end else if((Bgezal_in==1)&&(Less==0)) begin//bgezal
                    regs[5'b11111]=PC_plus_4_in;
                end else if((Bltzal_in==1)&&(Less==1)) begin//bltzal
                    regs[5'b11111]=PC_plus_4_in;
                end else if(Slt_in==4'b0100) begin//slti
                    if(Less==1) begin//(rt)<-1
                        regs[RT_address_in]=32'h1;
                    end else begin//(rt)<-0
                        regs[RT_address_in]=32'h0;
                    end
                end else if(Slt_in==4'b1000) begin//sltiu
                    if(Less==1) begin//(rt)<-1
                        regs[RT_address_in]=32'h1;
                    end else begin//(rt)<-0
                        regs[RT_address_in]=32'h0;
                    end                    
                end
            end else begin//write (rd) or write $31(jal)
                if(Write_ALU_result_in==1) begin//add,addu,sub,subu,and,or,xor,nor,sll,srl,sra,sllv,srav.
                    regs[RD_address_in]=ALU_result;
                end else if(Mfhi_in==1) begin//mfhi
                    regs[RD_address_in]=HI_in;
                end else if(Mflo_in==1) begin//mflo
                    regs[RD_address_in]=LO_in;
                end else if(Slt_in==4'b0001) begin//slt
                    if(Less==1) begin
                        regs[RD_address_in]=32'h1;
                    end else begin
                        regs[RD_address_in]=32'h0;
                    end
                end else if(Slt_in==4'b0010) begin//sltu
                    if(Less==1) begin
                        regs[RD_address_in]=32'h1;
                    end else begin
                        regs[RD_address_in]=32'h0;
                    end
                end else if(Jalr_in==1) begin//jalr
                    regs[RD_address_in]=PC_plus_4_in;
                end else if(Jal_in==1) begin//jal
                    regs[5'b11111]=PC_plus_4_in;
                end
            end
        end
        
        //function read
        //Read_data_1
        if((Mfc0_out==1)||(Mtc0_out==1)) begin
            Direct_read_addr_1=Instruction_in[15:11];
            if(Instruction_in[15:11]==5'b00000) begin
                Read_data_1=32'b0;
            end else begin
                Read_data_1=regs[Instruction_in[15:11]];
            end
        end else begin
            Direct_read_addr_1=Instruction_in[25:21];
            if(Instruction_in[25:21]==5'b00000) begin
                Read_data_1=32'b0;
            end else begin
                Read_data_1=regs[Instruction_in[25:21]];
            end
        end
        
        //Read_data_2
        Direct_read_addr_2=Instruction_in[20:16];
        if(Instruction_in[20:16]==5'b00000) begin
            Read_data_2=32'b0;
        end else begin
            Read_data_2=regs[Instruction_in[20:16]];
        end                  
    end 
    
endmodule
