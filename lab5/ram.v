module ram(i_clk, i_addr, i_data, i_write, i_read, o_data);
parameter DATA_WIDTH = 32;
parameter ADDR_WIDTH = 32;

input                     i_clk, i_write, i_read;
input   [ADDR_WIDTH-1:0]  i_addr;
input   [DATA_WIDTH-1:0]  i_data;
output reg [DATA_WIDTH-1:0]  o_data;

reg [DATA_WIDTH-1:0] RAM [ADDR_WIDTH-1:0];

initial begin
	RAM[0] = 10;
end


always@(*) begin
	if(i_read && ~i_write)begin
		o_data <= RAM[i_addr];
	end
	
end  

always@(posedge i_clk) begin
	if(~i_read && i_write)begin
		RAM[i_addr] <= i_data;
	end
end  

endmodule