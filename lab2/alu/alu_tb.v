`timescale 1ns/10ps
module alu_tb();

parameter t = 10;

reg [31:0] i_op1, i_op2;
reg [5:0] i_func;
reg [1:0] i_aluOp;
wire [3:0] o_aluControl;
wire [31:0] o_result;
wire o_zf;

aluControl aluControl_inst(
							.i_aluOp(i_aluOp),
							.i_func(i_func),
							.o_aluControl(o_aluControl)
);

alu alu_inst(
			.i_op1(i_op1),
			.i_op2(i_op2),
			.i_control(o_aluControl),
			.o_result(o_result),
			.o_zf(o_zf)
);


initial begin
	i_op1 = 10;
	i_op2 = 5;
	forever #t begin
		i_op1 <= i_op1 + 1;
		i_op2 <= i_op2 + 1;
	end
end



initial begin
	i_aluOp = 0;
	forever #(t*6) begin
		i_aluOp = i_aluOp + 1;
	end
end

initial begin
	forever #(t*2) begin
		i_func = $random;
	end
end


initial begin
	forever #(t) begin
		i_op1 = $random;	
		i_op2 = $random;
	end
end


initial begin
	#(t*100) $stop;
end


endmodule 