module extender(i_data, o_data);

input [15:0] i_data;
output [31:0] o_data;

assign o_data = {16'b0, i_data};

endmodule