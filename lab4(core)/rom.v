module rom
#(parameter DATA_WIDTH=32,  ADDR_WIDTH=32)
(
	input [(ADDR_WIDTH-1):0] i_addr,
	output [(DATA_WIDTH-1):0] o_data
);



reg [DATA_WIDTH-1:0] ROM [ADDR_WIDTH-1:0];

initial $readmemb("ROM.dat", ROM);

assign o_data = ROM[i_addr];

endmodule