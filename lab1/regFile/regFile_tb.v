`timescale 1ns / 1ps
module regFile_tb;

parameter T = 10;
reg i_clk, i_we;
reg   [4:0]   i_raddr1, i_raddr2, i_waddr;
reg   [31:0]  i_wdata;           
wire  [31:0]  o_rdata1, o_rdata2;


regFile regFile_inst(
	                .i_clk(i_clk),
	                .i_RA(i_raddr1), 
                    .i_RB(i_raddr2), 
 	                .i_RW(i_waddr), 
                    .i_BusW(i_wdata), 
                    .i_RegWrite(i_we),
                    .o_BusA(o_rdata1),
                    .o_BusB(o_rdata2) 	
);

initial begin
    i_clk = 0;
    forever #(T/2) i_clk = ~i_clk;
end

initial begin
    i_we = 0;
    forever #(T*4) i_we = ~i_we;

end


initial begin 
    i_raddr1 = 0;
	i_raddr2 = 0;
	forever #(T * 5) begin
		i_raddr1 <= i_raddr1 + 1;
		i_raddr2 <= i_raddr2 + 2;
	end
end

initial begin 
    i_waddr = 0;
	i_wdata = 0;
	forever #(T) begin
		i_waddr <= i_waddr + 1;
		i_wdata <= i_wdata + 5;
	end
end

initial begin
    #(T*50) $stop;
end

endmodule