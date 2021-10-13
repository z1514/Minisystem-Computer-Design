`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/01/11 18:01:22
// Design Name: 
// Module Name: post_data_memory
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


module post_data_memory(
    //input
    Address,
    Read_data_in,
    Mem_read_type_in,
    Mem_read_extend_in,
    
    //output
    Read_data_out
    );
    
    //input
    input [31:0] Address,Read_data_in;
    input [1:0] Mem_read_type_in;
    input Mem_read_extend_in;
    
    //output
    output reg [31:0] Read_data_out;
    
    always @(Address or Read_data_in or Mem_read_type_in or Mem_read_extend_in) begin
        if(Mem_read_type_in==2'b01) begin//read 8 bit
            if(Address[1:0]==2'b00) begin
                Read_data_out[7:0]=Read_data_in[7:0];
                if(Mem_read_extend_in==1'b0) begin//zero extend
                    Read_data_out[31:8]=24'h000000;
                end else begin//sign extend
                    if(Read_data_in[7]==1'b1) begin
                        Read_data_out[31:8]=24'hFFFFFF;
                    end else begin
                        Read_data_out[31:8]=24'h000000;
                    end
                end
            end else if(Address[1:0]==2'b01) begin
                Read_data_out[7:0]=Read_data_in[15:8];
                if(Mem_read_extend_in==1'b0) begin//zero extend
                    Read_data_out[31:8]=24'h000000;
                end else begin//sign extend
                    if(Read_data_in[15]==1'b1) begin
                        Read_data_out[31:8]=24'hFFFFFF;
                    end else begin
                        Read_data_out[31:8]=24'h000000;
                    end
                end
            end else if(Address[1:0]==2'b10) begin
                Read_data_out[7:0]=Read_data_in[23:16];
                if(Mem_read_extend_in==1'b0) begin//zero extend
                    Read_data_out[31:8]=24'h000000;
                end else begin//sign extend
                    if(Read_data_in[23]==1'b1) begin
                        Read_data_out[31:8]=24'hFFFFFF;
                    end else begin
                        Read_data_out[31:8]=24'h000000;
                    end
                end            
            end else if(Address[1:0]==2'b11) begin
                Read_data_out[7:0]=Read_data_in[31:24];
                if(Mem_read_extend_in==1'b0) begin//zero extend
                    Read_data_out[31:8]=24'h000000;
                end else begin//sign extend
                    if(Read_data_in[31]==1'b1) begin
                        Read_data_out[31:8]=24'hFFFFFF;
                    end else begin
                        Read_data_out[31:8]=24'h000000;
                    end
                end            
            end
        end else if(Mem_read_type_in==2'b10) begin//read 16 bit
            if(Address[1:0]==2'b00) begin
                Read_data_out[15:0]=Read_data_in[15:0];
                if(Mem_read_extend_in==1'b0) begin//zero extend
                    Read_data_out[31:16]=16'h0000;
                end else begin//sign extend
                    if(Read_data_in[15]==1'b1) begin
                        Read_data_out[31:16]=16'hFFFF;
                    end else begin
                        Read_data_out[31:16]=16'h0000;
                    end
                end
            end else if(Address[1:0]==2'b10) begin
                Read_data_out[15:0]=Read_data_in[31:16];
                if(Mem_read_extend_in==1'b0) begin//zero extend
                    Read_data_out[31:16]=16'h0000;
                end else begin//sign extend
                    if(Read_data_in[31]==1'b1) begin
                        Read_data_out[31:16]=16'hFFFF;
                    end else begin
                        Read_data_out[31:16]=16'h0000;
                    end
                end
            end        
        end else if(Mem_read_type_in==2'b11) begin//read 32 bit
            Read_data_out=Read_data_in;
        end
    end
endmodule
