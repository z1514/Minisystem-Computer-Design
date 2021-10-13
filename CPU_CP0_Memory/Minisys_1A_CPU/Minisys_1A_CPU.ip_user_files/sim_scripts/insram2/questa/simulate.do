onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib insram2_opt

do {wave.do}

view wave
view structure
view signals

do {insram2.udo}

run -all

quit -force
