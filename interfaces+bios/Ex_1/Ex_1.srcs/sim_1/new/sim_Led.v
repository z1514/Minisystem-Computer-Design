`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 16:14:01
// Design Name: 
// Module Name: sim_Led
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


module sim_Led(
    );
    reg Reset;
    reg [2:0] Address;
    reg Cs;
    reg Clk;
    reg Iow;
    reg [15:0] Wdata;
    wire [15:0] leds;
    Led led(Reset,Address,Cs,Clk,Iow,Wdata,leds);
    always
    begin 
    Reset=0;
    Cs=1;
    Iow=1;
    Address=0;
    Clk=0;
    #5;
    Clk=1;
    Wdata=16'h1111;
    #5;
    end
endmodule
