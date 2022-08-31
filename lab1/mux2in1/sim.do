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
vlog  mux2in1.v mux2in1_tb.v

# Open testbench module for simulation
vsim work.mux2in1_tb

# Add all testbench signals to waveform diagram
add wave -radix unsigned sim:/mux2in1_tb/*
onbreak resume
# Run simulation
run -all
wave zoom full