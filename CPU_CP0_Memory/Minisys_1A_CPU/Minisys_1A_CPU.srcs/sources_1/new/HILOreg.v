`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 17:34:12
// Design Name: 
// Module Name: HILOreg
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


module HILOreg(
    //input
    clock,
    //write HI/LO reg
    ALU_result_HI,
    ALU_result_LO,
    Read_data_1,
    HILO_write_en_in,//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    
    //output
    HI_out,
    LO_out
    );
    
    //input
    input clock;
    input [31:0] ALU_result_HI,ALU_result_LO,Read_data_1;
    input [1:0] HILO_write_en_in;//[1:0]  00-X , 01-write LO, 10-write HI, 11-write HO and LO
    
    //output
    output reg [31:0] HI_out,LO_out;
    
    reg [31:0] HI;
    reg [31:0] LO;
    
    always@(negedge clock) begin
        //write
        if(HILO_write_en_in==2'b01) begin
            LO=Read_data_1;
        end else if(HILO_write_en_in==2'b10) begin
            HI=Read_data_1;
        end else if(HILO_write_en_in==2'b11) begin
            LO=ALU_result_LO;
            HI=ALU_result_HI;
        end
        
        //read
        HI_out=HI;
        LO_out=LO;
    end
endmodule
