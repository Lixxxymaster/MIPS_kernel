`timescale 1ns/10ps
module rom_tb();

parameter t = 10;
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 8;  

reg   [ADDR_WIDTH-1:0]  i_addr;
wire  [DATA_WIDTH-1:0]  o_data;

rom rom_inst(
.i_addr(i_addr),
.o_data(o_data)
);

initial begin
    i_addr = 0;
	forever #(2*t) begin
		i_addr = i_addr + 1;
	end
end

initial begin
	#(t*100) $stop;
end

endmodule 