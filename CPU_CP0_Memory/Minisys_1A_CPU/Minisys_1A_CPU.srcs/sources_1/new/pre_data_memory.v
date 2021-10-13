`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 18:01:01
// Design Name: 
// Module Name: pre_data_memory
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


module pre_data_memory(
    //input
    Address,
    Write_data_in,
    Mem_write_type_in,
    Mem_write_en_in,
    
    //output
    Write_data_out,
    Mem_write_en_0,
    Mem_write_en_1,
    Mem_write_en_2,
    Mem_write_en_3
    );
    
    //input
    input [31:0] Address,Write_data_in;
    input [1:0] Mem_write_type_in;
    input Mem_write_en_in;
    
    //output
    output reg [31:0] Write_data_out;
    output reg Mem_write_en_0,Mem_write_en_1,Mem_write_en_2,Mem_write_en_3;
    
    reg Mem_write_en_final;
    
    always @(Address or Write_data_in or Mem_write_type_in or Mem_write_en_in) begin
        if(Mem_write_en_in==1) begin
            if(Address[31:10]==22'h3FFFFF) begin
                Mem_write_en_final=0;
            end else begin
                Mem_write_en_final=1;
            end
        end else begin
            Mem_write_en_final=0;
        end
        if(Mem_write_en_final==1'b0) begin
            Mem_write_en_0=1'b0;
            Mem_write_en_1=1'b0;
            Mem_write_en_2=1'b0;
            Mem_write_en_3=1'b0;
        end else begin
            if(Mem_write_type_in==2'b01) begin//write 8 bit
                if(Address[1:0]==2'b00) begin
                    Write_data_out[7:0]=Write_data_in[7:0];
                    Mem_write_en_0=1'b1;
                    Mem_write_en_1=1'b0;
                    Mem_write_en_2=1'b0;
                    Mem_write_en_3=1'b0;
                end else if(Address[1:0]==2'b01) begin
                    Write_data_out[15:8]=Write_data_in[7:0];
                    Mem_write_en_0=1'b0;
                    Mem_write_en_1=1'b1;
                    Mem_write_en_2=1'b0;
                    Mem_write_en_3=1'b0;                    
                end else if(Address[1:0]==2'b10) begin
                    Write_data_out[23:16]=Write_data_in[7:0];
                    Mem_write_en_0=1'b0;
                    Mem_write_en_1=1'b0;
                    Mem_write_en_2=1'b1;
                    Mem_write_en_3=1'b0;                
                end else if(Address[1:0]==2'b11) begin
                    Write_data_out[31:24]=Write_data_in[7:0];
                    Mem_write_en_0=1'b0;
                    Mem_write_en_1=1'b0;
                    Mem_write_en_2=1'b0;
                    Mem_write_en_3=1'b1;                
                end
            end else if(Mem_write_type_in==2'b10) begin //write 16 bit
                if(Address[1:0]==2'b00) begin
                    Write_data_out[15:0]=Write_data_in[15:0];
                    Mem_write_en_0=1'b1;
                    Mem_write_en_1=1'b1;
                    Mem_write_en_2=1'b0;
                    Mem_write_en_3=1'b0; 
                end else if(Address[1:0]==2'b10) begin
                    Write_data_out[31:16]=Write_data_in[15:0];
                    Mem_write_en_0=1'b0;
                    Mem_write_en_1=1'b0;
                    Mem_write_en_2=1'b1;
                    Mem_write_en_3=1'b1; 
                end
            end else if(Mem_write_type_in==2'b11) begin //write 32 bit
                Write_data_out[31:0]=Write_data_in[31:0];
                Mem_write_en_0=1'b1;
                Mem_write_en_1=1'b1;
                Mem_write_en_2=1'b1;
                Mem_write_en_3=1'b1;
            end
        end
    end
endmodule
