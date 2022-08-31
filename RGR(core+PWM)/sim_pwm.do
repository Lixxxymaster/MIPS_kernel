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
vlog  counter_8bit.v pwm.v tb_pwm_generator.v

# Open testbench module for simulation
vsim work.testbench

# Add all testbench signals to waveform diagram
add wave sim:/testbench/*


onbreak resume

# Run simulation
run -all

wave zoom full
