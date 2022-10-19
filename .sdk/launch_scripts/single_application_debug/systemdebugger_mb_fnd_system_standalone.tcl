connect -url tcp:127.0.0.1:3121
targets -set -filter {jtag_cable_name =~ "Digilent Basys3 210183B31B06A" && level==0 && jtag_device_ctx=="jsn-Basys3-210183B31B06A-0362d093-0"}
fpga -file D:/xilinx_2020/MicroBlaze_Tick_Led_Button/MicroBlaze_Tick_Led_Button__FND_Vitis/MB_FND/_ide/bitstream/design_MB_Tick_FND.bit
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
loadhw -hw D:/xilinx_2020/MicroBlaze_Tick_Led_Button/MicroBlaze_Tick_Led_Button__FND_Vitis/design_MB_Tick_FND/export/design_MB_Tick_FND/hw/design_MB_Tick_FND.xsa -regs
configparams mdm-detect-bscan-mask 2
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
rst -system
after 3000
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
dow D:/xilinx_2020/MicroBlaze_Tick_Led_Button/MicroBlaze_Tick_Led_Button__FND_Vitis/MB_FND/Debug/MB_FND.elf
targets -set -nocase -filter {name =~ "*microblaze*#0" && bscan=="USER2" }
con
