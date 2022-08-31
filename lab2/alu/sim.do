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
vlog  alu.v aluControl.v alu_tb.v 

# Open testbench module for simulation
vsim work.alu_tb

# Add all testbench signals to waveform diagram
add wave -radix unsigned sim:/alu_tb/*
onbreak resume
# Run simulation
run -all
wave zoom full