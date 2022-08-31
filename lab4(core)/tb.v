`timescale 1ns / 1ps

module tb;

parameter t = 10;

reg clk, rst;

core core_inst(
    .i_clk(clk),
    .i_rst_n(rst)
);

initial begin
    #0 clk = 0;
    forever begin
        #t clk = ~clk;
    end
end

initial begin
    #0 rst = 0;
    #(t*2) rst = 1;
    
end

initial #(t*100) $stop;

endmodule