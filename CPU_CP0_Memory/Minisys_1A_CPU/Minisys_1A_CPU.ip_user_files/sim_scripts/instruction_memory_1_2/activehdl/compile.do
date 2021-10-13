vlib work
vlib activehdl

vlib activehdl/xil_defaultlib
vlib activehdl/xpm
vlib activehdl/blk_mem_gen_v8_4_1

vmap xil_defaultlib activehdl/xil_defaultlib
vmap xpm activehdl/xpm
vmap blk_mem_gen_v8_4_1 activehdl/blk_mem_gen_v8_4_1

vlog -work xil_defaultlib  -sv2k12 \
"C:/VIVADO2017.4/Vivado/2017.4/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/VIVADO2017.4/Vivado/2017.4/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work blk_mem_gen_v8_4_1  -v2k5 \
"../../../ipstatic/instruction_memory_1_2/sources_1/ip/ram1/simulation/blk_mem_gen_v8_4.v" \

vlog -work xil_defaultlib  -v2k5 \
"../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/ip/ram1/sim/ram1.v" \
"../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/ip/ram2/sim/ram2.v" \
"../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/ip/ram3/sim/ram3.v" \
"../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/ip/ram0/sim/ram0.v" \
"../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sources_1/new/instruction_memory.v" \
"../../../../Minisys_1A_CPU.srcs/sources_1/ip/instruction_memory_1_2/sim/instruction_memory_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

