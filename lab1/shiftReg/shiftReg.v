module shiftReg(i_data, o_data);
    input   [31:0]   i_data;
    output reg [31:0]   o_data;

    always @(i_data) begin
        o_data <= {i_data[29:0], 2'b0};
    end

endmodule