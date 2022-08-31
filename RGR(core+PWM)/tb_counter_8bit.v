`timescale 1ns / 1ps

module testbench;

parameter PERIOD = 20;
reg  clk, rst_n;
wire [7:0] counter;

counter_8bit counter_8bit_inst(.clk(clk),
                                .rst_n(rst_n),
                                .counter(counter)                       
                                );



initial begin
    clk = 0;
    forever #(PERIOD/2) clk = ~clk;
end

initial begin
    rst_n = 1'b0;

    @(negedge clk) rst_n = 1;

    repeat (30) @(negedge clk);

    #1000 $finish;  
end


endmodule