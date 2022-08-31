`timescale 1ns/10ps

module adder_tb();

parameter t = 10;

reg [31:0] i_data1, i_data2;
wire [31:0] o_result;
 
adder adder_inst(
	.i_data1(i_data1),
	.i_data2(i_data2),
	.o_result(o_result));

initial begin 
	forever #(t) begin 
		i_data1 = $random;
		i_data2 = $random;
	end
end

initial #(t*100) $stop;

endmodule