module aluControl(i_aluOp, i_func, o_aluControl);
 
input       [1:0]   i_aluOp;
input       [5:0]   i_func;
output  reg [3:0]   o_aluControl;

localparam AND = 4'b0000, OR = 4'b0001, ADD = 4'b0010;
localparam SUB = 4'b0110, SOLT = 4'b0111, NOR = 4'b1100;

always@(*)begin
	case (i_aluOp)
		2'b00: o_aluControl = ADD;
		2'b01: o_aluControl = SUB;
		default:case(i_func)
			6'b10_0000: o_aluControl = ADD;
			6'b10_0010: o_aluControl = SUB;
			6'b10_0100: o_aluControl = AND;
			6'b10_0101: o_aluControl = OR;
			6'b10_0111: o_aluControl = NOR;
			6'b10_1010: o_aluControl = SOLT;
		endcase // i_func
	endcase // i_aluOp
end
endmodule