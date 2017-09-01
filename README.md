This work's purpose is creating hardware-supportted Checkpoint/Restore mechanism within L4 Fiasco.OC/ Genode

To use this, download the code with code below

```bash
git clone https://github.com/argos-research/fpga-mmu.git
```
After downlanding, lauch Xilinx Vivado, click File->Open Project, locate folder and select MMUv3.xpr

Then click Generate Bitstream in Flow Navigator. After Bitstream is created, select "Open Implemented Design" and click Ok.

Then Select File-> Export -> Export Hardware, select "Include bitstream" and click Ok.

Then Lauch SDK using File->Lauch SDK and click ok

After launching SDK, create a project using File-> New-> Application Project. Enter a name to your project then click **next**. Select "Hello World"

After project created, click Xilinx Tools-> Program FPGA and click Program.

After **Done LED** is turn yellow, click right on your project file in the Project Explorer and select Debug As-> Lauch on Hardware (System Debugger) and click yes on pop-up window.

Select XSCT Console on top right.

For Example you can type following code

```tcl

 mwr 0x43C00000 0x11110000
 mwr 0x43C00004 0x00010000
 mwr 0x43C00004 0x00000000
 
 mwr 0x43C00000 0x1111001C
 mwr 0x43C0000C 0xABCDABCD
 mwr 0x43C00008 0x11111111
 mwr 0x43C00008 0x00000000

 mrd 0x0000001C

```

This work created by using Xilinx Vivado 2017.1 under XUbuntu. Another operating system or Vivado release **may not** be fully working.
