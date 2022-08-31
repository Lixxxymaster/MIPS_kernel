module alu(i_op1, i_op2, i_control, o_result, o_zf);

localparam [3:0] 
AND = 0, 
OR  = 1, 
ADD = 2, 
SUB = 3, 
SOLT = 4, 
NOR = 5; 
//SOLT - Set On Less then
 
  
input       [31:0]  i_op1, i_op2;
input       [3:0]   i_control;
output  reg [31:0]  o_result;
output  reg         o_zf;

always@(i_op1, i_op2, i_control) begin
	case (i_control)
		AND: o_result = i_op1 & i_op2;
		OR:  o_result = i_op1 | i_op2;
		ADD: o_result = i_op1 + i_op2;
		SUB: o_result = i_op1 - i_op2;
		SOLT: o_result = i_op1 < i_op2;
		NOR: o_result = ~(i_op1 | i_op2);
	endcase	
end

assign o_zf = ~|o_result;
  
endmodule