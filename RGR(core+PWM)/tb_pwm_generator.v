`timescale 1ns / 1ps

module testbench;

parameter PERIOD = 20;
reg  clk, rst_n;
reg [7:0] PWM_in;
wire [7:0] counter;
wire PWM_out;

integer i;

PWM_generator PWM_generator_inst(.PWM_in(PWM_in),
                                .PWM_out(PWM_out),
                                .clk(clk),
                                .rst_n(rst_n),
                                .counter(counter)                       
                                );

initial begin
    PWM_in = 0;
    for(i = 0; i < 8'b11111111; i = i + 1) #(10000) PWM_in = PWM_in + 5;
end

initial begin
    clk = 0;
    forever #(PERIOD/2) clk = ~clk;
end

initial begin
    rst_n = 1'b0;

    @(negedge clk) rst_n = 1;
    #600000 rst_n = 0;

    #1000000 $finish;  
end


endmodule