module core(
    input i_clk,
    input i_rst_n
);

wire [31:0] pc_in, pc_out, rom_out, BusA_out, BusB_out;
wire [31:0] alu_result, op2_in, Extender_out, BusW_in, ram_out;
wire [31:0] adder1_out, shLeft2_2_out, shLeft2_1_out;
wire [31:0] adder2_out, mux1_out, shiftReg1_out, shiftReg1_outn;
wire [4:0] RW_in;
wire [3:0] aluCtrl;
wire [1:0] aluOp;
wire and_out, zero;
wire regDst, RegWrite, aluSrc, memRead, memWrite, memtoReg;
wire j, Branch, PCSrc,  ExtOp;

pc pc_inst(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_pc(pc_in),
    .o_pc(pc_out)
);

adder adder1(
    .i_data1(4),
    .i_data2(pc_out),
    .o_result(adder1_out)
);

adder adder2(
    .i_data1(adder1_out),
    .i_data2(shLeft2_2_out),
    .o_result(adder2_out)
);

shiftReg shiftReg2_inst(
    .i_data(Extender_out),
    .o_data(shLeft2_2_out)
);

assign and_out = Branch & zero;

mux2in1 mux1(
    .i_dat0(adder1_out),
    .i_dat1(adder2_out),
    .i_control(and_out),
    .o_dat(mux1_out)
);


mux2in1 mux2(
    .i_dat0(mux1_out),
    .i_dat1(shiftReg1_outn),
    .i_control(j),
    .o_dat(pc_in)
);

rom rom_inst(
    .i_addr(pc_out),
    .o_data(rom_out)
);

shiftReg shiftReg1_inst(
    .i_data(rom_out),
    .o_data(shiftReg1_out)
);

assign shiftReg1_outn = {adder1_out[31:28], shiftReg1_out[27:0]};

mux2in1 #(.WIDTH(5)) mux3(
    .i_dat0(rom_out[20:16]),
    .i_dat1(rom_out[15:11]),
    .i_control(regDst),
    .o_dat(RW_in)
);

regFile regFile_inst(
    .i_clk(i_clk),
    .i_RA(rom_out[25:21]),
    .i_RB(rom_out[20:16]),
    .i_RW(RW_in), 
    .i_BusW(BusW_in), 
    .i_RegWrite(RegWrite),
    .o_BusA(BusA_out),
    .o_BusB(BusB_out)
);
////////////////////////////////////////
mux2in1 #(.WIDTH(32)) mux4(
    .i_dat0(BusB_out),
    .i_dat1(Extender_out),
    .i_control(aluSrc),
    .o_dat(op2_in)
);

signExt signExt_inst(
    .i_data(rom_out[15:0]),
    .o_data(Extender_out),
    .en(ExtOp)
);

alu alu_inst(
    .i_op1(BusA_out),
    .i_op2(op2_in),
    .i_control(aluCtrl),
    .o_result(alu_result),
    .o_zf(zero)
);

ram ram_inst(
    .i_clk(i_clk),
    .i_addr(alu_result),
    .i_data(BusB_out),
    .i_write(memWrite),
    .i_read(memRead),
    .o_data(ram_out)
);

mux2in1 mux5(
    .i_dat0(alu_result),
    .i_dat1(ram_out),
    .i_control(memtoReg),
    .o_dat(BusW_in)
);

aluControl aluControl_inst(
    .i_aluOp(aluOp),
    .i_func(rom_out[5:0]),
    .o_aluControl(aluCtrl)
);

control control_inst(
    .i_opcode(rom_out[31:26]),
	.o_regDst(regDst),
	.o_j(j),
	.o_branch(Branch),
	.o_memRead(memRead),
	.o_memtoReg(memtoReg),
	.o_aluOp(aluOp),
	.o_memWrite(memWrite),
	.o_aluSrc(aluSrc),
	.o_regWrite(RegWrite),
    .o_extOp(ExtOp)
);



endmodule