
|
Command: %s
53*	vivadotcl2K
7synth_design -top Minisys_1A_CPU -part xc7a100tfgg484-12default:defaultZ4-113h px? 
:
Starting synth_design
149*	vivadotclZ4-321h px? 
?
?The '%s' target of the following IPs are stale, please generate the output products using the generate_target or synth_ip command before running synth_design.
%s160*	vivadotcl2
	Synthesis2default:default2?
?c:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/ip/insram0/insram0.xci
c:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/ip/insram3/insram3.xci
c:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/ip/dataram0/dataram0.xci
c:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/ip/dataram1/dataram1.xci
c:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/ip/dataram2/dataram2.xci
c:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/ip/dataram3/dataram3.xci
2default:defaultZ4-393h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px? 
?
%s*synth2?
xStarting RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:09 . Memory (MB): peak = 407.340 ; gain = 103.316
2default:defaulth px? 
?
synthesizing module '%s'638*oasys2"
Minisys_1A_CPU2default:default2r
\C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Minisys_1A_CPU.v2default:default2
232default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2%
fetch_instruction2default:default2u
_C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/fetch_instruction.v2default:default2
232default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
pc_mux2default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pc_mux.v2default:default2
232default:default8@Z8-638h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
PC_CP02default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pc_mux.v2default:default2
602default:default8@Z8-567h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
pc_mux2default:default2
12default:default2
12default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pc_mux.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
pc_add2default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pc_add.v2default:default2
232default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
pc_add2default:default2
22default:default2
12default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pc_add.v2default:default2
232default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
fetch_instruction2default:default2
32default:default2
12default:default2u
_C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/fetch_instruction.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2&
instruction_memory2default:default2v
`C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/instruction_memory.v2default:default2
232default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
insram02default:default2?
C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/insram0_stub.v2default:default2
62default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
insram02default:default2
42default:default2
12default:default2?
C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/insram0_stub.v2default:default2
62default:default8@Z8-256h px? 
?
Ginstance '%s' of module '%s' requires %s connections, but only %s given350*oasys2
insram02default:default2
insram02default:default2
52default:default2
32default:default2v
`C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/instruction_memory.v2default:default2
332default:default8@Z8-350h px? 
?
synthesizing module '%s'638*oasys2
insram12default:default2?
C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/insram1_stub.v2default:default2
62default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
insram12default:default2
52default:default2
12default:default2?
C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/insram1_stub.v2default:default2
62default:default8@Z8-256h px? 
?
Ginstance '%s' of module '%s' requires %s connections, but only %s given350*oasys2
insram12default:default2
insram12default:default2
52default:default2
32default:default2v
`C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/instruction_memory.v2default:default2
372default:default8@Z8-350h px? 
?
synthesizing module '%s'638*oasys2
insram22default:default2?
C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/insram2_stub.v2default:default2
62default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
insram22default:default2
62default:default2
12default:default2?
C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/insram2_stub.v2default:default2
62default:default8@Z8-256h px? 
?
Ginstance '%s' of module '%s' requires %s connections, but only %s given350*oasys2
insram22default:default2
insram22default:default2
52default:default2
32default:default2v
`C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/instruction_memory.v2default:default2
412default:default8@Z8-350h px? 
?
synthesizing module '%s'638*oasys2
insram32default:default2?
C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/insram3_stub.v2default:default2
62default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
insram32default:default2
72default:default2
12default:default2?
C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/insram3_stub.v2default:default2
62default:default8@Z8-256h px? 
?
Ginstance '%s' of module '%s' requires %s connections, but only %s given350*oasys2
insram32default:default2
insram32default:default2
52default:default2
32default:default2v
`C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/instruction_memory.v2default:default2
452default:default8@Z8-350h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2&
instruction_memory2default:default2
82default:default2
12default:default2v
`C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/instruction_memory.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
if_id2default:default2i
SC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/if_id.v2default:default2
232default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
if_id2default:default2
92default:default2
12default:default2i
SC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/if_id.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2&
decode_instruction2default:default2v
`C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/decode_instruction.v2default:default2
232default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
decode2default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/decode.v2default:default2
232default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
decode2default:default2
102default:default2
12default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/decode.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
extend2default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/extend.v2default:default2
222default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
extend2default:default2
112default:default2
12default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/extend.v2default:default2
222default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
	registers2default:default2m
WC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/registers.v2default:default2
232default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	registers2default:default2
122default:default2
12default:default2m
WC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/registers.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
HILOreg2default:default2k
UC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/HILOreg.v2default:default2
232default:default8@Z8-638h px? 
?
merging register '%s' into '%s'3619*oasys2$
HI_out_reg[31:0]2default:default2 
HI_reg[31:0]2default:default2k
UC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/HILOreg.v2default:default2
592default:default8@Z8-4471h px? 
?
merging register '%s' into '%s'3619*oasys2$
LO_out_reg[31:0]2default:default2 
LO_reg[31:0]2default:default2k
UC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/HILOreg.v2default:default2
602default:default8@Z8-4471h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2

HI_out_reg2default:default2k
UC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/HILOreg.v2default:default2
592default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2

LO_out_reg2default:default2k
UC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/HILOreg.v2default:default2
602default:default8@Z8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
HILOreg2default:default2
132default:default2
12default:default2k
UC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/HILOreg.v2default:default2
232default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2&
decode_instruction2default:default2
142default:default2
12default:default2v
`C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/decode_instruction.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
id_ex2default:default2i
SC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/id_ex.v2default:default2
232default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
id_ex2default:default2
152default:default2
12default:default2i
SC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/id_ex.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2'
execute_instruction2default:default2w
aC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/execute_instruction.v2default:default2
232default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2 
calculate_PC2default:default2p
ZC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/calculate_PC.v2default:default2
232default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2 
calculate_PC2default:default2
162default:default2
12default:default2p
ZC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/calculate_PC.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
ALU2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
222default:default8@Z8-638h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
Temp_reg2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1692default:default8@Z8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
ALU2default:default2
172default:default2
12default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
222default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2'
execute_instruction2default:default2
182default:default2
12default:default2w
aC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/execute_instruction.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
ex_mem2default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ex_mem.v2default:default2
222default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
ex_mem2default:default2
192default:default2
12default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ex_mem.v2default:default2
222default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
	Mem_or_IO2default:default2m
