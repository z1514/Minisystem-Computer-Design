`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/13 21:46:29
// Design Name: 
// Module Name: sim_Pwm
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


module sim_Pwm(
    );
    reg Clk;
    reg Reset;
    reg [2:0]Address;
    reg Cs;
    reg Iow;
    reg [15:0]Wdata;
    wire Pwm;
    wire[15:0] MidValue_reg;
    wire[15:0] MaxValue_reg;
    wire[15:0] CurValue_reg;
    integer i;
    PWM pwm(Clk,Reset,Address,Cs,Iow,Wdata,Pwm,MidValue_reg,MaxValue_reg,CurValue_reg);
    
    always
    begin
        Clk=0;
        Reset=0;
        Cs=1;
        Iow=1;
        #5;
        Clk=1;
        Address=3'b000;//写最大值寄存器
        Wdata=10;
        #5;
        Clk=0;
        #5;
        Clk=1;
        Address=3'b010;//写对比值寄存器
        Wdata=3;
        #5;
        Clk=0;
        #5;
        Clk=1;
        Address=3'b100;
        Wdata=1;
        #5;
        Clk=0;
        #5;
        for(i=0;i<=100;i=i+1)
        begin
            Clk=1;
            #5;
            Clk=0;
            #5;
        end
    end
endmodule
