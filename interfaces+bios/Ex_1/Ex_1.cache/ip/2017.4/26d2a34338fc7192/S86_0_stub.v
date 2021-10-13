// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
// Date        : Tue Dec  3 17:05:45 2019
// Host        : DESKTOP-RLL7IB7 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ S86_0_stub.v
// Design      : S86_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a100tfgg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "S86,Vivado 2017.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(nmi, nmia, wb_ack_i, wb_clk_i, wb_cyc_o, wb_rst_i, 
  wb_stb_o, wb_tga_o, wb_tgc_i, wb_tgc_o, wb_we_o, pc, wb_adr_o, wb_dat_i, wb_dat_o, wb_sel_o)
/* synthesis syn_black_box black_box_pad_pin="nmi,nmia,wb_ack_i,wb_clk_i,wb_cyc_o,wb_rst_i,wb_stb_o,wb_tga_o,wb_tgc_i,wb_tgc_o,wb_we_o,pc[19:0],wb_adr_o[19:1],wb_dat_i[15:0],wb_dat_o[15:0],wb_sel_o[1:0]" */;
  input nmi;
  output nmia;
  input wb_ack_i;
  input wb_clk_i;
  output wb_cyc_o;
  input wb_rst_i;
  output wb_stb_o;
  output wb_tga_o;
  input wb_tgc_i;
  output wb_tgc_o;
  output wb_we_o;
  output [19:0]pc;
  output [19:1]wb_adr_o;
  input [15:0]wb_dat_i;
  output [15:0]wb_dat_o;
  output [1:0]wb_sel_o;
endmodule
