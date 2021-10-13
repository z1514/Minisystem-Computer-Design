onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib insram1_opt

do {wave.do}

view wave
view structure
view signals

do {insram1.udo}

run -all

quit -force
