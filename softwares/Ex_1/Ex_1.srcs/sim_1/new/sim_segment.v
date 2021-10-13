`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 18:57:47
// Design Name: 
// Module Name: sim_segment
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


module sim_segment(
    );
    reg Reset;
    reg[2:0] Address;
    reg Cs;
    reg Clk;
    reg Iow;
    reg [15:0]Wdata;
    wire [7:0]digital;
    wire [7:0]ens;
    wire [7:0]data_ens;
    wire [7:0]ctrl_data;
    digitron dig(Reset,Address,Cs,Clk,Iow,Wdata,digital,ens,ctrl_data,data_ens);
    always
    begin
        //segment_clk是500Hz,clk的频率是1/10ns=1MHz
        //直接输出500Hz的segment_clk(周期是2ms)
        Clk=0;
        Reset=0;
        Cs=1;
        Iow=1;
        #5;
        Clk=1;
        Address=0;
        Wdata=16'h1234;
        #5
        Clk=0;
        #5
        Clk=1;
        Address=2;
        Wdata=16'h5678;
        #5
        Clk=0;
        #5;
        Clk=1;
        Address=4;
       Wdata=16'hffff;
        #5;
    end 
endmodule
