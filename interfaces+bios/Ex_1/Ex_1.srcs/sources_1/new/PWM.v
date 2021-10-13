`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/12/06 20:12:09
// Design Name: 
// Module Name: PWM
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


module PWM(
input Clk,input Reset,input [2:0]Address,input Cs,input Iow,input [15:0]Wdata,output Pwm,
 output reg [15:0] MidValue_reg,output reg [15:0] MaxValue_reg,output reg[15:0] CurValue_reg );
    
reg Pwm;
reg[15:0] Control_reg;//控制寄存器
//reg[15:0] MaxValue_reg;//最大值寄存器
//reg[15:0] MidValue_reg;//对比值寄存器
//reg[15:0] CurValue_reg=0000;//当前计数值的寄存器
wire Enable_pwm;//是否允许PWM输出波形

assign Enable_pwm=Control_reg[0];//控制寄存器的最后一位表示enable信号

always @(posedge Clk or posedge Reset)
begin
    if(Reset==1'b1)//上升沿有效
        begin
            CurValue_reg=16'b0000;
            MaxValue_reg=16'hffff;//最大值寄存器默认为0xffff
            MidValue_reg=16'h7fff;
        end
    else if((Cs==1'b1)&&(Iow==1'b1))
        begin
            case(Address[2:0])
                3'b000: MaxValue_reg[15:0]=Wdata[15:0];
                3'b010: MidValue_reg[15:0]=Wdata[15:0];
                3'b100: Control_reg[15:0]=Wdata[15:0]; 
             endcase   
        end  
   //开始计数
 if((Reset==1'b1)||(Enable_pwm==1'b0))
    begin
        Pwm=1;
        CurValue_reg=16'h0000;
     end
 else if(CurValue_reg<MidValue_reg)
    begin
        Pwm=1;
        CurValue_reg=CurValue_reg+1;
    end
 else if((CurValue_reg>=MidValue_reg)&&(CurValue_reg<MaxValue_reg))    
    begin
        Pwm=0;
        CurValue_reg=CurValue_reg+1;
    end
 else
    begin
        Pwm=1;
        CurValue_reg=0;
    end
end
endmodule
