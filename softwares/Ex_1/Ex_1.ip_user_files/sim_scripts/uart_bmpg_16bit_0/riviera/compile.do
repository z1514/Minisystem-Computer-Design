vlib work
vlib riviera

vlib riviera/xil_defaultlib

vmap xil_defaultlib riviera/xil_defaultlib

vlog -work xil_defaultlib  -v2k5 \
"c:/Users/yuanyuan/Ex_1/Ex_1.srcs/sources_1/ip/uart_bmpg_16bit_0/uart_bmpg_16bit_0_sim_netlist.v" \


vlog -work xil_defaultlib \
"glbl.v"

