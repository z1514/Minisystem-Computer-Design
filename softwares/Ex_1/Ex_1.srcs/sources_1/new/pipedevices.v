`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/10 16:41:56
// Design Name: 
// Module Name: pipedevices
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


module pipedevices(
input write,input [31:0]addr,input [31:0]data_in,input Clk,input Reset,output [31:0]data_out,
input enable,input Pulse0,input Pulse1,output Count0,output Count1,output Pwm,output [7:0]digital,
output [7:0]ens,input segment_clock,input keyboard_clock,input [3:0]Row,output [3:0]Col,input [15:0]switches,
output [15:0] leds 
    );
   
//   wire write;
//   wire [31:0] addr;
   
//   wire[31:0] data_in;
//   wire Clk;
//   wire Reset;
//   wire Pwm;
//   reg [31:0] data_out;
   reg [7:0] cs_bus;
   
  //数码管相关的信号
      wire cs_seg;
      wire Iow_seg;
      wire [31:0]dataout_seg;
      assign Iow_seg=write;
      assign dataout_seg=0;
      assign cs_seg=enable&cs_bus[0];
      
  //键盘keyboard的信号
     wire cs_keyboard;
     wire Iow_keyboard;
     wire [31:0] dataout_keyboard;
     wire Ior_keyboard;
     assign Iow_keyboard=write;
     assign Ior_keyboard=~write;
     assign dataout_keyboard[31:16]=0;
     assign cs_keyboard=enable&cs_bus[1];
       
   //计时器timer的信号
   wire cs_timer;
   wire Iow_timer;
   assign Iow_timer=write;
   wire Ior_timer;
   assign Ior_timer=~write;
   wire [31:0]dataout_timer;
   assign dataout_timer[31:16]=0;
   assign cs_timer=enable&cs_bus[2];
  
     //Pwm相关的信号
    wire cs_pwm;
    wire Iow_pwm;
    wire [31:0]dataout_pwm;
    assign Iow_pwm=write;
    assign dataout_pwm=0;
    assign cs_pwm=enable&cs_bus[3];
  
  //Dog的相关信号
    wire cs_dog;
    wire dataout_dog;
    wire Iow_dog;
    assign Iow_dog=write;
    assign dataout_dog=0;
    assign cs_dog=enable&cs_bus[5]; 
    
      //LED灯的相关信号
      wire cs_leds;
      wire [15:0]dataout_leds;
      wire [7:0] leds_high;
      wire Ior_leds;
      wire Iow_leds;
      assign Iow_leds=write;
      assign Ior_leds=~write;
      assign dataout_leds=0;
      assign leds_high=0;
      assign cs_leds=enable&cs_bus[6];
      
  //拨码开关相关的信号
  wire cs_switches;
  wire [31:0]dataout_switches;
  wire Ior_switches;
  wire Iow_switches;
  assign Iow_switches=write;
  assign Ior_switches=~write;
  assign dataout_switches[31:16]=0;
  assign cs_switches=enable&cs_bus[7]; 
  
//3-8译码器
always@(addr[6:4] or Reset)
begin 
    if(Reset==1)
    begin
        cs_bus<=0;
    end
    else
    begin
        case(addr[6:4])
        3'd0:begin cs_bus<=8'b0000_0001;data_out<=dataout_seg;end
        3'd1:begin cs_bus<=8'b0000_0010;data_out<=dataout_keyboard;end
        3'd2:begin cs_bus<=8'b0000_0100;data_out<=dataout_timer;end
        3'd4:begin cs_bus<=8'b0000_1000;data_out<=32'b0;end
        3'd5:begin cs_bus<=8'b0001_0000;data_out<=dataout_dog;end
        3'd6:begin cs_bus<=8'b0010_0000;data_out<={8'h00,leds_high,dataout_leds};end
        3'd7:begin cs_bus<=8'b0100_0000;data_out<=dataout_switches;end
        endcase
     end
end

digitron dig(Reset,addr[2:0],cs_seg,Clk,Iow_seg,data_in[15:0],digital,ens,segment_clock);//数码管函数调用
Keypad key(Clk,Reset,Ior_keyboard,cs_keyboard,dataout_keyboard,Row,Col);
//键值寄存器也需要地址，分为键值寄存器和键值状态寄存器
timer tim(Reset,addr[2:0],cs_timer,Clk,Iow_timer,Ior_timer,dataout_timer,data_in[15:0],,Pulse0,Pulse1,Count0,Count1);
PWM pwm(Clk,Reset,addr[2:0],cs_pwm,Iow_pwm,data_in[15:0],dataout_pwm);
Dog dog(Clk,Reset,Iow_dog,cs_dog,data_in[15:0],dataout_dog);
Led led(Reset,addr[2:0],cs_leds,Clk,Iow_leds,data_in[15:0],dataout_leds,leds_high);
Switch switch(Reset,addr[2:0],cs_switches,Clk,Ior_switches,dataout_switches,switches);
   
endmodule
