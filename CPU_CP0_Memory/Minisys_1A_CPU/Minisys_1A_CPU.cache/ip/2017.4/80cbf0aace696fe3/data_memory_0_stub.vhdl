-- Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
-- Date        : Sat Jan 16 02:14:47 2021
-- Host        : DESKTOP-HB7J7JB running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ data_memory_0_stub.vhdl
-- Design      : data_memory_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7a100tfgg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    clock : in STD_LOGIC;
    reset : in STD_LOGIC;
    Address : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Write_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    Mem_write_en_0 : in STD_LOGIC;
    Mem_write_en_1 : in STD_LOGIC;
    Mem_write_en_2 : in STD_LOGIC;
    Mem_write_en_3 : in STD_LOGIC;
    Read_data : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clock,reset,Address[31:0],Write_data[31:0],Mem_write_en_0,Mem_write_en_1,Mem_write_en_2,Mem_write_en_3,Read_data[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "data_memory,Vivado 2017.4";
begin
end;
