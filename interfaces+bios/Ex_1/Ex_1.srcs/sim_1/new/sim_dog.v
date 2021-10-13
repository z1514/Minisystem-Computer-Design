`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/14 10:51:46
// Design Name: 
// Module Name: sim_dog
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


module sim_dog(
    );
    reg Clk;
    reg Reset;
    reg Cs;
    reg Iow;
    reg [2:0] Address;
    wire RESET;
    integer i=0;
    Dog dog(Clk,Reset,Iow,Cs,Address,RESET);
    always
    begin
        Reset=0;
        Cs=1;
        Address=0;
        Clk=0;
        #5;
        Clk=1;
        #5;
       for(i=0;i<1000;i=i+1)
       begin
        Clk=0;
        #5;
        Clk=1;
        #5;
      end 
        
    end
    
endmodule
