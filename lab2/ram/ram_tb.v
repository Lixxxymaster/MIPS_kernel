`timescale 1ns/10ps
module ram_tb();

parameter t = 10;
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 4; //32 4-byte words 

reg                     i_clk, i_we;
reg   [ADDR_WIDTH-1:0]  i_addr;
reg   [DATA_WIDTH-1:0]  i_data;
wire  [DATA_WIDTH-1:0]  o_data;


ram ram_inst(
.i_clk(i_clk),
.i_addr(i_addr),
.i_data(i_data),
.i_we(i_we),
.o_data(o_data)
);

initial begin
	i_clk = 0;
	forever #(t/2) begin
		i_clk = ~i_clk;
	end
end


initial begin
	forever #(t) begin
		i_data = $random;	
	end
end

initial begin
	forever #(t * 2) begin
		i_addr = $random;
	end
end

initial begin
	i_we = 0;
	forever #(t * 6) begin
		i_we = ~i_we;
	end
end


initial begin
	#(t * 100) $stop;
end


endmodule