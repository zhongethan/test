module Hssync(
  input        io_global_pclk,
  input        io_global_presetn,
  input        io_global_sclk,
  input        io_global_sresetn,
  input  [7:0] io_master_key_curinfo,
  input  [3:0] io_master_key_vld,
  output [3:0] io_master_key_ack,
  output [7:0] io_slave_key_curinfo,
  output [3:0] io_slave_key_vld,
  input  [3:0] io_slave_key_ack
);
  reg  _T; // @[Hssync.scala 19:29]
  reg [31:0] _RAND_0;
  reg  _T_1; // @[Hssync.scala 20:30]
  reg [31:0] _RAND_1;
  wire  _T_2; // @[Hssync.scala 21:23]
  reg [1:0] _T_3; // @[Hssync.scala 22:27]
  reg [31:0] _RAND_2;
  wire  _T_4; // @[Conditional.scala 37:30]
  wire  _T_5; // @[Conditional.scala 37:30]
  wire  _T_6; // @[Hssync.scala 28:32]
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Hssync.scala 32:14]
  wire  _T_10; // @[Conditional.scala 37:30]
  wire  _T_11; // @[Hssync.scala 44:26]
  wire  _T_13; // @[Hssync.scala 44:42]
  wire  _T_14; // @[Hssync.scala 45:30]
  wire  _T_16; // @[Hssync.scala 45:46]
  wire  _T_20; // @[Hssync.scala 47:51]
  reg [1:0] _T_21; // @[Hssync.scala 53:27]
  reg [31:0] _RAND_3;
  reg  _T_22; // @[Hssync.scala 54:28]
  reg [31:0] _RAND_4;
  reg  _T_23; // @[Hssync.scala 55:30]
  reg [31:0] _RAND_5;
  wire  _T_24; // @[Conditional.scala 37:30]
  wire  _T_25; // @[Conditional.scala 37:30]
  wire  _T_27; // @[Conditional.scala 37:30]
  wire  _T_28; // @[Hssync.scala 64:31]
  wire  _T_29; // @[Conditional.scala 37:30]
  wire  _T_30; // @[Hssync.scala 67:14]
  wire  _T_31; // @[Hssync.scala 70:34]
  wire  _T_32; // @[Hssync.scala 70:63]
  wire  _T_34; // @[Hssync.scala 70:79]
  wire  _T_35; // @[Hssync.scala 70:50]
  wire  _T_36; // @[Hssync.scala 71:26]
  assign _T_2 = _T_1 == 1'h0; // @[Hssync.scala 21:23]
  assign _T_4 = 2'h0 == _T_3; // @[Conditional.scala 37:30]
  assign _T_5 = 2'h1 == _T_3; // @[Conditional.scala 37:30]
  assign _T_6 = io_master_key_vld == 4'h1; // @[Hssync.scala 28:32]
  assign _T_7 = 2'h2 == _T_3; // @[Conditional.scala 37:30]
  assign _T_8 = io_master_key_vld == 4'h0; // @[Hssync.scala 32:14]
  assign _T_10 = 2'h3 == _T_3; // @[Conditional.scala 37:30]
  assign _T_11 = _T_3 == 2'h1; // @[Hssync.scala 44:26]
  assign _T_13 = _T_11 & _T_6; // @[Hssync.scala 44:42]
  assign _T_14 = _T_3 == 2'h2; // @[Hssync.scala 45:30]
  assign _T_16 = _T_14 & _T_2; // @[Hssync.scala 45:46]
  assign _T_20 = _T_14 & _T_1; // @[Hssync.scala 47:51]
  assign _T_24 = 2'h0 == _T_21; // @[Conditional.scala 37:30]
  assign _T_25 = 2'h1 == _T_21; // @[Conditional.scala 37:30]
  assign _T_27 = 2'h2 == _T_21; // @[Conditional.scala 37:30]
  assign _T_28 = io_slave_key_ack == 4'h1; // @[Hssync.scala 64:31]
  assign _T_29 = 2'h3 == _T_21; // @[Conditional.scala 37:30]
  assign _T_30 = _T_23 == 1'h0; // @[Hssync.scala 67:14]
  assign _T_31 = _T_21 == 2'h2; // @[Hssync.scala 70:34]
  assign _T_32 = _T_21 == 2'h1; // @[Hssync.scala 70:63]
  assign _T_34 = _T_32 & _T_23; // @[Hssync.scala 70:79]
  assign _T_35 = _T_31 | _T_34; // @[Hssync.scala 70:50]
  assign _T_36 = _T_21 == 2'h3; // @[Hssync.scala 71:26]
  assign io_master_key_ack = {{3'd0}, _T_20}; // @[Hssync.scala 47:23]
  assign io_slave_key_curinfo = io_master_key_curinfo; // @[Hssync.scala 74:24]
  assign io_slave_key_vld = {{3'd0}, _T_35}; // @[Hssync.scala 70:22]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_1 = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_3 = _RAND_2[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_21 = _RAND_3[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_22 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_23 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  if (io_global_sresetn) begin
    _T_3 = 2'h0;
  end
  if (io_global_presetn) begin
    _T_21 = 2'h0;
  end
end
  always @(posedge io_global_sclk) begin
    _T <= _T_36 & _T_23;
    _T_1 <= _T;
  end
  always @(posedge io_global_pclk) begin
    _T_22 <= _T_13 | _T_16;
    _T_23 <= _T_22;
  end
  always @(posedge io_global_sclk or posedge io_global_sresetn) begin
    if (io_global_sresetn) begin
      _T_3 <= 2'h0;
    end else if (_T_4) begin
      _T_3 <= 2'h1;
    end else if (_T_5) begin
      if (_T_6) begin
        _T_3 <= 2'h2;
      end
    end else if (_T_7) begin
      if (_T_8) begin
        _T_3 <= 2'h1;
      end else if (_T_1) begin
        _T_3 <= 2'h3;
      end
    end else if (_T_10) begin
      if (_T_2) begin
        _T_3 <= 2'h1;
      end
    end
  end
  always @(posedge io_global_pclk or posedge io_global_presetn) begin
    if (io_global_presetn) begin
      _T_21 <= 2'h0;
    end else if (_T_24) begin
      _T_21 <= 2'h1;
    end else if (_T_25) begin
      if (_T_23) begin
        _T_21 <= 2'h2;
      end
    end else if (_T_27) begin
      if (_T_28) begin
        _T_21 <= 2'h3;
      end
    end else if (_T_29) begin
      if (_T_30) begin
        _T_21 <= 2'h1;
      end
    end
  end
endmodule
