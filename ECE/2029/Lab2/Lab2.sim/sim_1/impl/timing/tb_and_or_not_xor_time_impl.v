// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Mon Jan 28 09:02:15 2019
// Host        : AK317A-16 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file {R:/ECE 2029 Lab
//               2/Lab2/Lab2.sim/sim_1/impl/timing/tb_and_or_not_xor_time_impl.v}
// Design      : and_or_not_xor
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* ECO_CHECKSUM = "ee800d6f" *) 
(* NotValidForBitStream *)
module and_or_not_xor
   (A,
    B,
    C,
    outAND,
    outOR,
    outXOR,
    notC);
  input A;
  input B;
  input C;
  output outAND;
  output outOR;
  output outXOR;
  output notC;

  wire A;
  wire A_IBUF;
  wire B;
  wire B_IBUF;
  wire C;
  wire C_IBUF;
  wire notC;
  wire notC_OBUF;
  wire outAND;
  wire outAND_OBUF;
  wire outOR;
  wire outOR_OBUF;
  wire outXOR;
  wire outXOR_OBUF;

initial begin
 $sdf_annotate("tb_and_or_not_xor_time_impl.sdf",,,,"tool_control");
end
  IBUF A_IBUF_inst
       (.I(A),
        .O(A_IBUF));
  IBUF B_IBUF_inst
       (.I(B),
        .O(B_IBUF));
  IBUF C_IBUF_inst
       (.I(C),
        .O(C_IBUF));
  OBUF notC_OBUF_inst
       (.I(notC_OBUF),
        .O(notC));
  LUT1 #(
    .INIT(2'h1)) 
    notC_OBUF_inst_i_1
       (.I0(C_IBUF),
        .O(notC_OBUF));
  OBUF outAND_OBUF_inst
       (.I(outAND_OBUF),
        .O(outAND));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'h8)) 
    outAND_OBUF_inst_i_1
       (.I0(B_IBUF),
        .I1(A_IBUF),
        .O(outAND_OBUF));
  OBUF outOR_OBUF_inst
       (.I(outOR_OBUF),
        .O(outOR));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT2 #(
    .INIT(4'hE)) 
    outOR_OBUF_inst_i_1
       (.I0(B_IBUF),
        .I1(A_IBUF),
        .O(outOR_OBUF));
  OBUF outXOR_OBUF_inst
       (.I(outXOR_OBUF),
        .O(outXOR));
  LUT2 #(
    .INIT(4'h6)) 
    outXOR_OBUF_inst_i_1
       (.I0(A_IBUF),
        .I1(B_IBUF),
        .O(outXOR_OBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
