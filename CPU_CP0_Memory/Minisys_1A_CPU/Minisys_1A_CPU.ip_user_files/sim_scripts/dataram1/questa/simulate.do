onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib dataram1_opt

do {wave.do}

view wave
view structure
view signals

do {dataram1.udo}

run -all

quit -force
