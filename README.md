# V850_interfacing_unit

An interfacing unit for the V850 uPD70F37xy microcontrollers used to access on-board external peripherals: SRAM, DSP, UART, LCD display.

The address space for the external peripherals is allocated in the external memory area.

1. External RAM<br/>
SRAM: 0x00180000 - 0x001FFFFF (512KB), 0x00200000 - 0x002FFFFF (1MB)

2.	Memory mapped devices<br/>
DSP HPI: 0x00100000 - 0x0010FFFF (64KB), 0x00110000 - 0x0011FFFF (64KB)<br/>
UART: 0x00140000 - 0x0014FFFF (64KB)<br/>
LCD/LED: 0x00160000 - 0x0016FFFF (64KB)<br/>

The interfacing unit is implemented in Xilinx CPLD XC9572XL and connected to the external memory bus of the microcontroller.
