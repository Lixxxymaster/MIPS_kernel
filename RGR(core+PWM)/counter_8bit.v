module counter_8bit (
    input clk,
    input rst_n,
    output [7:0] counter);

reg [7:0] counter_r = 0;

assign counter = counter_r;

always @(posedge clk, negedge rst_n) begin
    if (~rst_n)
    counter_r <= 8'b0;
    else
    counter_r <= counter_r + 1;
end
endmodule