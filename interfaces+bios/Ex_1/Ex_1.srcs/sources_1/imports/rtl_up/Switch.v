`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//module Switch(
//    output [15:0] wb_dat_o,
//    input         wb_adr_i,
//    input         IOR_N,
//    input         CS_N,
//    input [23:0]  switch_i 
//    );

//    assign wb_dat_o = (CS_N| IOR_N) ? 0 : ((wb_adr_i) ? {8'h00,switch_i[23:16]} : switch_i[15:0]);

//endmodule


module Switch(
input Reset,
input [2:0] Address,
input Cs,
input Clk, 
input Ior ,
output reg [15:0] Rdata,
input [15:0] sw
);
always @(posedge Clk or negedge Reset) //Ҫ����ʱ�ӱ������� ��������ʱû�п���
    begin
        if(Reset==1)
         begin
            Rdata = 0; 
         end
        else 
            Rdata = sw;
     end
endmodule

