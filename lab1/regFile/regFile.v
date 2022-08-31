module regFile(i_clk, 
               i_RA, 
               i_RB, 
               i_RW, 
               i_BusW, 
               i_RegWrite,
               o_BusA,
               o_BusB 
               );
               
input           i_clk, i_RegWrite;
input   [4:0]   i_RA, i_RB, i_RW;
input   [31:0]  i_BusW;           
output  [31:0]  o_BusA, o_BusB;

reg [31:0] register [31:0];

always @(posedge i_clk) begin
	if(i_RegWrite && i_RW != 0) begin
		register [i_RW] <= i_BusW;
	end
end

assign o_BusA = register[i_RA];
assign o_BusB = register[i_RB];

initial $readmemh ("GPR_init.hex", register);
endmodule