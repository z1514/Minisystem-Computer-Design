`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 16:29:12
// Design Name: 
// Module Name: access_datamemory
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


module access_datamemory(
    //input
    clock,
    reset,
    
    Mem_read_type_in,
    Mem_read_extend_in,
    Mem_write_type_in,
    Mem_write_en_in,
    
    Write_data,
    Mem_address,
    
    //output
    Read_data
    );
    
    //input
    input clock,reset;
    input [1:0] Mem_read_type_in,Mem_write_type_in;//00-X,01-8b,10-16b,11-32b
    input Mem_read_extend_in,Mem_write_en_in;
    input [31:0] Write_data,Mem_address;
    
    //output
    output [31:0] Read_data;
    
    wire [31:0] Write_data_temp,Read_data_temp;
    wire Mem_write_en_0,Mem_write_en_1,Mem_write_en_2,Mem_write_en_3;
    
    pre_data_memory U0(
        //input
        Mem_address,
        Write_data,
        Mem_write_type_in,
        Mem_write_en_in,
        //output
        Write_data_temp,
        Mem_write_en_0,
        Mem_write_en_1,
        Mem_write_en_2,
        Mem_write_en_3
    );
    
    data_memory U1(
        //input
        clock,
        reset,
    
        Mem_address,
    
        Write_data_temp,
        Mem_write_en_0,
        Mem_write_en_1,
        Mem_write_en_2,
        Mem_write_en_3,
    
    
        //output
        Read_data_temp
    );
    
    post_data_memory U2(
        //input
        Mem_address,
        Read_data_temp,
        Mem_read_type_in,
        Mem_read_extend_in,
    
        //output
        Read_data
    );
    
    
endmodule