WC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Mem_or_IO.v2default:default2
232default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
pipedevices2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
232default:default8@Z8-638h px? 
?
-case statement is not full and has no default155*oasys2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1142default:default8@Z8-155h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
dataout_seg2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1062default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2$
dataout_keyboard2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1062default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2!
dataout_timer2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1062default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2
dataout_dog2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1062default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2 
dataout_leds2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1062default:default8@Z8-567h px? 
?
8referenced signal '%s' should be on the sensitivity list567*oasys2$
dataout_switches2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1062default:default8@Z8-567h px? 
?
synthesizing module '%s'638*oasys2
Led2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/LED.v2default:default2
222default:default8@Z8-638h px? 
?
?Register %s in module %s is has both Set and reset with same priority. This may cause simulation mismatches. Consider rewriting code 
4193*oasys2 
led_high_reg2default:default2
Led2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/LED.v2default:default2
462default:default8@Z8-5788h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
Led2default:default2
202default:default2
12default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/LED.v2default:default2
222default:default8@Z8-256h px? 
?
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
322default:default2
Wdata2default:default2
162default:default2
Led2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1322default:default8@Z8-689h px? 
?
Pwidth (%s) of port connection '%s' does not match port width (%s) of module '%s'689*oasys2
82default:default2
leds2default:default2
162default:default2
Led2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1322default:default8@Z8-689h px? 
?
Ginstance '%s' of module '%s' requires %s connections, but only %s given350*oasys2
led2default:default2
Led2default:default2
82default:default2
72default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1322default:default8@Z8-350h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2
leds2default:default2
pipedevices2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
282default:default8@Z8-3848h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
pipedevices2default:default2
212default:default2
12default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
232default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
	Mem_or_IO2default:default2
222default:default2
12default:default2m
WC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Mem_or_IO.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2%
access_datamemory2default:default2u
_C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/access_datamemory.v2default:default2
232default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2#
pre_data_memory2default:default2s
]C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pre_data_memory.v2default:default2
232default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2#
pre_data_memory2default:default2
232default:default2
12default:default2s
]C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pre_data_memory.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
data_memory2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/data_memory.v2default:default2
232default:default8@Z8-638h px? 
?
synthesizing module '%s'638*oasys2
dataram02default:default2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/dataram0_stub.v2default:default2
62default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
dataram02default:default2
242default:default2
12default:default2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/dataram0_stub.v2default:default2
62default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
dataram12default:default2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/dataram1_stub.v2default:default2
62default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
dataram12default:default2
252default:default2
12default:default2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/dataram1_stub.v2default:default2
62default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
dataram22default:default2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/dataram2_stub.v2default:default2
62default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
dataram22default:default2
262default:default2
12default:default2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/dataram2_stub.v2default:default2
62default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
dataram32default:default2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/dataram3_stub.v2default:default2
62default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
dataram32default:default2
272default:default2
12default:default2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/realtime/dataram3_stub.v2default:default2
62default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
data_memory2default:default2
282default:default2
12default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/data_memory.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2$
post_data_memory2default:default2t
^C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/post_data_memory.v2default:default2
232default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2$
post_data_memory2default:default2
292default:default2
12default:default2t
^C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/post_data_memory.v2default:default2
232default:default8@Z8-256h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2%
access_datamemory2default:default2
302default:default2
12default:default2u
_C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/access_datamemory.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
CP02default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/CP0.v2default:default2
232default:default8@Z8-638h px? 
?
merging register '%s' into '%s'3619*oasys2*
CP0_regs_reg[14][31:0]2default:default2!
EPC_reg[31:0]2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/CP0.v2default:default2
952default:default8@Z8-4471h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2$
CP0_regs_reg[14]2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/CP0.v2default:default2
952default:default8@Z8-6014h px? 
?
merging register '%s' into '%s'3619*oasys2
	clear_reg2default:default2%
PC_CP0_en_out_reg2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/CP0.v2default:default2
902default:default8@Z8-4471h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
	clear_reg2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/CP0.v2default:default2
902default:default8@Z8-6014h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
CP02default:default2
312default:default2
12default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/CP0.v2default:default2
232default:default8@Z8-256h px? 
?
synthesizing module '%s'638*oasys2
mem_wb2default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/mem_wb.v2default:default2
232default:default8@Z8-638h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2
mem_wb2default:default2
322default:default2
12default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/mem_wb.v2default:default2
232default:default8@Z8-256h px? 
?
0Net %s in module/entity %s does not have driver.3422*oasys2)
External_interrupt_102default:default2"
Minisys_1A_CPU2default:default2r
\C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Minisys_1A_CPU.v2default:default2
3282default:default8@Z8-3848h px? 
?
%done synthesizing module '%s' (%s#%s)256*oasys2"
Minisys_1A_CPU2default:default2
332default:default2
12default:default2r
\C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Minisys_1A_CPU.v2default:default2
232default:default8@Z8-256h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[5]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[4]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[3]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[2]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[1]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[0]2default:default2
12default:defaultZ8-3917h px? 
z
!design %s has unconnected port %s3331*oasys2
mem_wb2default:default2
reset2default:defaultZ8-3331h px? 
{
!design %s has unconnected port %s3331*oasys2
CP02default:default2
	Sel_in[2]2default:defaultZ8-3331h px? 
{
!design %s has unconnected port %s3331*oasys2
CP02default:default2
	Sel_in[1]2default:defaultZ8-3331h px? 
{
!design %s has unconnected port %s3331*oasys2
CP02default:default2
	Sel_in[0]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[31]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[30]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[29]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[28]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[27]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[26]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[25]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[24]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[23]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[22]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[21]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[20]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[19]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[18]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[17]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[16]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[15]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[14]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[13]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[12]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[11]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2
Address[10]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2

Address[9]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2

Address[8]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2

Address[7]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2

Address[6]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2

Address[5]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2

Address[4]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2

Address[3]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2$
post_data_memory2default:default2

Address[2]2default:defaultZ8-3331h px? 

!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
reset2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[31]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[30]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[29]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[28]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[27]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[26]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[25]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[24]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[23]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[22]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[21]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[20]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[19]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[18]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[17]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2
Address[16]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2

Address[1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
data_memory2default:default2

Address[0]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2#
pre_data_memory2default:default2

Address[9]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2#
pre_data_memory2default:default2

Address[8]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2#
pre_data_memory2default:default2

Address[7]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2#
pre_data_memory2default:default2

Address[6]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2#
pre_data_memory2default:default2

Address[5]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2#
pre_data_memory2default:default2

Address[4]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2#
pre_data_memory2default:default2

Address[3]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2#
pre_data_memory2default:default2

Address[2]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[15]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[14]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[13]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[12]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[11]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[10]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[9]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[8]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[7]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[6]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[5]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[4]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[3]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[2]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[1]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
leds[0]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[31]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[30]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[29]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[28]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[27]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[26]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[25]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[24]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[23]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[22]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[21]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[20]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[19]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[18]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[17]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[16]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[15]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[14]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[13]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[12]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[11]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[10]2default:defaultZ8-3331h px? 
?
!design %s has unconnected port %s3331*oasys2
pipedevices2default:default2
addr[9]2default:defaultZ8-3331h px? 
?
?Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-33312default:default2
1002default:defaultZ17-14h px? 
?
%s*synth2?
xFinished RTL Elaboration : Time (s): cpu = 00:00:12 ; elapsed = 00:00:14 . Memory (MB): peak = 501.727 ; gain = 197.703
2default:defaulth px? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
U92default:default2)
External_interrupt[5]2default:default2r
\C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Minisys_1A_CPU.v2default:default2
11102default:default8@Z8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
U92default:default2)
External_interrupt[4]2default:default2r
\C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Minisys_1A_CPU.v2default:default2
11102default:default8@Z8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
U92default:default2)
External_interrupt[3]2default:default2r
\C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Minisys_1A_CPU.v2default:default2
11102default:default8@Z8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
U92default:default2)
External_interrupt[2]2default:default2r
\C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Minisys_1A_CPU.v2default:default2
11102default:default8@Z8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
U92default:default2)
External_interrupt[1]2default:default2r
\C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Minisys_1A_CPU.v2default:default2
11102default:default8@Z8-3295h px? 
?
'tying undriven pin %s:%s to constant 0
3295*oasys2
U92default:default2)
External_interrupt[0]2default:default2r
\C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/Minisys_1A_CPU.v2default:default2
11102default:default8@Z8-3295h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:13 ; elapsed = 00:00:15 . Memory (MB): peak = 501.727 ; gain = 197.703
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
Loading part %s157*device2$
xc7a100tfgg484-12default:defaultZ21-403h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
>

