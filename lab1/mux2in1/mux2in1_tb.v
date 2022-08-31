`timescale 1ns/1ps
module mux2in1_tb();
    parameter
        WIDTH = 32,
        T = 10;

    reg [WIDTH-1:0] i_dat0, i_dat1;
    reg i_control;
    wire [WIDTH-1:0] o_dat;

    mux2in1 mux2in1_inst(
        .i_dat0(i_dat0),
        .i_dat1(i_dat1),
        .i_control(i_control),
        .o_dat(o_dat)
        );

    initial begin
        i_control = 0;
        forever #T i_control = ~i_control;
    end

    initial begin
        forever begin
            #(T/2)
            i_dat0 = 32'd540;
            i_dat1 = 32'd880;
        end
    end

    initial begin
        # ( T * 8) $stop;
    end

endmodule