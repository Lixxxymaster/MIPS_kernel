###########################
# Simple modelsim do file #
###########################

# Delete old compilation results
if { [file exists "work"] } {
    vdel -all
}

# Create new modelsim working library
vlib work

# Compile all the Verilog sources in current folder into working library
vlog  adder.v alu.v aluControl.v control.v core.v extender.v mux2in1.v pc.v ram.v regFile.v rom.v shiftReg.v signExt.v tb.v

# Open testbench module for simulation
vsim work.tb

# Add all testbench signals to waveform diagram
add wave -radix unsigned sim:/tb/core_inst/regFile_inst/register
add wave -radix unsigned sim:/tb/core_inst/ram_inst/RAM
add wave -radix unsigned sim:/tb/core_inst/rom_inst/o_data
add wave -radix unsigned sim:/tb/core_inst/mux2/i_dat1
add wave -radix unsigned sim:/tb/core_inst/mux1/i_dat0
add wave -radix unsigned sim:/tb/*
onbreak resume
# Run simulation
run -all
wave zoom full