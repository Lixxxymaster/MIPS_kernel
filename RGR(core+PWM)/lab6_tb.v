`timescale 1ns/1ps
module testbench;
parameter PERIOD = 20;

wire  PWM_out;
reg clk, rst_n_pc, rst_n_registers, rst_n_pwm, PWM_load;

main main (	.i_clk(clk),
			.i_rst_n_pc(rst_n_pc),
			.i_rst_n_registers(rst_n_registers),
			.rst_n_pwm(rst_n_pwm), 
			.PWM_out(PWM_out),  
			.PWM_load(PWM_load)
			);

//descript test for module
//init clk 
initial begin
	clk = 0;
	forever #(PERIOD / 2) clk = ~clk;
end

initial begin
	rst_n_pc = 0;
	rst_n_registers = 0;
	rst_n_pwm = 0;
	PWM_load = 0;

	#2 rst_n_pc = 1;
	rst_n_registers = 1;
	rst_n_pwm = 1;
	PWM_load = 1;

	#5 PWM_load = 0;

	#100 PWM_load = 1;

	#30 PWM_load = 0;


	#8030 PWM_load = 1;
	#30 PWM_load = 0;
end

initial #(1000*PERIOD) $finish;
endmodule : testbench