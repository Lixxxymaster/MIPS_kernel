`timescale 1ns/1ps
module shiftReg_tb();
    parameter T = 10;

    reg [31:0] i_data;
    wire [31:0] o_data;

    shiftReg shiftReg_inst(
        .i_data(i_data),
        .o_data(o_data)
        );

    initial begin
	    i_data = $random;
        forever begin
            #T i_data = $random;
        end
    end

    initial begin
        #(T * 8) $stop;
    end

endmodule