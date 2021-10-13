-makelib ies_lib/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/Xilinx/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Ex_1.srcs/sources_1/ip/pll/pll_clk_wiz.v" \
  "../../../../Ex_1.srcs/sources_1/ip/pll/pll.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

