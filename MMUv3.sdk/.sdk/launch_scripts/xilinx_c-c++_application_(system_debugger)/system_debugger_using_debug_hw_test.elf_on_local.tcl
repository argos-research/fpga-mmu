connect -url tcp:127.0.0.1:3121
source /home/user/zynq/MMUv3/MMUv3.sdk/design_1_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "Digilent Zybo 210279654325A"} -index 0
stop
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279654325A"} -index 0
rst -processor
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "Digilent Zybo 210279654325A"} -index 0
dow /home/user/zynq/MMUv3/MMUv3.sdk/hw_test/Debug/hw_test.elf
bpadd -addr &main
