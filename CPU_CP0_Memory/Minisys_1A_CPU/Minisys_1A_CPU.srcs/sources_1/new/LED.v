`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/15 21:36:03
// Design Name: 
// Module Name: LED
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

    module Led(
        input Reset,
        input [2:0] Address,
        input Cs,
        input Clk,
        input Iow,
        input [15:0] Wdata,
        output reg [15:0] leds,
        output reg[7:0] led_high
        );

    
        always @(posedge Clk or posedge Reset)//���ƼĴ����Ķ�д
        begin
            if(Reset==1)//reset
                begin
                    leds = 0;
                end
            else if(Cs==1'b1)//Ƭѡ
                begin
                    if(Iow==1'b1)//д����
                        begin
                            case(Address[2:0])//д��ַ�ж�
                                3'b000: leds = Wdata;//���ֵ�Ĵ�����ֵ
                                3'b010: led_high=Wdata[7:0];
                                default:leds = leds;
                            endcase
                        end
                end
        end
    endmodule