Processing XDC Constraints
244*projectZ1-262h px? 
=
Initializing timing engine
348*projectZ1-569h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp8/insram0_in_context.xdc2default:default2 

U1/insram0	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp8/insram0_in_context.xdc2default:default2 

U1/insram0	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp9/insram1_in_context.xdc2default:default2 

U1/insram1	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp9/insram1_in_context.xdc2default:default2 

U1/insram1	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp10/insram2_in_context.xdc2default:default2 

U1/insram2	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp10/insram2_in_context.xdc2default:default2 

U1/insram2	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp11/insram3_in_context.xdc2default:default2 

U1/insram3	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp11/insram3_in_context.xdc2default:default2 

U1/insram3	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp12/dataram0_in_context.xdc2default:default2$
U7/U1/dataram0	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp12/dataram0_in_context.xdc2default:default2$
U7/U1/dataram0	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp13/dataram1_in_context.xdc2default:default2$
U7/U1/dataram1	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp13/dataram1_in_context.xdc2default:default2$
U7/U1/dataram1	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp14/dataram2_in_context.xdc2default:default2$
U7/U1/dataram2	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp14/dataram2_in_context.xdc2default:default2$
U7/U1/dataram2	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp15/dataram3_in_context.xdc2default:default2$
U7/U1/dataram3	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2?
?C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/.Xil/Vivado-14872-DESKTOP-HB7J7JB/dcp15/dataram3_in_context.xdc2default:default2$
U7/U1/dataram3	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/constrs_1/new/TEST.xdc2default:default8Z20-179h px? 
?
VToo many positional options when parsing '%s', please type '%s -help' for usage info.
165*common2
_4_out2default:default2
	get_ports2default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/constrs_1/new/TEST.xdc2default:default2
662default:default8@Z17-165h px?
?
Finished Parsing XDC File [%s]
178*designutils2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/constrs_1/new/TEST.xdc2default:default8Z20-178h px? 
?
?Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2h
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/constrs_1/new/TEST.xdc2default:default24
 .Xil/Minisys_1A_CPU_propImpl.xdc2default:defaultZ1-236h px? 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px? 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0352default:default2
