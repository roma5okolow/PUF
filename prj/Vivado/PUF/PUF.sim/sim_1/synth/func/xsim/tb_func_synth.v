// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Tue May 16 22:52:46 2023
// Host        : bsibgatullin-ThinkPad-E14-Gen-2 running 64-bit Ubuntu 22.04.2 LTS
// Command     : write_verilog -mode funcsim -nolib -force -file
//               /home/bsibgatullin/study/PUF/prj/Vivado/PUF/PUF.sim/sim_1/synth/func/xsim/tb_func_synth.v
// Design      : arbiter_puf
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* C_DFF_TYPE = "PRIMITIVE" *) (* C_LENGTH = "3" *) 
(* NotValidForBitStream *)
module arbiter_puf
   (ipulse,
    ichallenge,
    oresponse);
  input ipulse;
  input [2:0]ichallenge;
  output oresponse;

  wire [2:0]ichallenge;
  wire [2:0]ichallenge_IBUF;
  wire ipulse;
  wire ipulse_IBUF;
  wire odelay_line_oout_1;
  wire odelay_line_oout_2;
  wire oresponse;
  wire oresponse_OBUF;

  IBUF #(
    .CCIO_EN("TRUE")) 
    \ichallenge_IBUF[0]_inst 
       (.I(ichallenge[0]),
        .O(ichallenge_IBUF[0]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \ichallenge_IBUF[1]_inst 
       (.I(ichallenge[1]),
        .O(ichallenge_IBUF[1]));
  IBUF #(
    .CCIO_EN("TRUE")) 
    \ichallenge_IBUF[2]_inst 
       (.I(ichallenge[2]),
        .O(ichallenge_IBUF[2]));
  (* C_LENGTH = "3" *) 
  delay_line inst_delay_line
       (.ichallenge({1'b0,1'b0,1'b0,ichallenge_IBUF}),
        .ipulse(ipulse_IBUF),
        .oout_1(odelay_line_oout_1),
        .oout_2(odelay_line_oout_2));
  (* C_DFF_TYPE = "PRIMITIVE" *) 
  dff inst_dff
       (.iclk(odelay_line_oout_2),
        .id(odelay_line_oout_1),
        .oq(oresponse_OBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    ipulse_IBUF_inst
       (.I(ipulse),
        .O(ipulse_IBUF));
  OBUF oresponse_OBUF_inst
       (.I(oresponse_OBUF),
        .O(oresponse));
endmodule

(* C_LENGTH = "3" *) 
module delay_line
   (ipulse,
    ichallenge,
    oout_1,
    oout_2);
  input ipulse;
  input [5:0]ichallenge;
  output oout_1;
  output oout_2;

  wire [5:0]ichallenge;
  (* DONT_TOUCH *) wire [7:0]net;

  assign net[0] = ipulse;
  assign oout_1 = net[6];
  assign oout_2 = net[7];
  mux__1 \genblk1[1].inst_mux_1 
       (.ia(net[0]),
        .ib(net[1]),
        .isel(ichallenge[0]),
        .oout(net[2]));
  mux__2 \genblk1[1].inst_mux_2 
       (.ia(net[1]),
        .ib(net[0]),
        .isel(ichallenge[0]),
        .oout(net[3]));
  mux__3 \genblk1[2].inst_mux_1 
       (.ia(net[2]),
        .ib(net[3]),
        .isel(ichallenge[1]),
        .oout(net[4]));
  mux__4 \genblk1[2].inst_mux_2 
       (.ia(net[3]),
        .ib(net[2]),
        .isel(ichallenge[1]),
        .oout(net[5]));
  mux__5 \genblk1[3].inst_mux_1 
       (.ia(net[4]),
        .ib(net[5]),
        .isel(ichallenge[2]),
        .oout(net[6]));
  mux \genblk1[3].inst_mux_2 
       (.ia(net[5]),
        .ib(net[4]),
        .isel(ichallenge[2]),
        .oout(net[7]));
  LUT1 #(
    .INIT(2'h2)) 
    net_inst
       (.I0(net[0]),
        .O(net[1]));
endmodule

(* C_DFF_TYPE = "PRIMITIVE" *) 
module dff
   (id,
    iclk,
    oq);
  input id;
  input iclk;
  output oq;

  wire iclk;
  wire id;
  wire oq;

  (* BOX_TYPE = "PRIMITIVE" *) 
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b0),
    .IS_D_INVERTED(1'b0),
    .IS_R_INVERTED(1'b0)) 
    \dff_primitive.FDRE_inst 
       (.C(iclk),
        .CE(1'b1),
        .D(id),
        .Q(oq),
        .R(1'b0));
endmodule

module mux
   (ia,
    ib,
    isel,
    oout);
  input ia;
  input ib;
  input isel;
  output oout;

  wire ia;
  wire ib;
  wire isel;
  wire oout;

  LUT3 #(
    .INIT(8'hB8)) 
    oout_INST_0
       (.I0(ia),
        .I1(isel),
        .I2(ib),
        .O(oout));
endmodule

(* ORIG_REF_NAME = "mux" *) 
module mux__1
   (ia,
    ib,
    isel,
    oout);
  input ia;
  input ib;
  input isel;
  output oout;

  wire ia;
  wire ib;
  wire isel;
  wire oout;

  LUT3 #(
    .INIT(8'hB8)) 
    oout_INST_0
       (.I0(ia),
        .I1(isel),
        .I2(ib),
        .O(oout));
endmodule

(* ORIG_REF_NAME = "mux" *) 
module mux__2
   (ia,
    ib,
    isel,
    oout);
  input ia;
  input ib;
  input isel;
  output oout;

  wire ia;
  wire ib;
  wire isel;
  wire oout;

  LUT3 #(
    .INIT(8'hB8)) 
    oout_INST_0
       (.I0(ia),
        .I1(isel),
        .I2(ib),
        .O(oout));
endmodule

(* ORIG_REF_NAME = "mux" *) 
module mux__3
   (ia,
    ib,
    isel,
    oout);
  input ia;
  input ib;
  input isel;
  output oout;

  wire ia;
  wire ib;
  wire isel;
  wire oout;

  LUT3 #(
    .INIT(8'hB8)) 
    oout_INST_0
       (.I0(ia),
        .I1(isel),
        .I2(ib),
        .O(oout));
endmodule

(* ORIG_REF_NAME = "mux" *) 
module mux__4
   (ia,
    ib,
    isel,
    oout);
  input ia;
  input ib;
  input isel;
  output oout;

  wire ia;
  wire ib;
  wire isel;
  wire oout;

  LUT3 #(
    .INIT(8'hB8)) 
    oout_INST_0
       (.I0(ia),
        .I1(isel),
        .I2(ib),
        .O(oout));
endmodule

(* ORIG_REF_NAME = "mux" *) 
module mux__5
   (ia,
    ib,
    isel,
    oout);
  input ia;
  input ib;
  input isel;
  output oout;

  wire ia;
  wire ib;
  wire isel;
  wire oout;

  LUT3 #(
    .INIT(8'hB8)) 
    oout_INST_0
       (.I0(ia),
        .I1(isel),
        .I2(ib),
        .O(oout));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
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
    reg GRESTORE_int;

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
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

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

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
