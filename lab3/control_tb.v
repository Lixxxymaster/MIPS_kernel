`timescale 1 ns / 10 ps
module control_tb;

reg  [5:0]op;
reg   [5:0] i_opcode [10:0];
wire    o_regDst;
wire	o_regWrite;
wire	o_extOp;
wire    o_aluSrc; 
wire    o_beq;
wire    o_bne;
wire    o_j;
wire    o_memRead;
wire    o_memWrite;
wire    o_memtoReg;

integer i;
initial $readmemb("opcodes.txt", i_opcode);

control control_tb(
                    .i_opcode(op), 
                    .o_regDst(o_regDst),
	                .o_regWrite(o_regWrite),
	                .o_extOp(o_extOp),
                    .o_aluSrc(o_aluSrc), 
                    .o_beq(o_beq),
                    .o_bne(o_bne),
    	            .o_j(o_j),
                    .o_memRead(o_memRead),
                    .o_memWrite(o_memWrite),
                    .o_memtoReg(o_memtoReg)
              			 );

initial begin
	for (i = 0; i < 11; i = i + 1) begin
		op = i_opcode[i]; 
		#100;
	end
end	
endmodule