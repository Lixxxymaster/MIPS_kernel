module control(
	input [5:0]  i_opcode,
	output  o_regDst,
	output	o_regWrite,
	output	o_extOp,
	output  o_aluSrc, 
	output  o_j,
	output  o_beq,
	output  o_bne,
	output  o_memWrite,
	output  o_memRead,
	output  o_memtoReg
               			);
               
reg [10:0] o_reg;

assign o_regDst 	= o_reg [9];
assign o_regWrite 	= o_reg [8];
assign o_extOp 		= o_reg [7];
assign o_aluSrc 	= o_reg [6];
assign o_beq 		= o_reg [5];
assign o_bne 		= o_reg [4];
assign o_j 			= o_reg [3];
assign o_memRead 	= o_reg [2];
assign o_memWrite 	= o_reg [1];
assign o_memtoReg 	= o_reg [0];

parameter [5:0] R 		= 6'h0;
parameter [5:0] addi 	= 6'h8;
parameter [5:0] slti 	= 6'hA;
parameter [5:0] andi 	= 6'hC;
parameter [5:0] ori 	= 6'hD;
parameter [5:0] xori 	= 6'hE;
parameter [5:0] lw 		= 6'h23;
parameter [5:0] sw 		= 6'h2B;
parameter [5:0] beq 	= 6'h4;
parameter [5:0] bne 	= 6'h5;
parameter [5:0] j 		= 6'h2;


always @(*)
	begin
		case(i_opcode)
		R:o_reg <= 10'b11x0000000;
		addi:o_reg <= 10'b0111000000;
		slti:o_reg <= 10'b0111000000;
		andi:o_reg <= 10'b0101000000;
		ori:o_reg <= 10'b0101000000;
		xori:o_reg <= 10'b0101000000;
		lw:o_reg <= 10'b0111000101;
		sw:o_reg <= 10'bx01100001x;
		beq:o_reg <= 10'bx0x010000x;
		bne:o_reg <= 10'bx0x001000x;
		j:o_reg <= 10'bx0xx00100x;
		endcase
	end
  
endmodule