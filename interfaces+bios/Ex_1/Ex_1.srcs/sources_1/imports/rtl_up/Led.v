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
//            ledout <= 0;//rst为复位信号
//        end else if ((!CS_N)&(!IOW_N)&(!wb_adr_i)) begin
//            ledout[15:0] <= wb_dat_i;//IOW_n:I/O写信号有效，对应LED灯的低16位
//        end else if((!CS_N)&(!IOW_N)&(wb_adr_i)) begin
//            ledout[23:16] <= wb_dat_i[7:0];//对应LED灯的高八位
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
    
        always @(posedge Clk or posedge Reset)//控制寄存器的读写
        begin
            if(Reset==1)//reset
                begin
                    leds = 0;
                end
            else if(Cs==1'b1)//片选
                begin
                  if(Iow==1'b1)//写数据
                        begin
                            case(Address[2:0])//写地址判断
                                3'b000: leds = Wdata;//最大值寄存器赋值
                                3'b010: led_high=Wdata[7:0];
                                default:leds = leds;
                            endcase
                        end
                end
        end
    endmodule