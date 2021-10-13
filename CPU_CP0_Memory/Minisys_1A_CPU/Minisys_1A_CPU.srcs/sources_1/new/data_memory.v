`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/16 06:21:36
// Design Name: 
// Module Name: data_memory
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


module data_memory(
    //input
    clock,
    reset,
    
    Address,
    
    Write_data,
    Mem_write_en_0,
    Mem_write_en_1,
    Mem_write_en_2,
    Mem_write_en_3,
    
    
    //output
    Read_data
    );
    
    //input
    input clock,reset;
    
    input [31:0] Address,Write_data;
    input Mem_write_en_0,Mem_write_en_1,Mem_write_en_2,Mem_write_en_3;
    
    //output
    output [31:0] Read_data;
    
    
    dataram0 dataram0(.clka(~clock),
              .wea(Mem_write_en_0),
              .addra(Address[15:2]),
              .dina(Write_data[7:0]),
              .douta(Read_data[7:0]));
              
    dataram1 dataram1(.clka(~clock),
              .wea(Mem_write_en_1),
              .addra(Address[15:2]),
              .dina(Write_data[15:8]),
              .douta(Read_data[15:8]));
              
    dataram2 dataram2(.clka(~clock),
              .wea(Mem_write_en_2),
              .addra(Address[15:2]),
              .dina(Write_data[23:16]),
              .douta(Read_data[23:16]));       
              
    dataram3 dataram3(.clka(~clock),
              .wea(Mem_write_en_3),
              .addra(Address[15:2]),
              .dina(Write_data[31:24]),
              .douta(Read_data[31:24]));                  
endmodule
