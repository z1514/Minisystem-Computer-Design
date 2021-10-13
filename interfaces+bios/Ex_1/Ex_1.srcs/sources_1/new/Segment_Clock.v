`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 20:22:15
// Design Name: 
// Module Name: Segment_Clock
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


module Segment_Clock(
input Reset,input Clk,input [31:0]count,output reg Seg_Clk
    );
    reg [31:0]div_counter=0;
   always@(posedge Clk or posedge Reset )
   begin
    if(Reset==1'b1)
    begin
        Seg_Clk<=0;
        div_counter<=0;
    end
    else if(div_counter>=count)
    begin
        Seg_Clk<=~Seg_Clk;
        div_counter<=0;
    end
    else
    begin
        div_counter<=div_counter+1;
    end
  end
                
endmodule
