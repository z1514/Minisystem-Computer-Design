vlib work
vlib activehdl

vlib activehdl/xil_defaultlib

vmap xil_defaultlib activehdl/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"c:/Users/yuanyuan/Ex_1/Ex_1.srcs/sources_1/ip/S86_0/S86_0_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

