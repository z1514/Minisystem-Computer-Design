-makelib ies_lib/xil_defaultlib -sv \
  "C:/VIVADO2017.4/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "C:/VIVADO2017.4/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_1 \
  "../../../ipstatic/instruction_memory_1_2/sources_1/ip/ram1/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/ip/ram1/sim/ram1.v" \
  "../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/ip/ram2/sim/ram2.v" \
  "../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/ip/ram3/sim/ram3.v" \
  "../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/ip/ram0/sim/ram0.v" \
  "../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/new/instruction_memory.v" \
  "../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sim/instruction_memory_1.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

