onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib insram0_opt

do {wave.do}

view wave
view structure
view signals

do {insram0.udo}

run -all

quit -force
