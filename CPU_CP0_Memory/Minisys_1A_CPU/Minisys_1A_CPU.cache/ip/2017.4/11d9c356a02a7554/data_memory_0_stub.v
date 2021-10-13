// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Sat Jan 16 05:42:42 2021
// Host        : DESKTOP-HB7J7JB running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ data_memory_0_stub.v
// Design      : data_memory_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "data_memory,Vivado 2017.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clock, reset, Address, Write_data, 
  Mem_write_en_0, Mem_write_en_1, Mem_write_en_2, Mem_write_en_3, Read_data)
/* synthesis syn_black_box black_box_pad_pin="clock,reset,Address[31:0],Write_data[31:0],Mem_write_en_0,Mem_write_en_1,Mem_write_en_2,Mem_write_en_3,Read_data[31:0]" */;
  input clock;
  input reset;
  input [31:0]Address;
  input [31:0]Write_data;
  input Mem_write_en_0;
  input Mem_write_en_1;
  input Mem_write_en_2;
  input Mem_write_en_3;
  output [31:0]Read_data;
endmodule
