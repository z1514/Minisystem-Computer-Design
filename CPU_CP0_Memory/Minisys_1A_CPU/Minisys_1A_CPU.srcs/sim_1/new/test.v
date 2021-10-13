`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 22:21:00
// Design Name: 
// Module Name: ALU
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


module test();
    //input
    reg clock;
    reg reset;
    
    reg Mfc0_in;
    reg Mtc0_in;
    reg [2:0] Sel_in;
    reg [4:0] RD_address_in;
    reg [4:0] RT_data_in;
    
    reg Break_in;
    reg Syscall_in;
    
    reg [5:0] External_interrupt;
    
    //Internal exception
    reg OF;
    reg CF;
    reg ER;
    reg Ins_invalid;
    reg Access_error_in;
    
    reg [31:0] PC_plus_4_in; 
    
    reg Eret_in;
    
    
    //output
    wire [5:0] Interrupt_respond;
    wire [31:0] RT_data_out;
    wire [31:0] PC_out;
    wire PC_CP0_en_out;
    wire Access_error_out;
    wire clear;


    CP0 uut(
        //input
        clock,
        reset,
        
        Mfc0_in,
        Mtc0_in,
        Sel_in,
        RD_address_in,
        RT_data_in,
        
        Break_in,
        Syscall_in,
        
        External_interrupt,
     
        //Internal exception
        OF,
        CF,
        ER,
        Ins_invalid,
        Access_error_in,
        
        PC_plus_4_in, 
        
        Eret_in,
        
        
        //output
        Interrupt_respond,
        RT_data_out,
        PC_out,
        PC_CP0_en_out,
        Access_error_out,
        clear        
    );    
    always #2 clock=~clock;
    
    initial fork   
    join
endmodule
