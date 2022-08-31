module control(
	input [5:0]  i_opcode,
	output  o_regDst,
	output  o_j,
	output  o_branch,
	output  o_memRead,
	output  o_memtoReg,
	output [1:0] o_aluOp,
	output  o_memWrite,
	output  o_aluSrc,
	output  o_regWrite,
	output o_extOp
	);
               
reg [10:0] o_reg;

assign o_regDst 	= o_reg [10];
assign o_aluSrc		= o_reg [9];
assign o_memtoReg 	= o_reg [8];
assign o_regWrite	= o_reg [7];
assign o_memRead	= o_reg [6];
assign o_memWrite	= o_reg [5];
assign o_branch 	= o_reg [4];
assign o_j 			= o_reg [3];
assign o_extOp		= o_reg [2];
assign o_aluOp[1] 	= o_reg [1];
assign o_aluOp[0] 	= o_reg [0];


parameter [5:0] R 		= 6'b0;
parameter [5:0] lw 		= 6'b100011;
parameter [5:0] sw 		= 6'b101011;
parameter [5:0] beq 	= 6'b000100;
parameter [5:0] j 		= 6'b000010;
parameter [5:0] addi	= 6'b001000;
parameter [5:0] addiu	= 6'b001001;


always @(*)
	begin
		case(i_opcode)
		R:o_reg <= 11'b1001_0000_x10;
		lw:o_reg <= 11'b0111_1000_100;
		sw:o_reg <= 11'bx1x0_0100_100;
		beq:o_reg <= 11'bx0x0_0010_x01;
		addi:o_reg <= 11'b0101_0000_100;
		addiu:o_reg <= 11'b0101_0000_000;
		j:o_reg <= 11'bxxx0_00x1_xxx;
		endcase
	end
  
endmodule