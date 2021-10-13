vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib

vmap xil_defaultlib questa_lib/msim/xil_defaultlib

vlog -work xil_defaultlib -64 \
"c:/Users/yuanyuan/Ex_1/Ex_1.srcs/sources_1/ip/S86_0/S86_0_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

