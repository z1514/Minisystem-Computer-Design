`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/15 21:34:49
// Design Name: 
// Module Name: Mem_or_IO
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


module Mem_or_IO(
write,
addr,data_in,Clk,data_out,Reset,
//Pulse0,Pulse1,Count0,Count1,Pwm,
//wea,
//digital,ens,
//segment_clock,keyboard_clock,
//Row,Col,switches,
leds,leds_high
    );
//input keyboard_clock;
//input [3:0]Row;
//output [3:0]Col;
input write;
//input [1:0]smem;
//input [2:0]lmem;
input [31:0]addr;
input [31:0]data_in;
input Clk;
input Reset;
output [31:0]data_out;
//output [7:0]digital;
//output [7:0]ens;
//input segment_clock;
/*input Pulse0;
input Pulse1;
output Count0;
output Count1;
output Pwm;
input [15:0]switches;*/
output [15:0]leds;
output [7:0] leds_high;

//output [3:0]wea;

wire addr_use_device;
wire addr_use_memory;
assign addr_use_device=addr[31:10]==22'h3fffff;
assign addr_use_memory=~addr_use_device;

wire memory_write;
wire device_write;
assign memory_write=write&addr_use_memory;
assign device_write=write&addr_use_device;

wire [31:0] mem_dataout;
//pipemem memory0(memory_write,smem,lmem,addr,data_in,Clk,mem_dataout,wea);

wire [31:0]device_dataout;
wire [15:0]cs_bus;
pipedevices devices(device_write,addr,data_in,Clk,Reset,device_dataout,addr_use_device,
//Pulse0,Pulse1,Count0,Count1,Pwm,digital,ens,Row,Col,
leds,leds_high);

//assign data_out=addr_use_memory?mem_dataout:device_dataout;
assign data_out=device_dataout;
endmodule