868.7932default:default2
0.0002default:defaultZ17-268h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
~Finished Constraint Validation : Time (s): cpu = 00:00:36 ; elapsed = 00:00:43 . Memory (MB): peak = 876.051 ; gain = 572.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Loading part: xc7a100tfgg484-1
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Loading Part and Timing Information : Time (s): cpu = 00:00:36 ; elapsed = 00:00:43 . Memory (MB): peak = 876.051 ; gain = 572.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:36 ; elapsed = 00:00:43 . Memory (MB): peak = 876.051 ; gain = 572.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Jmp_out2default:defaultZ8-5546h px? 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Jal_out2default:defaultZ8-5546h px? 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Beq_out2default:defaultZ8-5546h px? 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Bne_out2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Bgtz_out2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Blez_out2default:defaultZ8-5546h px? 
w
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Lui_out2default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Slt_out02default:defaultZ8-5546h px? 
x
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Slt_out02default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2'
Write_read_data_out2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys2
Eret_out2default:default2
322default:default2
252default:defaultZ8-5545h px? 
{
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Read_data_12default:defaultZ8-5546h px? 
{
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Read_data_12default:defaultZ8-5546h px? 
{
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2
Read_data_22default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
LO2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys2
ER2default:default2
322default:default2
252default:defaultZ8-5545h px? 
?
cNot enough pipeline registers after wide multiplier. Recommended levels of pipeline registers is %s4267*oasys2
42default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-5845h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
c
+Unused sequential element %s was removed. 
4326*oasys2
 2default:defaultZ8-6014h px? 
c
+Unused sequential element %s was removed. 
4326*oasys2
 2default:defaultZ8-6014h px? 
c
+Unused sequential element %s was removed. 
4326*oasys2
 2default:defaultZ8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
c
+Unused sequential element %s was removed. 
4326*oasys2
 2default:defaultZ8-6014h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
leds2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
led_high2default:default2
32default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
Mem_write_en_02default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
Mem_write_en_02default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
Mem_write_en_02default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
Mem_write_en_02default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2&
Mem_write_en_final2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
Mem_write_en_12default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
Mem_write_en_22default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
Write_data_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2"
Write_data_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[31]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[30]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[29]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[28]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[27]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[26]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[25]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[24]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[23]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[22]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[21]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[20]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[19]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[18]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[17]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[16]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[15]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[11]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[10]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[9]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[8]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[7]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[6]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[5]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[4]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[3]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[2]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[1]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[0]2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2!
PC_CP0_en_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2$
Access_error_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
RT_data_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[31]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[30]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[29]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[28]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[27]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[26]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[25]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[24]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[23]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[22]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[21]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[20]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[19]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[18]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[17]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[16]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[15]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[11]2default:defaultZ8-5546h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2$
CP0_regs_reg[10]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[9]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[8]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[7]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[6]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[5]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[4]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[3]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[2]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[1]2default:defaultZ8-5546h px? 

8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2#
CP0_regs_reg[0]2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2!
PC_CP0_en_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2$
Access_error_out2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
RT_data_out2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
Interrupt_respond2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
Interrupt_respond2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
Interrupt_respond2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
Interrupt_respond2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
Interrupt_respond2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
CP0_regs2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
CP0_regs2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2
CP0_regs2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
!inferring latch for variable '%s'327*oasys2

PC_out_reg2default:default2j
TC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pc_mux.v2default:default2
642default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2 
data_out_reg2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
1152default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2

cs_bus_reg2default:default2o
YC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pipedevices.v2default:default2
472default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2&
Write_data_out_reg2default:default2s
]C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pre_data_memory.v2default:default2
672default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2&
Mem_write_en_0_reg2default:default2s
]C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pre_data_memory.v2default:default2
602default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2&
Mem_write_en_1_reg2default:default2s
]C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pre_data_memory.v2default:default2
612default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2&
Mem_write_en_2_reg2default:default2s
]C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pre_data_memory.v2default:default2
622default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2&
Mem_write_en_3_reg2default:default2s
]C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/pre_data_memory.v2default:default2
632default:default8@Z8-327h px? 
?
!inferring latch for variable '%s'327*oasys2%
Read_data_out_reg2default:default2t
^C:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/post_data_memory.v2default:default2
452default:default8@Z8-327h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:47 ; elapsed = 00:00:55 . Memory (MB): peak = 876.051 ; gain = 572.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
? 
f
%s
*synth2N
:|      |RTL Partition           |Replication |Instances |
2default:defaulth p
x
? 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
? 
f
%s
*synth2N
:|1     |registers__GB0          |           1|     36427|
2default:defaulth p
x
? 
f
%s
*synth2N
:|2     |registers__GB1          |           1|     11052|
2default:defaulth p
x
? 
f
%s
*synth2N
:|3     |registers__GB2          |           1|     13881|
2default:defaulth p
x
? 
f
%s
*synth2N
:|4     |registers__GB3          |           1|     15988|
2default:defaulth p
x
? 
f
%s
*synth2N
:|5     |registers__GB4          |           1|     19362|
2default:defaulth p
x
? 
f
%s
*synth2N
:|6     |decode_instruction__GC0 |           1|       990|
2default:defaulth p
x
? 
f
%s
*synth2N
:|7     |ALU__GB0                |           1|     18110|
2default:defaulth p
x
? 
f
%s
*synth2N
:|8     |ALU__GB1                |           1|      4969|
2default:defaulth p
x
? 
f
%s
*synth2N
:|9     |calculate_PC            |           1|       169|
2default:defaulth p
x
? 
f
%s
*synth2N
:|10    |Minisys_1A_CPU__GC0     |           1|     14891|
2default:defaulth p
x
? 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     64 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     33 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     32 Bit       Adders := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit         XORs := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 28    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               20 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               18 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 11    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 8     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 73    
2default:defaulth p
x
? 
?
%s
*synth2'
+---Multipliers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                31x31  Multipliers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 1062  
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     32 Bit        Muxes := 74    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  20 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     24 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      6 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   9 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 20    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      5 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      5 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 88    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 40    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  13 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   6 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  20 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
? 
>
%s
*synth2&
Module registers 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 901   
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     32 Bit        Muxes := 64    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
;
%s
*synth2#
Module decode 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 11    
2default:defaulth p
x
? 
;
%s
*synth2#
Module extend 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 3     
2default:defaulth p
x
? 
<
%s
*synth2$
Module HILOreg 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
A
%s
*synth2)
Module calculate_PC 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
Module ALU 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     64 Bit       Adders := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     33 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     32 Bit       Adders := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
+---XORs : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit         XORs := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit         XORs := 2     
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               18 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 3     
2default:defaulth p
x
? 
?
%s
*synth2'
+---Multipliers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                31x31  Multipliers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 13    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     32 Bit        Muxes := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 18    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  13 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   5 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
;
%s
*synth2#
Module pc_mux 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
;
%s
*synth2#
Module pc_add 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit       Adders := 1     
2default:defaulth p
x
? 
:
%s
*synth2"
Module if_id 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 2     
2default:defaulth p
x
? 
:
%s
*synth2"
Module id_ex 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 6     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               20 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 5     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 28    
2default:defaulth p
x
? 
;
%s
*synth2#
Module ex_mem 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               20 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 32    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 13    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 12    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      5 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
Module Led 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               16 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
@
%s
*synth2(
Module pipedevices 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   8 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
D
%s
*synth2,
Module pre_data_memory 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 30    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
E
%s
*synth2-
Module post_data_memory 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     24 Bit        Muxes := 4     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     16 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   6 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
? 
8
%s
*synth2 
Module CP0 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 125   
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  20 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      6 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   9 Input      6 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      5 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      5 Bit        Muxes := 7     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      4 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      4 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      3 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      3 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   4 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 20    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	  20 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   3 Input      1 Bit        Muxes := 29    
2default:defaulth p
x
? 
;
%s
*synth2#
Module mem_wb 
2default:defaulth p
x
? 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
? 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	               32 Bit    Registers := 10    
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                5 Bit    Registers := 3     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                4 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
? 
Z
%s
*synth2B
.	                1 Bit    Registers := 13    
2default:defaulth p
x
? 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
? 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 3     
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
HMultithreading enabled for synth_design using a maximum of %s processes.4031*oasys2
22default:defaultZ8-5580h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys2
U0/Eret_out2default:default2
322default:default2
252default:defaultZ8-5545h px? 
d
+Unused sequential element %s was removed. 
4326*oasys2
B2default:defaultZ8-6014h px? 
d
+Unused sequential element %s was removed. 
4326*oasys2
A2default:defaultZ8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
q
%s
*synth2Y
EDSP Report: Generating DSP multu_result, operation Mode is: C+A2*B2.
2default:defaulth p
x
? 
f
%s
*synth2N
:DSP Report: register B is absorbed into DSP multu_result.
2default:defaulth p
x
? 
f
%s
*synth2N
:DSP Report: register A is absorbed into DSP multu_result.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator multu_result is absorbed into DSP multu_result.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator multu_result is absorbed into DSP multu_result.
2default:defaulth p
x
? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[5]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[4]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[3]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[2]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[1]2default:default2
12default:defaultZ8-3917h px? 
?
+design %s has port %s driven by constant %s3447*oasys2"
Minisys_1A_CPU2default:default20
External_interrupt_10_out[0]2default:default2
12default:defaultZ8-3917h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[0]2default:default2
FD_12default:default2)
U3i_5/Imme_out_reg[6]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[1]2default:default2
FD_12default:default2)
U3i_5/Imme_out_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[2]2default:default2
FD_12default:default2)
U3i_5/Imme_out_reg[8]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[3]2default:default2
FD_12default:default2)
U3i_5/Imme_out_reg[9]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[4]2default:default2
FD_12default:default2*
U3i_5/Imme_out_reg[10]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[5]2default:default2
FD_12default:default2/
U3i_5/RD_address_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[6]2default:default2
FD_12default:default2/
U3i_5/RD_address_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[7]2default:default2
FD_12default:default2/
U3i_5/RD_address_out_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[8]2default:default2
FD_12default:default2/
U3i_5/RD_address_out_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Code_out_reg[9]2default:default2
FD_12default:default2/
U3i_5/RD_address_out_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
U3i_5/Code_out_reg[10]2default:default2
FD_12default:default2/
U3i_5/RT_address_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
U3i_5/Code_out_reg[11]2default:default2
FD_12default:default2/
U3i_5/RT_address_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
U3i_5/Code_out_reg[12]2default:default2
FD_12default:default2/
U3i_5/RT_address_out_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
U3i_5/Code_out_reg[13]2default:default2
FD_12default:default2/
U3i_5/RT_address_out_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
U3i_5/Code_out_reg[14]2default:default2
FD_12default:default2/
U3i_5/RT_address_out_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2(
U3i_5/Sel_out_reg[0]2default:default2
FD_12default:default2)
U3i_5/Imme_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2(
U3i_5/Sel_out_reg[1]2default:default2
FD_12default:default2)
U3i_5/Imme_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2(
U3i_5/Sel_out_reg[2]2default:default2
FD_12default:default2)
U3i_5/Imme_out_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U3i_5/RD_address_out_reg[0]2default:default2
FD_12default:default2*
U3i_5/Imme_out_reg[11]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U3i_5/RD_address_out_reg[1]2default:default2
FD_12default:default2*
U3i_5/Imme_out_reg[12]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U3i_5/RD_address_out_reg[2]2default:default2
FD_12default:default2*
U3i_5/Imme_out_reg[13]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U3i_5/RD_address_out_reg[3]2default:default2
FD_12default:default2*
U3i_5/Imme_out_reg[14]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U3i_5/RD_address_out_reg[4]2default:default2
FD_12default:default2*
U3i_5/Imme_out_reg[15]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Imme_out_reg[6]2default:default2
FD_12default:default2*
U3i_5/Shamt_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Imme_out_reg[7]2default:default2
FD_12default:default2*
U3i_5/Shamt_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Imme_out_reg[8]2default:default2
FD_12default:default2*
U3i_5/Shamt_out_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
U3i_5/Imme_out_reg[9]2default:default2
FD_12default:default2*
U3i_5/Shamt_out_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
U3i_5/Imme_out_reg[10]2default:default2
FD_12default:default2*
U3i_5/Shamt_out_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys21
U3i_5/U1/Extended_out_reg[28]2default:default2
FD_12default:default21
U3i_5/U1/Extended_out_reg[29]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys21
U3i_5/U1/Extended_out_reg[29]2default:default2
FD_12default:default21
U3i_5/U1/Extended_out_reg[30]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys21
U3i_5/U1/Extended_out_reg[30]2default:default2
FD_12default:default21
U3i_5/U1/Extended_out_reg[31]2default:defaultZ8-3886h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
B2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
A2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys2
ER2default:default2
322default:default2
252default:defaultZ8-5545h px? 
?
cNot enough pipeline registers after wide multiplier. Recommended levels of pipeline registers is %s4267*oasys2
42default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1122default:default8@Z8-5845h px? 
d
+Unused sequential element %s was removed. 
4326*oasys2
B2default:defaultZ8-6014h px? 
d
+Unused sequential element %s was removed. 
4326*oasys2
B2default:defaultZ8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
A2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
A2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
?
+Unused sequential element %s was removed. 
4326*oasys2
 2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/ALU.v2default:default2
