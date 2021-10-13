`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//module Led(
//    // Wishbone slave interface
//    input         wb_clk_i,
//    input         wb_rst_i,
//    input  [15:0] wb_dat_i,
//    input         wb_adr_i,
//    input         IOW_N,
//    input         CS_N,
//    output reg [23:0] ledout
//    );
//    always @ (posedge wb_clk_i or posedge wb_rst_i) begin
//        if(wb_rst_i) begin
//            ledout <= 0;//rstΪ��λ�ź�
//        end else if ((!CS_N)&(!IOW_N)&(!wb_adr_i)) begin
//            ledout[15:0] <= wb_dat_i;//IOW_n:I/Oд�ź���Ч����ӦLED�Ƶĵ�16λ
//        end else if((!CS_N)&(!IOW_N)&(wb_adr_i)) begin
//            ledout[23:16] <= wb_dat_i[7:0];//��ӦLED�Ƶĸ߰�λ
//        end
//    end

//endmodule


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
        //reg [15:0] leds=0;
    
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