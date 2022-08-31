module adder(i_data1, i_data2, o_result);

input [31:0] i_data1, i_data2;
output [31:0] o_result;

assign o_result = i_data1 + i_data2;

  
endmodule