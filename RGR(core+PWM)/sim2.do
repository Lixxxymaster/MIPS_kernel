transcript on

vlib work
vlog  alu.v aluControl.v adder.v inst_memory.v data_memory.v controlUnit.v nextPC.v pc.v regFile.v signExtend.v mux2in1.v mux3in1.v mux4in1.v register.v hazardDetect_unit.v main.v pwm.v counter_8bit.v lab6_tb.v 
vsim -t 1ns -voptargs="+acc" testbench


add wave /testbench/clk



#data_memory
add wave -radix unsigned /testbench/main/data_memory/i_addr
add wave -radix unsigned /testbench/main/data_memory/i_data
add wave -radix unsigned /testbench/main/data_memory/data_mem
add wave -radix unsigned /testbench/main/data_memory/o_data



#PC
add wave -radix unsigned /testbench/main/pc/o_pc

#regPWM
add wave -radix unsigned /testbench/main/regPWM_in/o_data

#TB
add wave -radix unsigned /testbench/*

onbreak resume

configure wave -timelineunits ns
run -all

wave zoom full