1142default:default8@Z8-6014h px? 
o
%s
*synth2W
CDSP Report: Generating DSP multu_result, operation Mode is: A2*B2.
2default:defaulth p
x
? 
f
%s
*synth2N
:DSP Report: register B is absorbed into DSP multu_result.
2default:defaulth p
x
? 
f
%s
*synth2N
:DSP Report: register A is absorbed into DSP multu_result.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator multu_result is absorbed into DSP multu_result.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator multu_result is absorbed into DSP multu_result.
2default:defaulth p
x
? 
o
%s
*synth2W
CDSP Report: Generating DSP multu_result, operation Mode is: A2*B2.
2default:defaulth p
x
? 
f
%s
*synth2N
:DSP Report: register B is absorbed into DSP multu_result.
2default:defaulth p
x
? 
f
%s
*synth2N
:DSP Report: register A is absorbed into DSP multu_result.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator multu_result is absorbed into DSP multu_result.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator multu_result is absorbed into DSP multu_result.
2default:defaulth p
x
? 
z
%s
*synth2b
NDSP Report: Generating DSP multu_result, operation Mode is: (PCIN>>17)+A2*B2.
2default:defaulth p
x
? 
f
%s
*synth2N
:DSP Report: register B is absorbed into DSP multu_result.
2default:defaulth p
x
? 
f
%s
*synth2N
:DSP Report: register A is absorbed into DSP multu_result.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator multu_result is absorbed into DSP multu_result.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator multu_result is absorbed into DSP multu_result.
2default:defaulth p
x
? 
m
%s
*synth2U
ADSP Report: Generating DSP mult_result0, operation Mode is: A*B.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator mult_result0 is absorbed into DSP mult_result0.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator mult_result0 is absorbed into DSP mult_result0.
2default:defaulth p
x
? 
x
%s
*synth2`
LDSP Report: Generating DSP mult_result0, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator mult_result0 is absorbed into DSP mult_result0.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator mult_result0 is absorbed into DSP mult_result0.
2default:defaulth p
x
? 
m
%s
*synth2U
ADSP Report: Generating DSP mult_result0, operation Mode is: A*B.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator mult_result0 is absorbed into DSP mult_result0.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator mult_result0 is absorbed into DSP mult_result0.
2default:defaulth p
x
? 
x
%s
*synth2`
LDSP Report: Generating DSP mult_result0, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator mult_result0 is absorbed into DSP mult_result0.
2default:defaulth p
x
? 
q
%s
*synth2Y
EDSP Report: operator mult_result0 is absorbed into DSP mult_result0.
2default:defaulth p
x
? 
?
+Unused sequential element %s was removed. 
4326*oasys2,
devices/led/led_high_reg2default:default2g
QC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.srcs/sources_1/new/LED.v2default:default2
462default:default8@Z8-6014h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
U0/Write_data_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
U0/Write_data_out2default:default2
22default:default2
52default:defaultZ8-5544h px? 
?
8ROM "%s" won't be mapped to RAM because it is too sparse3998*oasys2)
U0/Mem_write_en_final2default:defaultZ8-5546h px? 
?
[ROM "%s" won't be mapped to Block RAM because address size (%s) smaller than threshold (%s)3996*oasys2%
Interrupt_respond2default:default2
12default:default2
52default:defaultZ8-5544h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default21
U9/\Interrupt_respond_reg[0] 2default:defaultZ8-3333h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default21
U9/\Interrupt_respond_reg[1] 2default:defaultZ8-3333h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default21
U9/\Interrupt_respond_reg[2] 2default:defaultZ8-3333h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default21
U9/\Interrupt_respond_reg[3] 2default:defaultZ8-3333h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default21
U9/\Interrupt_respond_reg[4] 2default:defaultZ8-3333h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default21
U9/\Interrupt_respond_reg[5] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/led/leds_reg[15]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/led/leds_reg[14]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/led/leds_reg[13]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/led/leds_reg[12]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/led/leds_reg[11]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/led/leds_reg[10]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U10/devices/led/leds_reg[9]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U10/devices/led/leds_reg[8]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U10/devices/led/leds_reg[0]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U10/devices/led/leds_reg[1]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U10/devices/led/leds_reg[2]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U10/devices/led/leds_reg[3]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U10/devices/led/leds_reg[4]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U10/devices/led/leds_reg[5]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[7]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2/
U10/devices/led/leds_reg[6]2default:default2
FDCE2default:default2/
U10/devices/led/leds_reg[7]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default21
\U10/devices/led/leds_reg[7] 2default:defaultZ8-3333h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[16]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[17]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[18]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[19]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[20]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[21]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[22]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[23]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[24]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[25]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[26]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[27]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[28]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[29]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
U10/devices/data_out_reg[30]2default:default2
LD2default:default20
U10/devices/data_out_reg[31]2default:defaultZ8-3886h px? 
?
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default22
\U10/devices/data_out_reg[31] 2default:defaultZ8-3333h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
Interrupt_respond_reg[5]2default:default2
CP02default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
Interrupt_respond_reg[4]2default:default2
CP02default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
Interrupt_respond_reg[3]2default:default2
CP02default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
Interrupt_respond_reg[2]2default:default2
CP02default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
Interrupt_respond_reg[1]2default:default2
CP02default:defaultZ8-3332h px? 
?
ESequential element (%s) is unused and will be removed from module %s.3332*oasys2,
Interrupt_respond_reg[0]2default:default2
CP02default:defaultZ8-3332h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:01:30 ; elapsed = 00:02:31 . Memory (MB): peak = 876.051 ; gain = 572.027
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Start ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
_
%s*synth2G
3
DSP: Preliminary Mapping  Report (see note below)
2default:defaulth px? 
?
%s*synth2?
?+---------------+------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px? 
?
%s*synth2?
?|Module Name    | DSP Mapping      | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth px? 
?
%s*synth2?
?+---------------+------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px? 
?
%s*synth2?
?|Minisys_1A_CPU | C+A2*B2          | 16     | 16     | 30     | -      | 30     | 1    | 1    | 0    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
?|ALU__GB0       | A2*B2            | 18     | 16     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
?|ALU__GB0       | A2*B2            | 18     | 18     | -      | -      | 48     | 1    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
?|ALU__GB0       | (PCIN>>17)+A2*B2 | 18     | 16     | -      | -      | 47     | 1    | 1    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
?|ALU__GB0       | A*B              | 18     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
?|ALU__GB0       | (PCIN>>17)+A*B   | 15     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
?|ALU__GB0       | A*B              | 18     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
?|ALU__GB0       | (PCIN>>17)+A*B   | 18     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px? 
?
%s*synth2?
?+---------------+------------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth px? 
?
%s*synth2?
?Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
2default:defaulth px? 
?
%s*synth2?
?---------------------------------------------------------------------------------
Finished ROM, RAM, DSP and Shift Register Reporting
2default:defaulth px? 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
? 
f
%s
*synth2N
:|      |RTL Partition           |Replication |Instances |
2default:defaulth p
x
? 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
? 
f
%s
*synth2N
:|1     |registers__GB0          |           1|     16965|
2default:defaulth p
x
? 
f
%s
*synth2N
:|2     |registers__GB1          |           1|      1861|
2default:defaulth p
x
? 
f
%s
*synth2N
:|3     |registers__GB2          |           1|      3265|
2default:defaulth p
x
? 
f
%s
*synth2N
:|4     |registers__GB3          |           1|      5289|
2default:defaulth p
x
? 
f
%s
*synth2N
:|5     |registers__GB4          |           1|      6568|
2default:defaulth p
x
? 
f
%s
*synth2N
:|6     |decode_instruction__GC0 |           1|       525|
2default:defaulth p
x
? 
f
%s
*synth2N
:|7     |ALU__GB0                |           1|     10969|
2default:defaulth p
x
? 
f
%s
*synth2N
:|8     |ALU__GB1                |           1|      2956|
2default:defaulth p
x
? 
f
%s
*synth2N
:|9     |calculate_PC            |           1|       141|
2default:defaulth p
x
? 
f
%s
*synth2N
:|10    |Minisys_1A_CPU__GC0     |           1|      5766|
2default:defaulth p
x
? 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:52 ; elapsed = 00:02:53 . Memory (MB): peak = 1027.672 ; gain = 723.648
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[0]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[1]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[2]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[3]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[4]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[5]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[11]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[6]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[12]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[7]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[13]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[8]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[14]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Code_out_reg[9]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[15]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
i_8/U4/Code_out_reg[10]2default:default2
FDE2default:default20
i_8/U4/RT_address_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
i_8/U4/Code_out_reg[11]2default:default2
FDE2default:default20
i_8/U4/RT_address_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
i_8/U4/Code_out_reg[12]2default:default2
FDE2default:default20
i_8/U4/RT_address_out_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
i_8/U4/Code_out_reg[13]2default:default2
FDE2default:default20
i_8/U4/RT_address_out_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
i_8/U4/Code_out_reg[14]2default:default2
FDE2default:default20
i_8/U4/RT_address_out_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
i_8/U4/Sel_out_reg[0]2default:default2
FDE2default:default2*
i_8/U4/Imme_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
i_8/U4/Sel_out_reg[1]2default:default2
FDE2default:default2*
i_8/U4/Imme_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2)
i_8/U4/Sel_out_reg[2]2default:default2
FDE2default:default2*
i_8/U4/Imme_out_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
i_8/U4/RD_address_out_reg[0]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[11]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
i_8/U4/RD_address_out_reg[1]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[12]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
i_8/U4/RD_address_out_reg[2]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[13]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
i_8/U4/RD_address_out_reg[3]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[14]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys20
i_8/U4/RD_address_out_reg[4]2default:default2
FDE2default:default2+
i_8/U4/Imme_out_reg[15]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Imme_out_reg[6]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Imme_out_reg[7]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Imme_out_reg[8]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U4/Imme_out_reg[9]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
i_8/U4/Imme_out_reg[10]2default:default2
FDE2default:default2+
i_8/U4/Shamt_out_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys22
i_8/U4/Extend_imme_out_reg[28]2default:default2
FDE2default:default22
i_8/U4/Extend_imme_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys22
i_8/U4/Extend_imme_out_reg[29]2default:default2
FDE2default:default22
i_8/U4/Extend_imme_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys22
i_8/U4/Extend_imme_out_reg[30]2default:default2
FDE2default:default22
i_8/U4/Extend_imme_out_reg[31]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U6/Code_out_reg[5]2default:default2
FD2default:default20
i_8/U6/RD_address_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U6/Code_out_reg[6]2default:default2
FD2default:default20
i_8/U6/RD_address_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U6/Code_out_reg[7]2default:default2
FD2default:default20
i_8/U6/RD_address_out_reg[2]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U6/Code_out_reg[8]2default:default2
FD2default:default20
i_8/U6/RD_address_out_reg[3]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2*
i_8/U6/Code_out_reg[9]2default:default2
FD2default:default20
i_8/U6/RD_address_out_reg[4]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
i_8/U6/Code_out_reg[10]2default:default2
FD2default:default20
i_8/U6/RT_address_out_reg[0]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
i_8/U6/Code_out_reg[11]2default:default2
FD2default:default20
i_8/U6/RT_address_out_reg[1]2default:defaultZ8-3886h px? 
?
"merging instance '%s' (%s) to '%s'3436*oasys2+
i_8/U6/Code_out_reg[12]2default:default2
FD2default:default20
i_8/U6/RT_address_out_reg[2]2default:defaultZ8-3886h px? 
?
?Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2 
Synth 8-38862default:default2
1002default:defaultZ17-14h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
}Finished Timing Optimization : Time (s): cpu = 00:01:54 ; elapsed = 00:02:56 . Memory (MB): peak = 1032.770 ; gain = 728.746
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
? 
f
%s
*synth2N
:|      |RTL Partition           |Replication |Instances |
2default:defaulth p
x
? 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
? 
f
%s
*synth2N
:|1     |registers__GB0          |           1|     16965|
2default:defaulth p
x
? 
f
%s
*synth2N
:|2     |registers__GB1          |           1|      1861|
2default:defaulth p
x
? 
f
%s
*synth2N
:|3     |registers__GB2          |           1|      3248|
2default:defaulth p
x
? 
f
%s
*synth2N
:|4     |registers__GB3          |           1|      5281|
2default:defaulth p
x
? 
f
%s
*synth2N
:|5     |registers__GB4          |           1|      6568|
2default:defaulth p
x
? 
f
%s
*synth2N
:|6     |decode_instruction__GC0 |           1|       525|
2default:defaulth p
x
? 
f
%s
*synth2N
:|7     |ALU__GB0                |           1|     10967|
2default:defaulth p
x
? 
f
%s
*synth2N
:|8     |ALU__GB1                |           1|      2956|
2default:defaulth p
x
? 
f
%s
*synth2N
:|9     |calculate_PC            |           1|       141|
2default:defaulth p
x
? 
f
%s
*synth2N
:|10    |Minisys_1A_CPU__GC0     |           1|      5725|
2default:defaulth p
x
? 
f
%s
*synth2N
:+------+------------------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
|Finished Technology Mapping : Time (s): cpu = 00:02:10 ; elapsed = 00:03:30 . Memory (MB): peak = 1086.480 ; gain = 782.457
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
]
%s
*synth2E
1+------+---------------+------------+----------+
2default:defaulth p
x
? 
]
%s
*synth2E
1|      |RTL Partition  |Replication |Instances |
2default:defaulth p
x
? 
]
%s
*synth2E
1+------+---------------+------------+----------+
2default:defaulth p
x
? 
]
%s
*synth2E
1|1     |registers__GB0 |           1|      5353|
2default:defaulth p
x
? 
]
%s
*synth2E
1|2     |ALU__GB0       |           1|      5829|
2default:defaulth p
x
? 
]
%s
*synth2E
1+------+---------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram0 2default:default2
wea[0]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram0 2default:default2
dina[7]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram0 2default:default2
dina[6]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram0 2default:default2
dina[5]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram0 2default:default2
dina[4]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram0 2default:default2
dina[3]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram0 2default:default2
dina[2]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram0 2default:default2
dina[1]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram0 2default:default2
dina[0]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram1 2default:default2
wea[0]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram1 2default:default2
dina[7]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram1 2default:default2
dina[6]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram1 2default:default2
dina[5]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram1 2default:default2
dina[4]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram1 2default:default2
dina[3]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram1 2default:default2
dina[2]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram1 2default:default2
dina[1]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram1 2default:default2
dina[0]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram2 2default:default2
wea[0]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram2 2default:default2
dina[7]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram2 2default:default2
dina[6]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram2 2default:default2
dina[5]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram2 2default:default2
dina[4]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram2 2default:default2
dina[3]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram2 2default:default2
dina[2]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram2 2default:default2
dina[1]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram2 2default:default2
dina[0]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram3 2default:default2
wea[0]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram3 2default:default2
dina[7]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram3 2default:default2
dina[6]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram3 2default:default2
dina[5]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram3 2default:default2
dina[4]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram3 2default:default2
dina[3]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram3 2default:default2
dina[2]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram3 2default:default2
dina[1]2default:defaultZ8-4442h px? 
?
*BlackBox module %s has unconnected pin %s
3599*oasys2 
\U1/insram3 2default:default2
dina[0]2default:defaultZ8-4442h px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
vFinished IO Insertion : Time (s): cpu = 00:02:17 ; elapsed = 00:03:37 . Memory (MB): peak = 1086.480 ; gain = 782.457
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
? 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Instances : Time (s): cpu = 00:02:17 ; elapsed = 00:03:38 . Memory (MB): peak = 1086.480 ; gain = 782.457
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Rebuilding User Hierarchy : Time (s): cpu = 00:02:19 ; elapsed = 00:03:39 . Memory (MB): peak = 1086.480 ; gain = 782.457
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Ports : Time (s): cpu = 00:02:19 ; elapsed = 00:03:39 . Memory (MB): peak = 1086.480 ; gain = 782.457
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Handling Custom Attributes : Time (s): cpu = 00:02:20 ; elapsed = 00:03:41 . Memory (MB): peak = 1086.480 ; gain = 782.457
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Renaming Generated Nets : Time (s): cpu = 00:02:21 ; elapsed = 00:03:41 . Memory (MB): peak = 1086.480 ; gain = 782.457
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|      |BlackBox name |Instances |
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
O
%s
*synth27
#|1     |insram0       |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#|2     |insram1       |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#|3     |insram2       |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#|4     |insram3       |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#|5     |dataram0      |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#|6     |dataram1      |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#|7     |dataram2      |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#|8     |dataram3      |         1|
2default:defaulth p
x
? 
O
%s
*synth27
#+------+--------------+----------+
2default:defaulth p
x
? 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px? 
G
%s*synth2/
+------+----------+------+
2default:defaulth px? 
G
%s*synth2/
|      |Cell      |Count |
2default:defaulth px? 
G
%s*synth2/
+------+----------+------+
2default:defaulth px? 
G
%s*synth2/
|1     |dataram0  |     1|
2default:defaulth px? 
G
%s*synth2/
|2     |dataram1  |     1|
2default:defaulth px? 
G
%s*synth2/
|3     |dataram2  |     1|
2default:defaulth px? 
G
%s*synth2/
|4     |dataram3  |     1|
2default:defaulth px? 
G
%s*synth2/
|5     |insram0   |     1|
2default:defaulth px? 
G
%s*synth2/
|6     |insram1   |     1|
2default:defaulth px? 
G
%s*synth2/
|7     |insram2   |     1|
2default:defaulth px? 
G
%s*synth2/
|8     |insram3   |     1|
2default:defaulth px? 
G
%s*synth2/
|9     |BUFG      |     2|
2default:defaulth px? 
G
%s*synth2/
|10    |CARRY4    |  1238|
2default:defaulth px? 
G
%s*synth2/
|11    |DSP48E1   |     3|
2default:defaulth px? 
G
%s*synth2/
|12    |DSP48E1_1 |     4|
2default:defaulth px? 
G
%s*synth2/
|13    |DSP48E1_2 |     1|
2default:defaulth px? 
G
%s*synth2/
|14    |LUT1      |   499|
2default:defaulth px? 
G
%s*synth2/
|15    |LUT2      |   683|
2default:defaulth px? 
G
%s*synth2/
|16    |LUT3      |  4249|
2default:defaulth px? 
G
%s*synth2/
|17    |LUT4      |  1067|
2default:defaulth px? 
G
%s*synth2/
|18    |LUT5      |  2552|
2default:defaulth px? 
G
%s*synth2/
|19    |LUT6      |  6487|
2default:defaulth px? 
G
%s*synth2/
|20    |MUXF7     |   351|
2default:defaulth px? 
G
%s*synth2/
|21    |MUXF8     |    14|
2default:defaulth px? 
G
%s*synth2/
|22    |FDRE      |  3693|
2default:defaulth px? 
G
%s*synth2/
|23    |FDSE      |    10|
2default:defaulth px? 
G
%s*synth2/
|24    |LD        |    96|
2default:defaulth px? 
G
%s*synth2/
|25    |LDC       |     4|
2default:defaulth px? 
G
%s*synth2/
|26    |IBUF      |     2|
2default:defaulth px? 
G
%s*synth2/
|27    |OBUF      |  1865|
2default:defaulth px? 
G
%s*synth2/
|28    |OBUFT     |    16|
2default:defaulth px? 
G
%s*synth2/
+------+----------+------+
2default:defaulth px? 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
? 
[
%s
*synth2C
/+------+---------+--------------------+------+
2default:defaulth p
x
? 
[
%s
*synth2C
/|      |Instance |Module              |Cells |
2default:defaulth p
x
? 
[
%s
*synth2C
/+------+---------+--------------------+------+
2default:defaulth p
x
? 
[
%s
*synth2C
/|1     |top      |                    | 22900|
2default:defaulth p
x
? 
[
%s
*synth2C
/|2     |  U0     |fetch_instruction   |    73|
2default:defaulth p
x
? 
[
%s
*synth2C
/|3     |    U0   |pc_mux              |    32|
2default:defaulth p
x
? 
[
%s
*synth2C
/|4     |    U1   |pc_add              |    41|
2default:defaulth p
x
? 
[
%s
*synth2C
/|5     |  U1     |instruction_memory  |    32|
2default:defaulth p
x
? 
[
%s
*synth2C
/|6     |  U2     |if_id               |   448|
2default:defaulth p
x
? 
[
%s
*synth2C
/|7     |  U3     |decode_instruction  |  1215|
2default:defaulth p
x
? 
[
%s
*synth2C
/|8     |    U1   |extend              |    29|
2default:defaulth p
x
? 
[
%s
*synth2C
/|9     |    U2   |registers           |  1101|
2default:defaulth p
x
? 
[
%s
*synth2C
/|10    |    U3   |HILOreg             |    64|
2default:defaulth p
x
? 
[
%s
*synth2C
/|11    |  U4     |id_ex               |   893|
2default:defaulth p
x
? 
[
%s
*synth2C
/|12    |  U5     |execute_instruction |   366|
2default:defaulth p
x
? 
[
%s
*synth2C
/|13    |    U0   |calculate_PC        |    71|
2default:defaulth p
x
? 
[
%s
*synth2C
/|14    |    U1   |ALU                 |   295|
2default:defaulth p
x
? 
[
%s
*synth2C
/|15    |  U6     |ex_mem              |   910|
2default:defaulth p
x
? 
[
%s
*synth2C
/|16    |  U7     |access_datamemory   |   132|
2default:defaulth p
x
? 
[
%s
*synth2C
/|17    |    U0   |pre_data_memory     |    36|
2default:defaulth p
x
? 
[
%s
*synth2C
/|18    |    U1   |data_memory         |    48|
2default:defaulth p
x
? 
[
%s
*synth2C
/|19    |    U2   |post_data_memory    |    48|
2default:defaulth p
x
? 
[
%s
*synth2C
/|20    |  U8     |mem_wb              | 15268|
2default:defaulth p
x
? 
[
%s
*synth2C
/|21    |  U9     |CP0                 |  1559|
2default:defaulth p
x
? 
[
%s
*synth2C
/+------+---------+--------------------+------+
2default:defaulth p
x
? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
?
%s*synth2?
?Finished Writing Synthesis Report : Time (s): cpu = 00:02:21 ; elapsed = 00:03:41 . Memory (MB): peak = 1086.480 ; gain = 782.457
2default:defaulth px? 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
? 
u
%s
*synth2]
ISynthesis finished with 0 errors, 36 critical warnings and 119 warnings.
2default:defaulth p
x
? 
?
%s
*synth2?
Synthesis Optimization Runtime : Time (s): cpu = 00:01:53 ; elapsed = 00:03:31 . Memory (MB): peak = 1086.480 ; gain = 408.133
2default:defaulth p
x
? 
?
%s
*synth2?
?Synthesis Optimization Complete : Time (s): cpu = 00:02:21 ; elapsed = 00:03:50 . Memory (MB): peak = 1086.480 ; gain = 782.457
2default:defaulth p
x
? 
B
 Translating synthesized netlist
350*projectZ1-571h px? 
h
-Analyzing %s Unisim elements for replacement
17*netlist2
17132default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
12default:defaultZ29-28h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
v
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
22default:default2
362default:defaultZ31-138h px? 
?
!Unisim Transformation Summary:
%s111*project2?
?  A total of 100 instances were transformed.
  LD => LDCE: 64 instances
  LD => LDCE (inverted pins: G): 32 instances
  LDC => LDCE: 4 instances
2default:defaultZ1-111h px? 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
3012default:default2
1812default:default2
372default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:02:292default:default2
00:04:042default:default2
1086.4802default:default2
793.9302default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2l
XC:/MIPSfpga/Minisys_1A_CPU/Minisys_1A_CPU/Minisys_1A_CPU.runs/synth_1/Minisys_1A_CPU.dcp2default:defaultZ17-1381h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2&
write_checkpoint: 2default:default2
00:00:072default:default2
00:00:052default:default2
1086.4802default:default2
0.0002default:defaultZ17-268h px? 
?
%s4*runtcl2?
rExecuting : report_utilization -file Minisys_1A_CPU_utilization_synth.rpt -pb Minisys_1A_CPU_utilization_synth.pb
2default:defaulth px? 
?
treport_utilization: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.253 . Memory (MB): peak = 1086.480 ; gain = 0.000
*commonh px? 
?
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sat Jan 16 07:49:38 20212default:defaultZ17-206h px? 


End Record