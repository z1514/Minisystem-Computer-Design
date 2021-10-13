-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Tue Dec  3 17:05:45 2019
-- Host        : DESKTOP-RLL7IB7 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ S86_0_stub.vhdl
-- Design      : S86_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    nmi : in STD_LOGIC;
    nmia : out STD_LOGIC;
    wb_ack_i : in STD_LOGIC;
    wb_clk_i : in STD_LOGIC;
    wb_cyc_o : out STD_LOGIC;
    wb_rst_i : in STD_LOGIC;
    wb_stb_o : out STD_LOGIC;
    wb_tga_o : out STD_LOGIC;
    wb_tgc_i : in STD_LOGIC;
    wb_tgc_o : out STD_LOGIC;
    wb_we_o : out STD_LOGIC;
    pc : out STD_LOGIC_VECTOR ( 19 downto 0 );
    wb_adr_o : out STD_LOGIC_VECTOR ( 19 downto 1 );
    wb_dat_i : in STD_LOGIC_VECTOR ( 15 downto 0 );
    wb_dat_o : out STD_LOGIC_VECTOR ( 15 downto 0 );
    wb_sel_o : out STD_LOGIC_VECTOR ( 1 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "nmi,nmia,wb_ack_i,wb_clk_i,wb_cyc_o,wb_rst_i,wb_stb_o,wb_tga_o,wb_tgc_i,wb_tgc_o,wb_we_o,pc[19:0],wb_adr_o[19:1],wb_dat_i[15:0],wb_dat_o[15:0],wb_sel_o[1:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "S86,Vivado 2017.4";
begin
end;
