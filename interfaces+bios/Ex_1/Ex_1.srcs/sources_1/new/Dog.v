`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/04 21:41:42
// Design Name: 
// Module Name: Dog
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


module Dog(input Clk,
           input Reset,
           input Iow,
           input Cs,
           input[2:0] Address,
           output reg RESET
    );
    
    reg[15:0] count;//16位定时器
  //  reg RESET;//高电平有效
    reg[1:0] count_reset;//输出4个时钟周期的RESET信号
    
    always@(posedge Clk ,posedge Reset)
    begin
        if(Reset==1'b1)
            begin
                RESET=0;
                count=16'h0FFFF;
                count_reset=2'b00;
            end
         else if((Cs==1)&&(Address[2:0]==3'b000))
            begin
                if(Iow==1)
                    begin
                        RESET=0;
                        count=16'hFFFF;
                        count_reset=3'b000;
                    end
                else 
                    begin
                        if(count==16'h0000)
                            begin
                                RESET=1;
                                count=16'h0FFFF;
                                count_reset=2'b00;
                            end
                        else 
                            begin
                                count=count-1;
                           end
                      end
             end
         end
                
endmodule
