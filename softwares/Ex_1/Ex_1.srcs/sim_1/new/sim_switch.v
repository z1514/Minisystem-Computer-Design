`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 15:08:41
// Design Name: 
// Module Name: sim_switch
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


module sim_switch(
    );
reg  Reset;
reg [2:0]Address;
reg Cs;
reg Clk;
reg Ior;
wire [15:0]Rdata;
reg [15:0]sw1;
Switch switch(Reset,Address, Cs, Clk ,Ior ,Rdata, sw1);

always begin
Clk=1;
#5;
Reset=0;
Address=0;
Cs=1;
Ior=1;
sw1=16'h2345;
Clk=0;
#5;
sw1=16'h0000;
Clk=1;
#5;
end
endmodule
