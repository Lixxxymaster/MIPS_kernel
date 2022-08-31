`timescale 1ns/10ps
module signExt_tb;

parameter T = 10;

reg en;
reg [15:0] i_data;
wire [31:0] o_data;

signExt signExt_inst(
	.i_data(i_data),
	.en(en),
	.o_data(o_data)
);

initial begin 
	i_data = 0;
	forever #(T) i_data = $random;
end

initial begin
	en = 0;
	forever #(T*2) en = ~en;
end

initial #1000 $stop;

endmodule