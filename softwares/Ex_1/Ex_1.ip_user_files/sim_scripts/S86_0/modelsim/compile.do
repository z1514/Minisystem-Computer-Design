vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 -incr \
"c:/Users/yuanyuan/Ex_1/Ex_1.srcs/sources_1/ip/S86_0/S86_0_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

