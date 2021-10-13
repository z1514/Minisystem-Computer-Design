// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Dec 10 19:40:55 2019
// Host        : DESKTOP-RLL7IB7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               C:/Users/yuanyuan/Ex_1/Ex_1.srcs/sources_1/ip/bios_ram/bios_ram_stub.v
// Design      : bios_ram
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_1,Vivado 2017.4" *)
module bios_ram(clka, ena, wea, addra, dina, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[1:0],addra[15:0],dina[15:0],douta[15:0]" */;
  input clka;
  input ena;
  input [1:0]wea;
  input [15:0]addra;
  input [15:0]dina;
  output [15:0]douta;
endmodule
