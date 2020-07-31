module Hssync(
  input        io_global_pclk,
  input        io_global_presetn,
  input        io_global_sclk,
  input        io_global_sresetn,
  input  [7:0] io_master_key_curinfo,
  input        io_master_key_vld,
  output       io_master_key_ack,
  output [7:0] io_slave_key_curinfo,
  output       io_slave_key_vld,
  input        io_slave_key_ack
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
  wire  _T_7; // @[Conditional.scala 37:30]
  wire  _T_8; // @[Hssync.scala 32:14]
  wire  _T_10; // @[Conditional.scala 37:30]
  wire  _T_11; // @[Hssync.scala 44:26]
  wire  _T_13; // @[Hssync.scala 44:42]
  wire  _T_14; // @[Hssync.scala 45:30]
  wire  _T_16; // @[Hssync.scala 45:46]
  reg [1:0] _T_21; // @[Hssync.scala 53:27]
  reg [31:0] _RAND_3;
  reg  _T_22; // @[Hssync.scala 54:28]
  reg [31:0] _RAND_4;
  reg  _T_23; // @[Hssync.scala 55:30]
  reg [31:0] _RAND_5;
  wire  _T_24; // @[Conditional.scala 37:30]
  wire  _T_25; // @[Conditional.scala 37:30]
  wire  _T_27; // @[Conditional.scala 37:30]
  wire  _T_29; // @[Conditional.scala 37:30]
  wire  _T_30; // @[Hssync.scala 67:14]
  wire  _T_31; // @[Hssync.scala 70:34]
  wire  _T_32; // @[Hssync.scala 70:63]
  wire  _T_34; // @[Hssync.scala 70:79]
  wire  _T_36; // @[Hssync.scala 71:26]
  assign _T_2 = _T_1 == 1'h0; // @[Hssync.scala 21:23]
  assign _T_4 = 2'h0 == _T_3; // @[Conditional.scala 37:30]
  assign _T_5 = 2'h1 == _T_3; // @[Conditional.scala 37:30]
  assign _T_7 = 2'h2 == _T_3; // @[Conditional.scala 37:30]
  assign _T_8 = io_master_key_vld == 1'h0; // @[Hssync.scala 32:14]
  assign _T_10 = 2'h3 == _T_3; // @[Conditional.scala 37:30]
  assign _T_11 = _T_3 == 2'h1; // @[Hssync.scala 44:26]
  assign _T_13 = _T_11 & io_master_key_vld; // @[Hssync.scala 44:42]
  assign _T_14 = _T_3 == 2'h2; // @[Hssync.scala 45:30]
  assign _T_16 = _T_14 & _T_2; // @[Hssync.scala 45:46]
  assign _T_24 = 2'h0 == _T_21; // @[Conditional.scala 37:30]
  assign _T_25 = 2'h1 == _T_21; // @[Conditional.scala 37:30]
  assign _T_27 = 2'h2 == _T_21; // @[Conditional.scala 37:30]
  assign _T_29 = 2'h3 == _T_21; // @[Conditional.scala 37:30]
  assign _T_30 = _T_23 == 1'h0; // @[Hssync.scala 67:14]
  assign _T_31 = _T_21 == 2'h2; // @[Hssync.scala 70:34]
  assign _T_32 = _T_21 == 2'h1; // @[Hssync.scala 70:63]
  assign _T_34 = _T_32 & _T_23; // @[Hssync.scala 70:79]
  assign _T_36 = _T_21 == 2'h3; // @[Hssync.scala 71:26]
  assign io_master_key_ack = _T_14 & _T_1; // @[Hssync.scala 47:23]
  assign io_slave_key_curinfo = io_master_key_curinfo; // @[Hssync.scala 74:24]
  assign io_slave_key_vld = _T_31 | _T_34; // @[Hssync.scala 70:22]
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
      if (io_master_key_vld) begin
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
      if (io_slave_key_ack) begin
        _T_21 <= 2'h3;
      end
    end else if (_T_29) begin
      if (_T_30) begin
        _T_21 <= 2'h1;
      end
    end
  end
endmodule
module Regfile(
  input         clock,
  input         reset,
  input         io_apb_psel,
  input         io_apb_pwrite,
  input         io_apb_penable,
  input  [5:0]  io_apb_paddr,
  input  [31:0] io_apb_pwdata,
  output [31:0] io_apb_prdata,
  output        io_apb_irq,
  input  [7:0]  io_hs_key_curinfo,
  input         io_hs_key_vld,
  output        io_hs_key_ack,
  output        io_ctl_ksen,
  output        io_ctl_wken,
  output [7:0]  io_ctl_key_preinfo,
  output [25:0] io_ctl_ioen,
  output        io_ctl_pol,
  output [3:0]  io_ctl_deb_value,
  output [3:0]  io_ctl_rintval_value,
  output [3:0]  io_ctl_sintval_value,
  input  [4:0]  io_ctl_cyc_value,
  input         io_ctl_ctl_int
);
  reg  key_vld_d; // @[Regfile.scala 20:28]
  reg [31:0] _RAND_0;
  reg  key_vld_dd; // @[Regfile.scala 21:29]
  reg [31:0] _RAND_1;
  reg  key_ack; // @[Regfile.scala 22:26]
  reg [31:0] _RAND_2;
  wire  _T; // @[Regfile.scala 23:33]
  wire  key_vld_r; // @[Regfile.scala 23:42]
  reg  ctl_int_d; // @[Regfile.scala 35:28]
  reg [31:0] _RAND_3;
  reg  ctl_int_dd; // @[Regfile.scala 36:29]
  reg [31:0] _RAND_4;
  reg  ctl_int_ddd; // @[Regfile.scala 37:30]
  reg [31:0] _RAND_5;
  reg  ctl_int_r; // @[Regfile.scala 38:28]
  reg [31:0] _RAND_6;
  wire  _T_2; // @[Regfile.scala 39:18]
  wire  _T_5; // @[Regfile.scala 54:30]
  wire  wr_en; // @[Regfile.scala 54:47]
  wire  _T_6; // @[Regfile.scala 55:32]
  wire  _T_7; // @[Regfile.scala 55:29]
  wire  _T_8; // @[Regfile.scala 55:52]
  wire  rd_en; // @[Regfile.scala 55:49]
  wire  _T_9; // @[Regfile.scala 58:30]
  wire  ks_en_wr; // @[Regfile.scala 58:39]
  reg  ks_en; // @[Regfile.scala 59:25]
  reg [31:0] _RAND_7;
  reg  wk_en; // @[Regfile.scala 60:25]
  reg [31:0] _RAND_8;
  wire  _T_11; // @[Regfile.scala 62:29]
  wire  _T_12; // @[Regfile.scala 63:29]
  wire  _T_14; // @[Regfile.scala 64:36]
  wire  _T_15; // @[Regfile.scala 64:32]
  wire [31:0] ks_en_bus; // @[Cat.scala 29:58]
  wire  _T_17; // @[Regfile.scala 69:31]
  wire  io_cfg_wr; // @[Regfile.scala 69:40]
  reg [17:0] ksoe; // @[Regfile.scala 70:24]
  reg [31:0] _RAND_9;
  reg [7:0] ksie; // @[Regfile.scala 71:24]
  reg [31:0] _RAND_10;
  wire [17:0] _T_19; // @[Regfile.scala 73:28]
  wire [7:0] _T_20; // @[Regfile.scala 74:28]
  wire [31:0] io_cfg_bus; // @[Cat.scala 29:58]
  wire  _T_22; // @[Regfile.scala 78:32]
  wire  int_cfg_wr; // @[Regfile.scala 78:41]
  reg  int_en; // @[Regfile.scala 79:26]
  reg [31:0] _RAND_11;
  reg  ksf; // @[Regfile.scala 80:23]
  reg [31:0] _RAND_12;
  reg  ksif; // @[Regfile.scala 81:24]
  reg [31:0] _RAND_13;
  wire  _T_27; // @[Regfile.scala 85:29]
  wire  _T_29; // @[Regfile.scala 86:14]
  wire  _GEN_7; // @[Regfile.scala 87:35]
  wire  _T_32; // @[Regfile.scala 90:45]
  wire  _T_33; // @[Regfile.scala 90:29]
  wire  _T_35; // @[Regfile.scala 91:15]
  wire [31:0] int_cfg_bus; // @[Cat.scala 29:58]
  wire  _T_39; // @[Regfile.scala 97:30]
  wire  ks_cfg_wr; // @[Regfile.scala 97:39]
  reg  pol; // @[Regfile.scala 98:23]
  reg [31:0] _RAND_14;
  reg  clr_key; // @[Regfile.scala 99:27]
  reg [31:0] _RAND_15;
  reg [3:0] sintval_value; // @[Regfile.scala 100:33]
  reg [31:0] _RAND_16;
  reg [3:0] rintval_value; // @[Regfile.scala 101:33]
  reg [31:0] _RAND_17;
  reg [3:0] deb_value; // @[Regfile.scala 102:29]
  reg [31:0] _RAND_18;
  wire  _T_41; // @[Regfile.scala 104:27]
  wire  _T_42; // @[Regfile.scala 105:31]
  wire [3:0] _T_43; // @[Regfile.scala 106:37]
  wire [3:0] _T_44; // @[Regfile.scala 107:37]
  wire [3:0] _T_45; // @[Regfile.scala 108:33]
  wire [31:0] ks_cfg_bus; // @[Cat.scala 29:58]
  reg [7:0] rows_0; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_19;
  wire  _T_51; // @[Regfile.scala 119:36]
  wire  _T_53; // @[Regfile.scala 119:45]
  reg [7:0] rows_1; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_20;
  wire  _T_55; // @[Regfile.scala 119:36]
  wire  _T_57; // @[Regfile.scala 119:45]
  reg [7:0] rows_2; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_21;
  wire  _T_59; // @[Regfile.scala 119:36]
  wire  _T_61; // @[Regfile.scala 119:45]
  reg [7:0] rows_3; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_22;
  wire  _T_63; // @[Regfile.scala 119:36]
  wire  _T_65; // @[Regfile.scala 119:45]
  reg [7:0] rows_4; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_23;
  wire  _T_67; // @[Regfile.scala 119:36]
  wire  _T_69; // @[Regfile.scala 119:45]
  reg [7:0] rows_5; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_24;
  wire  _T_71; // @[Regfile.scala 119:36]
  wire  _T_73; // @[Regfile.scala 119:45]
  reg [7:0] rows_6; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_25;
  wire  _T_75; // @[Regfile.scala 119:36]
  wire  _T_77; // @[Regfile.scala 119:45]
  reg [7:0] rows_7; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_26;
  wire  _T_79; // @[Regfile.scala 119:36]
  wire  _T_81; // @[Regfile.scala 119:45]
  reg [7:0] rows_8; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_27;
  wire  _T_83; // @[Regfile.scala 119:36]
  wire  _T_85; // @[Regfile.scala 119:45]
  reg [7:0] rows_9; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_28;
  wire  _T_87; // @[Regfile.scala 119:36]
  wire  _T_89; // @[Regfile.scala 119:45]
  reg [7:0] rows_10; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_29;
  wire  _T_91; // @[Regfile.scala 119:36]
  wire  _T_93; // @[Regfile.scala 119:45]
  reg [7:0] rows_11; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_30;
  wire  _T_95; // @[Regfile.scala 119:36]
  wire  _T_97; // @[Regfile.scala 119:45]
  reg [7:0] rows_12; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_31;
  wire  _T_99; // @[Regfile.scala 119:36]
  wire  _T_101; // @[Regfile.scala 119:45]
  reg [7:0] rows_13; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_32;
  wire  _T_103; // @[Regfile.scala 119:36]
  wire  _T_105; // @[Regfile.scala 119:45]
  reg [7:0] rows_14; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_33;
  wire  _T_107; // @[Regfile.scala 119:36]
  wire  _T_109; // @[Regfile.scala 119:45]
  reg [7:0] rows_15; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_34;
  wire  _T_111; // @[Regfile.scala 119:36]
  wire  _T_113; // @[Regfile.scala 119:45]
  reg [7:0] rows_16; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_35;
  wire  _T_115; // @[Regfile.scala 119:36]
  wire  _T_117; // @[Regfile.scala 119:45]
  reg [7:0] rows_17; // @[Regfile.scala 116:23]
  reg [31:0] _RAND_36;
  wire  _T_119; // @[Regfile.scala 119:36]
  wire  _T_121; // @[Regfile.scala 119:45]
  wire [31:0] ks_info0_bus; // @[Cat.scala 29:58]
  wire [31:0] ks_info1_bus; // @[Cat.scala 29:58]
  wire [31:0] ks_info2_bus; // @[Cat.scala 29:58]
  wire [31:0] ks_info3_bus; // @[Cat.scala 29:58]
  wire [31:0] ks_info4_bus; // @[Cat.scala 29:58]
  wire  _T_135; // @[Regfile.scala 135:16]
  wire  _T_136; // @[Regfile.scala 136:16]
  wire  _T_137; // @[Regfile.scala 137:16]
  wire  _T_138; // @[Regfile.scala 138:16]
  wire  _T_139; // @[Regfile.scala 139:16]
  reg [31:0] prdata_d; // @[Regfile.scala 140:27]
  reg [31:0] _RAND_37;
  wire  _T_149; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_0; // @[Regfile.scala 147:48]
  wire  _T_150; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_1; // @[Regfile.scala 147:48]
  wire  _T_151; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_2; // @[Regfile.scala 147:48]
  wire  _T_152; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_3; // @[Regfile.scala 147:48]
  wire  _T_153; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_4; // @[Regfile.scala 147:48]
  wire  _T_154; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_5; // @[Regfile.scala 147:48]
  wire  _T_155; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_6; // @[Regfile.scala 147:48]
  wire  _T_156; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_7; // @[Regfile.scala 147:48]
  wire  _T_157; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_8; // @[Regfile.scala 147:48]
  wire  _T_158; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_9; // @[Regfile.scala 147:48]
  wire  _T_159; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_10; // @[Regfile.scala 147:48]
  wire  _T_160; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_11; // @[Regfile.scala 147:48]
  wire  _T_161; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_12; // @[Regfile.scala 147:48]
  wire  _T_162; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_13; // @[Regfile.scala 147:48]
  wire  _T_163; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_14; // @[Regfile.scala 147:48]
  wire  _T_164; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_15; // @[Regfile.scala 147:48]
  wire  _T_165; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_16; // @[Regfile.scala 147:48]
  wire  _T_166; // @[Regfile.scala 147:53]
  wire [7:0] sel_rows_17; // @[Regfile.scala 147:48]
  wire [7:0] _T_167; // @[Mux.scala 87:16]
  wire [7:0] _T_168; // @[Mux.scala 87:16]
  wire [7:0] _T_169; // @[Mux.scala 87:16]
  wire [7:0] _T_170; // @[Mux.scala 87:16]
  wire [7:0] _T_171; // @[Mux.scala 87:16]
  wire [7:0] _T_172; // @[Mux.scala 87:16]
  wire [7:0] _T_173; // @[Mux.scala 87:16]
  wire [7:0] _T_174; // @[Mux.scala 87:16]
  wire [7:0] _T_175; // @[Mux.scala 87:16]
  wire [7:0] _T_176; // @[Mux.scala 87:16]
  wire [7:0] _T_177; // @[Mux.scala 87:16]
  wire [7:0] _T_178; // @[Mux.scala 87:16]
  wire [7:0] _T_179; // @[Mux.scala 87:16]
  wire [7:0] _T_180; // @[Mux.scala 87:16]
  wire [7:0] _T_181; // @[Mux.scala 87:16]
  wire [7:0] _T_182; // @[Mux.scala 87:16]
  wire [7:0] _T_183; // @[Mux.scala 87:16]
  wire [7:0] key_info; // @[Mux.scala 87:16]
  assign _T = key_vld_dd == 1'h0; // @[Regfile.scala 23:33]
  assign key_vld_r = _T & key_vld_d; // @[Regfile.scala 23:42]
  assign _T_2 = ctl_int_ddd == 1'h0; // @[Regfile.scala 39:18]
  assign _T_5 = io_apb_psel & io_apb_penable; // @[Regfile.scala 54:30]
  assign wr_en = _T_5 & io_apb_pwrite; // @[Regfile.scala 54:47]
  assign _T_6 = io_apb_penable == 1'h0; // @[Regfile.scala 55:32]
  assign _T_7 = io_apb_psel & _T_6; // @[Regfile.scala 55:29]
  assign _T_8 = io_apb_pwrite == 1'h0; // @[Regfile.scala 55:52]
  assign rd_en = _T_7 & _T_8; // @[Regfile.scala 55:49]
  assign _T_9 = io_apb_paddr == 6'h0; // @[Regfile.scala 58:30]
  assign ks_en_wr = _T_9 & wr_en; // @[Regfile.scala 58:39]
  assign _T_11 = io_apb_pwdata[0]; // @[Regfile.scala 62:29]
  assign _T_12 = io_apb_pwdata[1]; // @[Regfile.scala 63:29]
  assign _T_14 = wk_en == 1'h0; // @[Regfile.scala 64:36]
  assign _T_15 = ctl_int_r & _T_14; // @[Regfile.scala 64:32]
  assign ks_en_bus = {30'h0,wk_en,ks_en}; // @[Cat.scala 29:58]
  assign _T_17 = io_apb_paddr == 6'h1; // @[Regfile.scala 69:31]
  assign io_cfg_wr = _T_17 & wr_en; // @[Regfile.scala 69:40]
  assign _T_19 = io_apb_pwdata[25:8]; // @[Regfile.scala 73:28]
  assign _T_20 = io_apb_pwdata[7:0]; // @[Regfile.scala 74:28]
  assign io_cfg_bus = {6'h0,ksoe,ksie}; // @[Cat.scala 29:58]
  assign _T_22 = io_apb_paddr == 6'h2; // @[Regfile.scala 78:32]
  assign int_cfg_wr = _T_22 & wr_en; // @[Regfile.scala 78:41]
  assign _T_27 = int_cfg_wr & _T_12; // @[Regfile.scala 85:29]
  assign _T_29 = ~ _T_12; // @[Regfile.scala 86:14]
  assign _GEN_7 = ctl_int_r | ksf; // @[Regfile.scala 87:35]
  assign _T_32 = io_apb_pwdata[2]; // @[Regfile.scala 90:45]
  assign _T_33 = int_cfg_wr & _T_32; // @[Regfile.scala 90:29]
  assign _T_35 = ~ _T_32; // @[Regfile.scala 91:15]
  assign int_cfg_bus = {29'h0,ksif,ksf,int_en}; // @[Cat.scala 29:58]
  assign _T_39 = io_apb_paddr == 6'h3; // @[Regfile.scala 97:30]
  assign ks_cfg_wr = _T_39 & wr_en; // @[Regfile.scala 97:39]
  assign _T_41 = io_apb_pwdata[13]; // @[Regfile.scala 104:27]
  assign _T_42 = io_apb_pwdata[12]; // @[Regfile.scala 105:31]
  assign _T_43 = io_apb_pwdata[11:8]; // @[Regfile.scala 106:37]
  assign _T_44 = io_apb_pwdata[7:4]; // @[Regfile.scala 107:37]
  assign _T_45 = io_apb_pwdata[3:0]; // @[Regfile.scala 108:33]
  assign ks_cfg_bus = {18'h0,pol,clr_key,sintval_value,rintval_value,deb_value}; // @[Cat.scala 29:58]
  assign _T_51 = io_ctl_cyc_value == 5'h0; // @[Regfile.scala 119:36]
  assign _T_53 = _T_51 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_55 = io_ctl_cyc_value == 5'h1; // @[Regfile.scala 119:36]
  assign _T_57 = _T_55 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_59 = io_ctl_cyc_value == 5'h2; // @[Regfile.scala 119:36]
  assign _T_61 = _T_59 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_63 = io_ctl_cyc_value == 5'h3; // @[Regfile.scala 119:36]
  assign _T_65 = _T_63 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_67 = io_ctl_cyc_value == 5'h4; // @[Regfile.scala 119:36]
  assign _T_69 = _T_67 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_71 = io_ctl_cyc_value == 5'h5; // @[Regfile.scala 119:36]
  assign _T_73 = _T_71 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_75 = io_ctl_cyc_value == 5'h6; // @[Regfile.scala 119:36]
  assign _T_77 = _T_75 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_79 = io_ctl_cyc_value == 5'h7; // @[Regfile.scala 119:36]
  assign _T_81 = _T_79 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_83 = io_ctl_cyc_value == 5'h8; // @[Regfile.scala 119:36]
  assign _T_85 = _T_83 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_87 = io_ctl_cyc_value == 5'h9; // @[Regfile.scala 119:36]
  assign _T_89 = _T_87 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_91 = io_ctl_cyc_value == 5'ha; // @[Regfile.scala 119:36]
  assign _T_93 = _T_91 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_95 = io_ctl_cyc_value == 5'hb; // @[Regfile.scala 119:36]
  assign _T_97 = _T_95 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_99 = io_ctl_cyc_value == 5'hc; // @[Regfile.scala 119:36]
  assign _T_101 = _T_99 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_103 = io_ctl_cyc_value == 5'hd; // @[Regfile.scala 119:36]
  assign _T_105 = _T_103 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_107 = io_ctl_cyc_value == 5'he; // @[Regfile.scala 119:36]
  assign _T_109 = _T_107 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_111 = io_ctl_cyc_value == 5'hf; // @[Regfile.scala 119:36]
  assign _T_113 = _T_111 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_115 = io_ctl_cyc_value == 5'h10; // @[Regfile.scala 119:36]
  assign _T_117 = _T_115 & key_vld_r; // @[Regfile.scala 119:45]
  assign _T_119 = io_ctl_cyc_value == 5'h11; // @[Regfile.scala 119:36]
  assign _T_121 = _T_119 & key_vld_r; // @[Regfile.scala 119:45]
  assign ks_info0_bus = {rows_3,rows_2,rows_1,rows_0}; // @[Cat.scala 29:58]
  assign ks_info1_bus = {rows_7,rows_6,rows_5,rows_4}; // @[Cat.scala 29:58]
  assign ks_info2_bus = {rows_11,rows_10,rows_9,rows_8}; // @[Cat.scala 29:58]
  assign ks_info3_bus = {rows_15,rows_14,rows_13,rows_12}; // @[Cat.scala 29:58]
  assign ks_info4_bus = {16'h0,rows_17,rows_16}; // @[Cat.scala 29:58]
  assign _T_135 = io_apb_paddr == 6'h4; // @[Regfile.scala 135:16]
  assign _T_136 = io_apb_paddr == 6'h5; // @[Regfile.scala 136:16]
  assign _T_137 = io_apb_paddr == 6'h6; // @[Regfile.scala 137:16]
  assign _T_138 = io_apb_paddr == 6'h7; // @[Regfile.scala 138:16]
  assign _T_139 = io_apb_paddr == 6'h8; // @[Regfile.scala 139:16]
  assign _T_149 = ksoe[0]; // @[Regfile.scala 147:53]
  assign sel_rows_0 = _T_149 ? rows_0 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_150 = ksoe[1]; // @[Regfile.scala 147:53]
  assign sel_rows_1 = _T_150 ? rows_1 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_151 = ksoe[2]; // @[Regfile.scala 147:53]
  assign sel_rows_2 = _T_151 ? rows_2 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_152 = ksoe[3]; // @[Regfile.scala 147:53]
  assign sel_rows_3 = _T_152 ? rows_3 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_153 = ksoe[4]; // @[Regfile.scala 147:53]
  assign sel_rows_4 = _T_153 ? rows_4 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_154 = ksoe[5]; // @[Regfile.scala 147:53]
  assign sel_rows_5 = _T_154 ? rows_5 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_155 = ksoe[6]; // @[Regfile.scala 147:53]
  assign sel_rows_6 = _T_155 ? rows_6 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_156 = ksoe[7]; // @[Regfile.scala 147:53]
  assign sel_rows_7 = _T_156 ? rows_7 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_157 = ksoe[8]; // @[Regfile.scala 147:53]
  assign sel_rows_8 = _T_157 ? rows_8 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_158 = ksoe[9]; // @[Regfile.scala 147:53]
  assign sel_rows_9 = _T_158 ? rows_9 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_159 = ksoe[10]; // @[Regfile.scala 147:53]
  assign sel_rows_10 = _T_159 ? rows_10 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_160 = ksoe[11]; // @[Regfile.scala 147:53]
  assign sel_rows_11 = _T_160 ? rows_11 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_161 = ksoe[12]; // @[Regfile.scala 147:53]
  assign sel_rows_12 = _T_161 ? rows_12 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_162 = ksoe[13]; // @[Regfile.scala 147:53]
  assign sel_rows_13 = _T_162 ? rows_13 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_163 = ksoe[14]; // @[Regfile.scala 147:53]
  assign sel_rows_14 = _T_163 ? rows_14 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_164 = ksoe[15]; // @[Regfile.scala 147:53]
  assign sel_rows_15 = _T_164 ? rows_15 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_165 = ksoe[16]; // @[Regfile.scala 147:53]
  assign sel_rows_16 = _T_165 ? rows_16 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_166 = ksoe[17]; // @[Regfile.scala 147:53]
  assign sel_rows_17 = _T_166 ? rows_17 : 8'h0; // @[Regfile.scala 147:48]
  assign _T_167 = _T_119 ? sel_rows_17 : 8'h0; // @[Mux.scala 87:16]
  assign _T_168 = _T_115 ? sel_rows_16 : _T_167; // @[Mux.scala 87:16]
  assign _T_169 = _T_111 ? sel_rows_15 : _T_168; // @[Mux.scala 87:16]
  assign _T_170 = _T_107 ? sel_rows_14 : _T_169; // @[Mux.scala 87:16]
  assign _T_171 = _T_103 ? sel_rows_13 : _T_170; // @[Mux.scala 87:16]
  assign _T_172 = _T_99 ? sel_rows_12 : _T_171; // @[Mux.scala 87:16]
  assign _T_173 = _T_95 ? sel_rows_11 : _T_172; // @[Mux.scala 87:16]
  assign _T_174 = _T_91 ? sel_rows_10 : _T_173; // @[Mux.scala 87:16]
  assign _T_175 = _T_87 ? sel_rows_9 : _T_174; // @[Mux.scala 87:16]
  assign _T_176 = _T_83 ? sel_rows_8 : _T_175; // @[Mux.scala 87:16]
  assign _T_177 = _T_79 ? sel_rows_7 : _T_176; // @[Mux.scala 87:16]
  assign _T_178 = _T_75 ? sel_rows_6 : _T_177; // @[Mux.scala 87:16]
  assign _T_179 = _T_71 ? sel_rows_5 : _T_178; // @[Mux.scala 87:16]
  assign _T_180 = _T_67 ? sel_rows_4 : _T_179; // @[Mux.scala 87:16]
  assign _T_181 = _T_63 ? sel_rows_3 : _T_180; // @[Mux.scala 87:16]
  assign _T_182 = _T_59 ? sel_rows_2 : _T_181; // @[Mux.scala 87:16]
  assign _T_183 = _T_55 ? sel_rows_1 : _T_182; // @[Mux.scala 87:16]
  assign key_info = _T_51 ? sel_rows_0 : _T_183; // @[Mux.scala 87:16]
  assign io_apb_prdata = prdata_d; // @[Regfile.scala 144:19]
  assign io_apb_irq = ctl_int_r; // @[Regfile.scala 40:16]
  assign io_hs_key_ack = key_ack; // @[Regfile.scala 29:19]
  assign io_ctl_ksen = ks_en; // @[Regfile.scala 156:15]
  assign io_ctl_wken = wk_en; // @[Regfile.scala 155:15]
  assign io_ctl_key_preinfo = key_info & ksie; // @[Regfile.scala 154:22]
  assign io_ctl_ioen = {ksoe,ksie}; // @[Regfile.scala 157:15]
  assign io_ctl_pol = pol; // @[Regfile.scala 158:14]
  assign io_ctl_deb_value = deb_value; // @[Regfile.scala 159:20]
  assign io_ctl_rintval_value = rintval_value; // @[Regfile.scala 160:24]
  assign io_ctl_sintval_value = sintval_value; // @[Regfile.scala 161:24]
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
  key_vld_d = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  key_vld_dd = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  key_ack = _RAND_2[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  ctl_int_d = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  ctl_int_dd = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  ctl_int_ddd = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  ctl_int_r = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  ks_en = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  wk_en = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  ksoe = _RAND_9[17:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  ksie = _RAND_10[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  int_en = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  ksf = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  ksif = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  pol = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  clr_key = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  sintval_value = _RAND_16[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  rintval_value = _RAND_17[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  deb_value = _RAND_18[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  rows_0 = _RAND_19[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  rows_1 = _RAND_20[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  rows_2 = _RAND_21[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  rows_3 = _RAND_22[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  rows_4 = _RAND_23[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  rows_5 = _RAND_24[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  rows_6 = _RAND_25[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  rows_7 = _RAND_26[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  rows_8 = _RAND_27[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  rows_9 = _RAND_28[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  rows_10 = _RAND_29[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  rows_11 = _RAND_30[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  rows_12 = _RAND_31[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  rows_13 = _RAND_32[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_33 = {1{`RANDOM}};
  rows_14 = _RAND_33[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_34 = {1{`RANDOM}};
  rows_15 = _RAND_34[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_35 = {1{`RANDOM}};
  rows_16 = _RAND_35[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_36 = {1{`RANDOM}};
  rows_17 = _RAND_36[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_37 = {1{`RANDOM}};
  prdata_d = _RAND_37[31:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  if (reset) begin
    key_ack = 1'h0;
  end
  if (reset) begin
    ctl_int_r = 1'h0;
  end
  if (reset) begin
    ks_en = 1'h0;
  end
  if (reset) begin
    wk_en = 1'h0;
  end
  if (reset) begin
    ksoe = 18'h0;
  end
  if (reset) begin
    ksie = 8'h0;
  end
  if (reset) begin
    int_en = 1'h0;
  end
  if (reset) begin
    ksf = 1'h0;
  end
  if (reset) begin
    ksif = 1'h0;
  end
  if (reset) begin
    pol = 1'h0;
  end
  if (reset) begin
    clr_key = 1'h0;
  end
  if (reset) begin
    sintval_value = 4'h8;
  end
  if (reset) begin
    rintval_value = 4'h0;
  end
  if (reset) begin
    deb_value = 4'h4;
  end
  if (reset) begin
    rows_0 = 8'h0;
  end
  if (reset) begin
    rows_1 = 8'h0;
  end
  if (reset) begin
    rows_2 = 8'h0;
  end
  if (reset) begin
    rows_3 = 8'h0;
  end
  if (reset) begin
    rows_4 = 8'h0;
  end
  if (reset) begin
    rows_5 = 8'h0;
  end
  if (reset) begin
    rows_6 = 8'h0;
  end
  if (reset) begin
    rows_7 = 8'h0;
  end
  if (reset) begin
    rows_8 = 8'h0;
  end
  if (reset) begin
    rows_9 = 8'h0;
  end
  if (reset) begin
    rows_10 = 8'h0;
  end
  if (reset) begin
    rows_11 = 8'h0;
  end
  if (reset) begin
    rows_12 = 8'h0;
  end
  if (reset) begin
    rows_13 = 8'h0;
  end
  if (reset) begin
    rows_14 = 8'h0;
  end
  if (reset) begin
    rows_15 = 8'h0;
  end
  if (reset) begin
    rows_16 = 8'h0;
  end
  if (reset) begin
    rows_17 = 8'h0;
  end
  if (reset) begin
    prdata_d = 32'h0;
  end
end
  always @(posedge clock) begin
    key_vld_d <= io_hs_key_vld;
    key_vld_dd <= key_vld_d;
    ctl_int_d <= io_ctl_ctl_int;
    ctl_int_dd <= ctl_int_d;
    ctl_int_ddd <= ctl_int_dd;
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      key_ack <= 1'h0;
    end else begin
      key_ack <= _T & key_vld_d;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ctl_int_r <= 1'h0;
    end else begin
      ctl_int_r <= _T_2 & ctl_int_dd;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ks_en <= 1'h0;
    end else if (ks_en_wr) begin
      ks_en <= _T_11;
    end else if (_T_15) begin
      ks_en <= 1'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      wk_en <= 1'h0;
    end else if (ks_en_wr) begin
      wk_en <= _T_12;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ksoe <= 18'h0;
    end else if (io_cfg_wr) begin
      ksoe <= _T_19;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ksie <= 8'h0;
    end else if (io_cfg_wr) begin
      ksie <= _T_20;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      int_en <= 1'h0;
    end else if (int_cfg_wr) begin
      int_en <= _T_11;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ksf <= 1'h0;
    end else if (_T_27) begin
      ksf <= _T_29;
    end else begin
      ksf <= _GEN_7;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ksif <= 1'h0;
    end else if (_T_33) begin
      ksif <= _T_35;
    end else if (ctl_int_r) begin
      ksif <= int_en;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      pol <= 1'h0;
    end else if (ks_cfg_wr) begin
      pol <= _T_41;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      clr_key <= 1'h0;
    end else begin
      clr_key <= ks_cfg_wr & _T_42;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      sintval_value <= 4'h8;
    end else if (ks_cfg_wr) begin
      sintval_value <= _T_43;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rintval_value <= 4'h0;
    end else if (ks_cfg_wr) begin
      rintval_value <= _T_44;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      deb_value <= 4'h4;
    end else if (ks_cfg_wr) begin
      deb_value <= _T_45;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_0 <= 8'h0;
    end else if (clr_key) begin
      rows_0 <= 8'h0;
    end else if (_T_53) begin
      rows_0 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_1 <= 8'h0;
    end else if (clr_key) begin
      rows_1 <= 8'h0;
    end else if (_T_57) begin
      rows_1 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_2 <= 8'h0;
    end else if (clr_key) begin
      rows_2 <= 8'h0;
    end else if (_T_61) begin
      rows_2 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_3 <= 8'h0;
    end else if (clr_key) begin
      rows_3 <= 8'h0;
    end else if (_T_65) begin
      rows_3 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_4 <= 8'h0;
    end else if (clr_key) begin
      rows_4 <= 8'h0;
    end else if (_T_69) begin
      rows_4 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_5 <= 8'h0;
    end else if (clr_key) begin
      rows_5 <= 8'h0;
    end else if (_T_73) begin
      rows_5 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_6 <= 8'h0;
    end else if (clr_key) begin
      rows_6 <= 8'h0;
    end else if (_T_77) begin
      rows_6 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_7 <= 8'h0;
    end else if (clr_key) begin
      rows_7 <= 8'h0;
    end else if (_T_81) begin
      rows_7 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_8 <= 8'h0;
    end else if (clr_key) begin
      rows_8 <= 8'h0;
    end else if (_T_85) begin
      rows_8 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_9 <= 8'h0;
    end else if (clr_key) begin
      rows_9 <= 8'h0;
    end else if (_T_89) begin
      rows_9 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_10 <= 8'h0;
    end else if (clr_key) begin
      rows_10 <= 8'h0;
    end else if (_T_93) begin
      rows_10 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_11 <= 8'h0;
    end else if (clr_key) begin
      rows_11 <= 8'h0;
    end else if (_T_97) begin
      rows_11 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_12 <= 8'h0;
    end else if (clr_key) begin
      rows_12 <= 8'h0;
    end else if (_T_101) begin
      rows_12 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_13 <= 8'h0;
    end else if (clr_key) begin
      rows_13 <= 8'h0;
    end else if (_T_105) begin
      rows_13 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_14 <= 8'h0;
    end else if (clr_key) begin
      rows_14 <= 8'h0;
    end else if (_T_109) begin
      rows_14 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_15 <= 8'h0;
    end else if (clr_key) begin
      rows_15 <= 8'h0;
    end else if (_T_113) begin
      rows_15 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_16 <= 8'h0;
    end else if (clr_key) begin
      rows_16 <= 8'h0;
    end else if (_T_117) begin
      rows_16 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rows_17 <= 8'h0;
    end else if (clr_key) begin
      rows_17 <= 8'h0;
    end else if (_T_121) begin
      rows_17 <= io_hs_key_curinfo;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      prdata_d <= 32'h0;
    end else if (rd_en) begin
      if (_T_9) begin
        prdata_d <= ks_en_bus;
      end else if (_T_17) begin
        prdata_d <= io_cfg_bus;
      end else if (_T_22) begin
        prdata_d <= int_cfg_bus;
      end else if (_T_39) begin
        prdata_d <= ks_cfg_bus;
      end else if (_T_135) begin
        prdata_d <= ks_info0_bus;
      end else if (_T_136) begin
        prdata_d <= ks_info1_bus;
      end else if (_T_137) begin
        prdata_d <= ks_info2_bus;
      end else if (_T_138) begin
        prdata_d <= ks_info3_bus;
      end else if (_T_139) begin
        prdata_d <= ks_info4_bus;
      end else begin
        prdata_d <= 32'h0;
      end
    end
  end
endmodule
module Ctl(
  input         clock,
  input         reset,
  output [7:0]  io_hs_key_curinfo,
  output        io_hs_key_vld,
  input         io_hs_key_ack,
  input         io_regfile_ksen,
  input         io_regfile_wken,
  input  [7:0]  io_regfile_key_preinfo,
  input  [25:0] io_regfile_ioen,
  input         io_regfile_pol,
  input  [3:0]  io_regfile_deb_value,
  input  [3:0]  io_regfile_rintval_value,
  input  [3:0]  io_regfile_sintval_value,
  output [4:0]  io_regfile_cyc_value,
  output        io_regfile_ctl_int,
  input  [7:0]  io_gpio_ks_in,
  output [17:0] io_gpio_ks_out,
  output [17:0] io_gpio_ks_oe
);
  reg [2:0] ks_state; // @[Ctl.scala 19:25]
  reg [31:0] _RAND_0;
  reg  key_vld; // @[Ctl.scala 26:24]
  reg [31:0] _RAND_1;
  reg [7:0] ks_in_d; // @[Ctl.scala 29:24]
  reg [31:0] _RAND_2;
  reg [7:0] ks_in_dd; // @[Ctl.scala 30:25]
  reg [31:0] _RAND_3;
  wire [17:0] out_en; // @[Ctl.scala 32:31]
  wire [7:0] in_en; // @[Ctl.scala 33:30]
  wire [7:0] _T; // @[Ctl.scala 39:45]
  wire [7:0] _T_1; // @[Ctl.scala 39:31]
  wire [7:0] ks_in_mask; // @[Ctl.scala 39:26]
  reg [17:0] cyc_cnt; // @[Ctl.scala 198:24]
  reg [31:0] _RAND_4;
  wire  _T_264; // @[Ctl.scala 224:15]
  wire [1:0] _T_265; // @[OneHot.scala 30:18]
  wire  _T_267; // @[OneHot.scala 32:14]
  wire [15:0] _T_266; // @[OneHot.scala 31:18]
  wire [15:0] _GEN_42; // @[OneHot.scala 32:28]
  wire [15:0] _T_268; // @[OneHot.scala 32:28]
  wire [7:0] _T_269; // @[OneHot.scala 30:18]
  wire  _T_271; // @[OneHot.scala 32:14]
  wire [7:0] _T_270; // @[OneHot.scala 31:18]
  wire [7:0] _T_272; // @[OneHot.scala 32:28]
  wire [3:0] _T_273; // @[OneHot.scala 30:18]
  wire  _T_275; // @[OneHot.scala 32:14]
  wire [3:0] _T_274; // @[OneHot.scala 31:18]
  wire [3:0] _T_276; // @[OneHot.scala 32:28]
  wire [1:0] _T_277; // @[OneHot.scala 30:18]
  wire  _T_279; // @[OneHot.scala 32:14]
  wire [1:0] _T_278; // @[OneHot.scala 31:18]
  wire [1:0] _T_280; // @[OneHot.scala 32:28]
  wire  _T_281; // @[CircuitMath.scala 30:8]
  wire [4:0] _T_285; // @[Cat.scala 29:58]
  wire [4:0] cyc_value; // @[Ctl.scala 224:22]
  wire  sel_cyc_value_0; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_1; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_2; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_3; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_4; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_5; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_6; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_7; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_8; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_9; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_10; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_11; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_12; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_13; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_14; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_15; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_16; // @[Ctl.scala 40:57]
  wire  sel_cyc_value_17; // @[Ctl.scala 40:57]
  wire  _T_2; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_0; // @[Ctl.scala 41:51]
  wire  _T_3; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_1; // @[Ctl.scala 41:51]
  wire  _T_4; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_2; // @[Ctl.scala 41:51]
  wire  _T_5; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_3; // @[Ctl.scala 41:51]
  wire  _T_6; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_4; // @[Ctl.scala 41:51]
  wire  _T_7; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_5; // @[Ctl.scala 41:51]
  wire  _T_8; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_6; // @[Ctl.scala 41:51]
  wire  _T_9; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_7; // @[Ctl.scala 41:51]
  wire  _T_10; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_8; // @[Ctl.scala 41:51]
  wire  _T_11; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_9; // @[Ctl.scala 41:51]
  wire  _T_12; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_10; // @[Ctl.scala 41:51]
  wire  _T_13; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_11; // @[Ctl.scala 41:51]
  wire  _T_14; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_12; // @[Ctl.scala 41:51]
  wire  _T_15; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_13; // @[Ctl.scala 41:51]
  wire  _T_16; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_14; // @[Ctl.scala 41:51]
  wire  _T_17; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_15; // @[Ctl.scala 41:51]
  wire  _T_18; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_16; // @[Ctl.scala 41:51]
  wire  _T_19; // @[Ctl.scala 41:58]
  wire [7:0] sel_ks_in_mask_17; // @[Ctl.scala 41:51]
  wire [7:0] _T_20; // @[Mux.scala 87:16]
  wire [7:0] _T_21; // @[Mux.scala 87:16]
  wire [7:0] _T_22; // @[Mux.scala 87:16]
  wire [7:0] _T_23; // @[Mux.scala 87:16]
  wire [7:0] _T_24; // @[Mux.scala 87:16]
  wire [7:0] _T_25; // @[Mux.scala 87:16]
  wire [7:0] _T_26; // @[Mux.scala 87:16]
  wire [7:0] _T_27; // @[Mux.scala 87:16]
  wire [7:0] _T_28; // @[Mux.scala 87:16]
  wire [7:0] _T_29; // @[Mux.scala 87:16]
  wire [7:0] _T_30; // @[Mux.scala 87:16]
  wire [7:0] _T_31; // @[Mux.scala 87:16]
  wire [7:0] _T_32; // @[Mux.scala 87:16]
  wire [7:0] _T_33; // @[Mux.scala 87:16]
  wire [7:0] _T_34; // @[Mux.scala 87:16]
  wire [7:0] _T_35; // @[Mux.scala 87:16]
  wire [7:0] _T_36; // @[Mux.scala 87:16]
  wire [7:0] key_cur_st; // @[Mux.scala 87:16]
  wire  _T_37; // @[Ctl.scala 43:33]
  reg [1:0] step_cnt; // @[Ctl.scala 125:25]
  reg [31:0] _RAND_5;
  wire  step_cnt_max; // @[Ctl.scala 131:27]
  wire  _T_38; // @[Ctl.scala 43:45]
  wire  _T_39; // @[Ctl.scala 43:72]
  wire  _T_40; // @[Ctl.scala 43:60]
  wire  key_change; // @[Ctl.scala 43:23]
  reg [7:0] key_cur_st_d; // @[Ctl.scala 44:29]
  reg [31:0] _RAND_6;
  wire  _T_41; // @[Ctl.scala 45:31]
  wire  _T_42; // @[Ctl.scala 45:54]
  wire  _T_43; // @[Ctl.scala 45:41]
  wire  key_pulse; // @[Ctl.scala 45:22]
  reg [17:0] f_ks_oe; // @[Ctl.scala 53:24]
  reg [31:0] _RAND_7;
  wire [16:0] _T_253; // @[Ctl.scala 199:31]
  wire  _T_254; // @[Ctl.scala 199:45]
  wire [17:0] cyc_cnt_shift; // @[Cat.scala 29:58]
  wire [17:0] m_ks_oe; // @[Ctl.scala 54:31]
  wire  _T_44; // @[Ctl.scala 55:17]
  wire  _T_45; // @[Ctl.scala 55:43]
  wire  _T_46; // @[Ctl.scala 55:32]
  wire  _T_236; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_11; // @[Ctl.scala 145:24]
  wire  _T_238; // @[Conditional.scala 37:30]
  wire  _T_239; // @[Ctl.scala 152:12]
  reg [15:0] sintval_cnt; // @[Ctl.scala 98:28]
  reg [31:0] _RAND_8;
  wire [15:0] sintval_cnt_max; // @[Ctl.scala 97:36]
  wire  sintval_finish; // @[Ctl.scala 106:32]
  wire [2:0] _GEN_12; // @[Ctl.scala 154:33]
  wire [2:0] _GEN_13; // @[Ctl.scala 152:19]
  wire  _T_240; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_14; // @[Ctl.scala 164:34]
  wire [2:0] _GEN_15; // @[Ctl.scala 163:31]
  wire [2:0] _GEN_16; // @[Ctl.scala 161:19]
  wire  _T_243; // @[Conditional.scala 37:30]
  reg [15:0] deb_cnt; // @[Ctl.scala 82:24]
  reg [31:0] _RAND_9;
  wire [15:0] deb_cnt_max; // @[Ctl.scala 81:32]
  wire  _T_212; // @[Ctl.scala 90:27]
  wire  _T_213; // @[Ctl.scala 90:46]
  wire  _T_214; // @[Ctl.scala 90:43]
  wire  _T_215; // @[Ctl.scala 90:73]
  wire  _T_216; // @[Ctl.scala 90:60]
  wire  valid_change; // @[Ctl.scala 90:57]
  wire  _T_245; // @[Ctl.scala 176:29]
  wire [2:0] _GEN_17; // @[Ctl.scala 176:54]
  wire [2:0] _GEN_18; // @[Ctl.scala 174:19]
  wire  _T_247; // @[Conditional.scala 37:30]
  wire  cnt_complt; // @[Ctl.scala 200:24]
  wire  _T_249; // @[Ctl.scala 185:31]
  wire  _T_250; // @[Ctl.scala 185:29]
  reg [3:0] rintval_cnt; // @[Ctl.scala 112:28]
  reg [31:0] _RAND_10;
  wire  rintval_finish; // @[Ctl.scala 120:33]
  wire  _T_252; // @[Ctl.scala 187:33]
  wire [2:0] _GEN_19; // @[Ctl.scala 187:44]
  wire [2:0] _GEN_20; // @[Ctl.scala 185:40]
  wire [2:0] _GEN_21; // @[Ctl.scala 183:19]
  wire [2:0] _GEN_22; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_23; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_24; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_25; // @[Conditional.scala 39:67]
  wire [2:0] n_ks_state; // @[Conditional.scala 40:58]
  wire  _T_47; // @[Ctl.scala 55:69]
  wire  _T_48; // @[Ctl.scala 55:55]
  wire  _T_49; // @[Ctl.scala 57:24]
  wire  _T_50; // @[Ctl.scala 57:52]
  wire  _T_51; // @[Ctl.scala 57:39]
  wire  _T_52; // @[Ctl.scala 57:76]
  wire  _T_53; // @[Ctl.scala 57:63]
  reg [17:0] f_ks_out; // @[Ctl.scala 67:25]
  reg [31:0] _RAND_11;
  wire  _T_55; // @[Ctl.scala 69:69]
  wire  _T_57; // @[Ctl.scala 69:73]
  wire  _T_58; // @[Ctl.scala 69:51]
  wire  _T_59; // @[Ctl.scala 69:92]
  wire  m_ks_out_0; // @[Ctl.scala 69:37]
  wire  _T_62; // @[Ctl.scala 69:69]
  wire  _T_64; // @[Ctl.scala 69:73]
  wire  _T_65; // @[Ctl.scala 69:51]
  wire  m_ks_out_1; // @[Ctl.scala 69:37]
  wire  _T_69; // @[Ctl.scala 69:69]
  wire  _T_71; // @[Ctl.scala 69:73]
  wire  _T_72; // @[Ctl.scala 69:51]
  wire  m_ks_out_2; // @[Ctl.scala 69:37]
  wire  _T_76; // @[Ctl.scala 69:69]
  wire  _T_78; // @[Ctl.scala 69:73]
  wire  _T_79; // @[Ctl.scala 69:51]
  wire  m_ks_out_3; // @[Ctl.scala 69:37]
  wire  _T_83; // @[Ctl.scala 69:69]
  wire  _T_85; // @[Ctl.scala 69:73]
  wire  _T_86; // @[Ctl.scala 69:51]
  wire  m_ks_out_4; // @[Ctl.scala 69:37]
  wire  _T_90; // @[Ctl.scala 69:69]
  wire  _T_92; // @[Ctl.scala 69:73]
  wire  _T_93; // @[Ctl.scala 69:51]
  wire  m_ks_out_5; // @[Ctl.scala 69:37]
  wire  _T_97; // @[Ctl.scala 69:69]
  wire  _T_99; // @[Ctl.scala 69:73]
  wire  _T_100; // @[Ctl.scala 69:51]
  wire  m_ks_out_6; // @[Ctl.scala 69:37]
  wire  _T_104; // @[Ctl.scala 69:69]
  wire  _T_106; // @[Ctl.scala 69:73]
  wire  _T_107; // @[Ctl.scala 69:51]
  wire  m_ks_out_7; // @[Ctl.scala 69:37]
  wire  _T_111; // @[Ctl.scala 69:69]
  wire  _T_113; // @[Ctl.scala 69:73]
  wire  _T_114; // @[Ctl.scala 69:51]
  wire  m_ks_out_8; // @[Ctl.scala 69:37]
  wire  _T_118; // @[Ctl.scala 69:69]
  wire  _T_120; // @[Ctl.scala 69:73]
  wire  _T_121; // @[Ctl.scala 69:51]
  wire  m_ks_out_9; // @[Ctl.scala 69:37]
  wire  _T_125; // @[Ctl.scala 69:69]
  wire  _T_127; // @[Ctl.scala 69:73]
  wire  _T_128; // @[Ctl.scala 69:51]
  wire  m_ks_out_10; // @[Ctl.scala 69:37]
  wire  _T_132; // @[Ctl.scala 69:69]
  wire  _T_134; // @[Ctl.scala 69:73]
  wire  _T_135; // @[Ctl.scala 69:51]
  wire  m_ks_out_11; // @[Ctl.scala 69:37]
  wire  _T_139; // @[Ctl.scala 69:69]
  wire  _T_141; // @[Ctl.scala 69:73]
  wire  _T_142; // @[Ctl.scala 69:51]
  wire  m_ks_out_12; // @[Ctl.scala 69:37]
  wire  _T_146; // @[Ctl.scala 69:69]
  wire  _T_148; // @[Ctl.scala 69:73]
  wire  _T_149; // @[Ctl.scala 69:51]
  wire  m_ks_out_13; // @[Ctl.scala 69:37]
  wire  _T_153; // @[Ctl.scala 69:69]
  wire  _T_155; // @[Ctl.scala 69:73]
  wire  _T_156; // @[Ctl.scala 69:51]
  wire  m_ks_out_14; // @[Ctl.scala 69:37]
  wire  _T_160; // @[Ctl.scala 69:69]
  wire  _T_162; // @[Ctl.scala 69:73]
  wire  _T_163; // @[Ctl.scala 69:51]
  wire  m_ks_out_15; // @[Ctl.scala 69:37]
  wire  _T_167; // @[Ctl.scala 69:69]
  wire  _T_169; // @[Ctl.scala 69:73]
  wire  _T_170; // @[Ctl.scala 69:51]
  wire  m_ks_out_16; // @[Ctl.scala 69:37]
  wire  _T_174; // @[Ctl.scala 69:69]
  wire  _T_176; // @[Ctl.scala 69:73]
  wire  _T_177; // @[Ctl.scala 69:51]
  wire  m_ks_out_17; // @[Ctl.scala 69:37]
  wire [8:0] _T_192; // @[Ctl.scala 71:32]
  wire [17:0] _T_201; // @[Ctl.scala 71:32]
  wire  _T_208; // @[Ctl.scala 85:35]
  wire  _T_209; // @[Ctl.scala 85:32]
  wire [15:0] _T_211; // @[Ctl.scala 86:24]
  wire  _T_220; // @[Ctl.scala 101:40]
  wire  _T_221; // @[Ctl.scala 101:37]
  wire [15:0] _T_223; // @[Ctl.scala 102:32]
  wire  _T_227; // @[Ctl.scala 115:36]
  wire  _T_228; // @[Ctl.scala 115:33]
  wire [3:0] _T_230; // @[Ctl.scala 116:31]
  wire [1:0] _T_234; // @[Ctl.scala 127:23]
  wire  _T_286; // @[Ctl.scala 236:24]
  wire  _T_287; // @[Ctl.scala 236:21]
  wire  _GEN_35; // @[Ctl.scala 238:33]
  reg [7:0] key_curinfo; // @[Ctl.scala 241:28]
  reg [31:0] _RAND_12;
  reg  int_trig; // @[Ctl.scala 251:25]
  reg [31:0] _RAND_13;
  wire  _T_291; // @[Ctl.scala 252:26]
  wire  _T_292; // @[Ctl.scala 254:22]
  wire  _T_294; // @[Ctl.scala 254:33]
  wire  _GEN_39; // @[Ctl.scala 254:59]
  reg  ctl_int; // @[Ctl.scala 257:24]
  reg [31:0] _RAND_14;
  assign out_en = io_regfile_ioen[25:8]; // @[Ctl.scala 32:31]
  assign in_en = io_regfile_ioen[7:0]; // @[Ctl.scala 33:30]
  assign _T = ~ ks_in_dd; // @[Ctl.scala 39:45]
  assign _T_1 = io_regfile_pol ? ks_in_dd : _T; // @[Ctl.scala 39:31]
  assign ks_in_mask = in_en & _T_1; // @[Ctl.scala 39:26]
  assign _T_264 = cyc_cnt == 18'h0; // @[Ctl.scala 224:15]
  assign _T_265 = cyc_cnt[17:16]; // @[OneHot.scala 30:18]
  assign _T_267 = _T_265 != 2'h0; // @[OneHot.scala 32:14]
  assign _T_266 = cyc_cnt[15:0]; // @[OneHot.scala 31:18]
  assign _GEN_42 = {{14'd0}, _T_265}; // @[OneHot.scala 32:28]
  assign _T_268 = _GEN_42 | _T_266; // @[OneHot.scala 32:28]
  assign _T_269 = _T_268[15:8]; // @[OneHot.scala 30:18]
  assign _T_271 = _T_269 != 8'h0; // @[OneHot.scala 32:14]
  assign _T_270 = _T_268[7:0]; // @[OneHot.scala 31:18]
  assign _T_272 = _T_269 | _T_270; // @[OneHot.scala 32:28]
  assign _T_273 = _T_272[7:4]; // @[OneHot.scala 30:18]
  assign _T_275 = _T_273 != 4'h0; // @[OneHot.scala 32:14]
  assign _T_274 = _T_272[3:0]; // @[OneHot.scala 31:18]
  assign _T_276 = _T_273 | _T_274; // @[OneHot.scala 32:28]
  assign _T_277 = _T_276[3:2]; // @[OneHot.scala 30:18]
  assign _T_279 = _T_277 != 2'h0; // @[OneHot.scala 32:14]
  assign _T_278 = _T_276[1:0]; // @[OneHot.scala 31:18]
  assign _T_280 = _T_277 | _T_278; // @[OneHot.scala 32:28]
  assign _T_281 = _T_280[1]; // @[CircuitMath.scala 30:8]
  assign _T_285 = {_T_267,_T_271,_T_275,_T_279,_T_281}; // @[Cat.scala 29:58]
  assign cyc_value = _T_264 ? 5'h0 : _T_285; // @[Ctl.scala 224:22]
  assign sel_cyc_value_0 = cyc_value == 5'h0; // @[Ctl.scala 40:57]
  assign sel_cyc_value_1 = cyc_value == 5'h1; // @[Ctl.scala 40:57]
  assign sel_cyc_value_2 = cyc_value == 5'h2; // @[Ctl.scala 40:57]
  assign sel_cyc_value_3 = cyc_value == 5'h3; // @[Ctl.scala 40:57]
  assign sel_cyc_value_4 = cyc_value == 5'h4; // @[Ctl.scala 40:57]
  assign sel_cyc_value_5 = cyc_value == 5'h5; // @[Ctl.scala 40:57]
  assign sel_cyc_value_6 = cyc_value == 5'h6; // @[Ctl.scala 40:57]
  assign sel_cyc_value_7 = cyc_value == 5'h7; // @[Ctl.scala 40:57]
  assign sel_cyc_value_8 = cyc_value == 5'h8; // @[Ctl.scala 40:57]
  assign sel_cyc_value_9 = cyc_value == 5'h9; // @[Ctl.scala 40:57]
  assign sel_cyc_value_10 = cyc_value == 5'ha; // @[Ctl.scala 40:57]
  assign sel_cyc_value_11 = cyc_value == 5'hb; // @[Ctl.scala 40:57]
  assign sel_cyc_value_12 = cyc_value == 5'hc; // @[Ctl.scala 40:57]
  assign sel_cyc_value_13 = cyc_value == 5'hd; // @[Ctl.scala 40:57]
  assign sel_cyc_value_14 = cyc_value == 5'he; // @[Ctl.scala 40:57]
  assign sel_cyc_value_15 = cyc_value == 5'hf; // @[Ctl.scala 40:57]
  assign sel_cyc_value_16 = cyc_value == 5'h10; // @[Ctl.scala 40:57]
  assign sel_cyc_value_17 = cyc_value == 5'h11; // @[Ctl.scala 40:57]
  assign _T_2 = out_en[0]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_0 = _T_2 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_3 = out_en[1]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_1 = _T_3 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_4 = out_en[2]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_2 = _T_4 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_5 = out_en[3]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_3 = _T_5 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_6 = out_en[4]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_4 = _T_6 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_7 = out_en[5]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_5 = _T_7 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_8 = out_en[6]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_6 = _T_8 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_9 = out_en[7]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_7 = _T_9 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_10 = out_en[8]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_8 = _T_10 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_11 = out_en[9]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_9 = _T_11 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_12 = out_en[10]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_10 = _T_12 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_13 = out_en[11]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_11 = _T_13 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_14 = out_en[12]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_12 = _T_14 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_15 = out_en[13]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_13 = _T_15 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_16 = out_en[14]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_14 = _T_16 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_17 = out_en[15]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_15 = _T_17 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_18 = out_en[16]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_16 = _T_18 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_19 = out_en[17]; // @[Ctl.scala 41:58]
  assign sel_ks_in_mask_17 = _T_19 ? ks_in_mask : 8'h0; // @[Ctl.scala 41:51]
  assign _T_20 = sel_cyc_value_17 ? sel_ks_in_mask_17 : 8'h0; // @[Mux.scala 87:16]
  assign _T_21 = sel_cyc_value_16 ? sel_ks_in_mask_16 : _T_20; // @[Mux.scala 87:16]
  assign _T_22 = sel_cyc_value_15 ? sel_ks_in_mask_15 : _T_21; // @[Mux.scala 87:16]
  assign _T_23 = sel_cyc_value_14 ? sel_ks_in_mask_14 : _T_22; // @[Mux.scala 87:16]
  assign _T_24 = sel_cyc_value_13 ? sel_ks_in_mask_13 : _T_23; // @[Mux.scala 87:16]
  assign _T_25 = sel_cyc_value_12 ? sel_ks_in_mask_12 : _T_24; // @[Mux.scala 87:16]
  assign _T_26 = sel_cyc_value_11 ? sel_ks_in_mask_11 : _T_25; // @[Mux.scala 87:16]
  assign _T_27 = sel_cyc_value_10 ? sel_ks_in_mask_10 : _T_26; // @[Mux.scala 87:16]
  assign _T_28 = sel_cyc_value_9 ? sel_ks_in_mask_9 : _T_27; // @[Mux.scala 87:16]
  assign _T_29 = sel_cyc_value_8 ? sel_ks_in_mask_8 : _T_28; // @[Mux.scala 87:16]
  assign _T_30 = sel_cyc_value_7 ? sel_ks_in_mask_7 : _T_29; // @[Mux.scala 87:16]
  assign _T_31 = sel_cyc_value_6 ? sel_ks_in_mask_6 : _T_30; // @[Mux.scala 87:16]
  assign _T_32 = sel_cyc_value_5 ? sel_ks_in_mask_5 : _T_31; // @[Mux.scala 87:16]
  assign _T_33 = sel_cyc_value_4 ? sel_ks_in_mask_4 : _T_32; // @[Mux.scala 87:16]
  assign _T_34 = sel_cyc_value_3 ? sel_ks_in_mask_3 : _T_33; // @[Mux.scala 87:16]
  assign _T_35 = sel_cyc_value_2 ? sel_ks_in_mask_2 : _T_34; // @[Mux.scala 87:16]
  assign _T_36 = sel_cyc_value_1 ? sel_ks_in_mask_1 : _T_35; // @[Mux.scala 87:16]
  assign key_cur_st = sel_cyc_value_0 ? sel_ks_in_mask_0 : _T_36; // @[Mux.scala 87:16]
  assign _T_37 = ks_state == 3'h2; // @[Ctl.scala 43:33]
  assign step_cnt_max = step_cnt == 2'h3; // @[Ctl.scala 131:27]
  assign _T_38 = _T_37 & step_cnt_max; // @[Ctl.scala 43:45]
  assign _T_39 = io_regfile_key_preinfo == key_cur_st; // @[Ctl.scala 43:72]
  assign _T_40 = _T_39 == 1'h0; // @[Ctl.scala 43:60]
  assign key_change = _T_38 & _T_40; // @[Ctl.scala 43:23]
  assign _T_41 = ks_state == 3'h3; // @[Ctl.scala 45:31]
  assign _T_42 = key_cur_st == key_cur_st_d; // @[Ctl.scala 45:54]
  assign _T_43 = _T_42 == 1'h0; // @[Ctl.scala 45:41]
  assign key_pulse = _T_41 & _T_43; // @[Ctl.scala 45:22]
  assign _T_253 = cyc_cnt[16:0]; // @[Ctl.scala 199:31]
  assign _T_254 = cyc_cnt[17]; // @[Ctl.scala 199:45]
  assign cyc_cnt_shift = {_T_253,_T_254}; // @[Cat.scala 29:58]
  assign m_ks_oe = cyc_cnt_shift & out_en; // @[Ctl.scala 54:31]
  assign _T_44 = ks_state == 3'h1; // @[Ctl.scala 55:17]
  assign _T_45 = ks_state == 3'h4; // @[Ctl.scala 55:43]
  assign _T_46 = _T_44 | _T_45; // @[Ctl.scala 55:32]
  assign _T_236 = 3'h0 == ks_state; // @[Conditional.scala 37:30]
  assign _GEN_11 = io_regfile_ksen ? 3'h1 : ks_state; // @[Ctl.scala 145:24]
  assign _T_238 = 3'h1 == ks_state; // @[Conditional.scala 37:30]
  assign _T_239 = io_regfile_ksen == 1'h0; // @[Ctl.scala 152:12]
  assign sintval_cnt_max = 16'h1 << io_regfile_sintval_value; // @[Ctl.scala 97:36]
  assign sintval_finish = sintval_cnt == sintval_cnt_max; // @[Ctl.scala 106:32]
  assign _GEN_12 = sintval_finish ? 3'h2 : ks_state; // @[Ctl.scala 154:33]
  assign _GEN_13 = _T_239 ? 3'h0 : _GEN_12; // @[Ctl.scala 152:19]
  assign _T_240 = 3'h2 == ks_state; // @[Conditional.scala 37:30]
  assign _GEN_14 = key_change ? 3'h3 : 3'h4; // @[Ctl.scala 164:34]
  assign _GEN_15 = step_cnt_max ? _GEN_14 : ks_state; // @[Ctl.scala 163:31]
  assign _GEN_16 = _T_239 ? 3'h0 : _GEN_15; // @[Ctl.scala 161:19]
  assign _T_243 = 3'h3 == ks_state; // @[Conditional.scala 37:30]
  assign deb_cnt_max = 16'h1 << io_regfile_deb_value; // @[Ctl.scala 81:32]
  assign _T_212 = deb_cnt == deb_cnt_max; // @[Ctl.scala 90:27]
  assign _T_213 = key_pulse == 1'h0; // @[Ctl.scala 90:46]
  assign _T_214 = _T_212 & _T_213; // @[Ctl.scala 90:43]
  assign _T_215 = key_cur_st == io_regfile_key_preinfo; // @[Ctl.scala 90:73]
  assign _T_216 = _T_215 == 1'h0; // @[Ctl.scala 90:60]
  assign valid_change = _T_214 & _T_216; // @[Ctl.scala 90:57]
  assign _T_245 = key_pulse | valid_change; // @[Ctl.scala 176:29]
  assign _GEN_17 = _T_245 ? 3'h4 : ks_state; // @[Ctl.scala 176:54]
  assign _GEN_18 = _T_239 ? 3'h0 : _GEN_17; // @[Ctl.scala 174:19]
  assign _T_247 = 3'h4 == ks_state; // @[Conditional.scala 37:30]
  assign cnt_complt = cyc_cnt == 18'h20000; // @[Ctl.scala 200:24]
  assign _T_249 = key_vld == 1'h0; // @[Ctl.scala 185:31]
  assign _T_250 = cnt_complt & _T_249; // @[Ctl.scala 185:29]
  assign rintval_finish = rintval_cnt == io_regfile_rintval_value; // @[Ctl.scala 120:33]
  assign _T_252 = rintval_finish & _T_249; // @[Ctl.scala 187:33]
  assign _GEN_19 = _T_252 ? 3'h2 : ks_state; // @[Ctl.scala 187:44]
  assign _GEN_20 = _T_250 ? 3'h1 : _GEN_19; // @[Ctl.scala 185:40]
  assign _GEN_21 = _T_239 ? 3'h0 : _GEN_20; // @[Ctl.scala 183:19]
  assign _GEN_22 = _T_247 ? _GEN_21 : 3'h0; // @[Conditional.scala 39:67]
  assign _GEN_23 = _T_243 ? _GEN_18 : _GEN_22; // @[Conditional.scala 39:67]
  assign _GEN_24 = _T_240 ? _GEN_16 : _GEN_23; // @[Conditional.scala 39:67]
  assign _GEN_25 = _T_238 ? _GEN_13 : _GEN_24; // @[Conditional.scala 39:67]
  assign n_ks_state = _T_236 ? _GEN_11 : _GEN_25; // @[Conditional.scala 40:58]
  assign _T_47 = n_ks_state == 3'h2; // @[Ctl.scala 55:69]
  assign _T_48 = _T_46 & _T_47; // @[Ctl.scala 55:55]
  assign _T_49 = n_ks_state == 3'h1; // @[Ctl.scala 57:24]
  assign _T_50 = n_ks_state == 3'h0; // @[Ctl.scala 57:52]
  assign _T_51 = _T_49 | _T_50; // @[Ctl.scala 57:39]
  assign _T_52 = n_ks_state == 3'h4; // @[Ctl.scala 57:76]
  assign _T_53 = _T_51 | _T_52; // @[Ctl.scala 57:63]
  assign _T_55 = cyc_cnt_shift[0]; // @[Ctl.scala 69:69]
  assign _T_57 = ~ _T_55; // @[Ctl.scala 69:73]
  assign _T_58 = io_regfile_pol ? _T_55 : _T_57; // @[Ctl.scala 69:51]
  assign _T_59 = ~ io_regfile_pol; // @[Ctl.scala 69:92]
  assign m_ks_out_0 = _T_2 ? _T_58 : _T_59; // @[Ctl.scala 69:37]
  assign _T_62 = cyc_cnt_shift[1]; // @[Ctl.scala 69:69]
  assign _T_64 = ~ _T_62; // @[Ctl.scala 69:73]
  assign _T_65 = io_regfile_pol ? _T_62 : _T_64; // @[Ctl.scala 69:51]
  assign m_ks_out_1 = _T_3 ? _T_65 : _T_59; // @[Ctl.scala 69:37]
  assign _T_69 = cyc_cnt_shift[2]; // @[Ctl.scala 69:69]
  assign _T_71 = ~ _T_69; // @[Ctl.scala 69:73]
  assign _T_72 = io_regfile_pol ? _T_69 : _T_71; // @[Ctl.scala 69:51]
  assign m_ks_out_2 = _T_4 ? _T_72 : _T_59; // @[Ctl.scala 69:37]
  assign _T_76 = cyc_cnt_shift[3]; // @[Ctl.scala 69:69]
  assign _T_78 = ~ _T_76; // @[Ctl.scala 69:73]
  assign _T_79 = io_regfile_pol ? _T_76 : _T_78; // @[Ctl.scala 69:51]
  assign m_ks_out_3 = _T_5 ? _T_79 : _T_59; // @[Ctl.scala 69:37]
  assign _T_83 = cyc_cnt_shift[4]; // @[Ctl.scala 69:69]
  assign _T_85 = ~ _T_83; // @[Ctl.scala 69:73]
  assign _T_86 = io_regfile_pol ? _T_83 : _T_85; // @[Ctl.scala 69:51]
  assign m_ks_out_4 = _T_6 ? _T_86 : _T_59; // @[Ctl.scala 69:37]
  assign _T_90 = cyc_cnt_shift[5]; // @[Ctl.scala 69:69]
  assign _T_92 = ~ _T_90; // @[Ctl.scala 69:73]
  assign _T_93 = io_regfile_pol ? _T_90 : _T_92; // @[Ctl.scala 69:51]
  assign m_ks_out_5 = _T_7 ? _T_93 : _T_59; // @[Ctl.scala 69:37]
  assign _T_97 = cyc_cnt_shift[6]; // @[Ctl.scala 69:69]
  assign _T_99 = ~ _T_97; // @[Ctl.scala 69:73]
  assign _T_100 = io_regfile_pol ? _T_97 : _T_99; // @[Ctl.scala 69:51]
  assign m_ks_out_6 = _T_8 ? _T_100 : _T_59; // @[Ctl.scala 69:37]
  assign _T_104 = cyc_cnt_shift[7]; // @[Ctl.scala 69:69]
  assign _T_106 = ~ _T_104; // @[Ctl.scala 69:73]
  assign _T_107 = io_regfile_pol ? _T_104 : _T_106; // @[Ctl.scala 69:51]
  assign m_ks_out_7 = _T_9 ? _T_107 : _T_59; // @[Ctl.scala 69:37]
  assign _T_111 = cyc_cnt_shift[8]; // @[Ctl.scala 69:69]
  assign _T_113 = ~ _T_111; // @[Ctl.scala 69:73]
  assign _T_114 = io_regfile_pol ? _T_111 : _T_113; // @[Ctl.scala 69:51]
  assign m_ks_out_8 = _T_10 ? _T_114 : _T_59; // @[Ctl.scala 69:37]
  assign _T_118 = cyc_cnt_shift[9]; // @[Ctl.scala 69:69]
  assign _T_120 = ~ _T_118; // @[Ctl.scala 69:73]
  assign _T_121 = io_regfile_pol ? _T_118 : _T_120; // @[Ctl.scala 69:51]
  assign m_ks_out_9 = _T_11 ? _T_121 : _T_59; // @[Ctl.scala 69:37]
  assign _T_125 = cyc_cnt_shift[10]; // @[Ctl.scala 69:69]
  assign _T_127 = ~ _T_125; // @[Ctl.scala 69:73]
  assign _T_128 = io_regfile_pol ? _T_125 : _T_127; // @[Ctl.scala 69:51]
  assign m_ks_out_10 = _T_12 ? _T_128 : _T_59; // @[Ctl.scala 69:37]
  assign _T_132 = cyc_cnt_shift[11]; // @[Ctl.scala 69:69]
  assign _T_134 = ~ _T_132; // @[Ctl.scala 69:73]
  assign _T_135 = io_regfile_pol ? _T_132 : _T_134; // @[Ctl.scala 69:51]
  assign m_ks_out_11 = _T_13 ? _T_135 : _T_59; // @[Ctl.scala 69:37]
  assign _T_139 = cyc_cnt_shift[12]; // @[Ctl.scala 69:69]
  assign _T_141 = ~ _T_139; // @[Ctl.scala 69:73]
  assign _T_142 = io_regfile_pol ? _T_139 : _T_141; // @[Ctl.scala 69:51]
  assign m_ks_out_12 = _T_14 ? _T_142 : _T_59; // @[Ctl.scala 69:37]
  assign _T_146 = cyc_cnt_shift[13]; // @[Ctl.scala 69:69]
  assign _T_148 = ~ _T_146; // @[Ctl.scala 69:73]
  assign _T_149 = io_regfile_pol ? _T_146 : _T_148; // @[Ctl.scala 69:51]
  assign m_ks_out_13 = _T_15 ? _T_149 : _T_59; // @[Ctl.scala 69:37]
  assign _T_153 = cyc_cnt_shift[14]; // @[Ctl.scala 69:69]
  assign _T_155 = ~ _T_153; // @[Ctl.scala 69:73]
  assign _T_156 = io_regfile_pol ? _T_153 : _T_155; // @[Ctl.scala 69:51]
  assign m_ks_out_14 = _T_16 ? _T_156 : _T_59; // @[Ctl.scala 69:37]
  assign _T_160 = cyc_cnt_shift[15]; // @[Ctl.scala 69:69]
  assign _T_162 = ~ _T_160; // @[Ctl.scala 69:73]
  assign _T_163 = io_regfile_pol ? _T_160 : _T_162; // @[Ctl.scala 69:51]
  assign m_ks_out_15 = _T_17 ? _T_163 : _T_59; // @[Ctl.scala 69:37]
  assign _T_167 = cyc_cnt_shift[16]; // @[Ctl.scala 69:69]
  assign _T_169 = ~ _T_167; // @[Ctl.scala 69:73]
  assign _T_170 = io_regfile_pol ? _T_167 : _T_169; // @[Ctl.scala 69:51]
  assign m_ks_out_16 = _T_18 ? _T_170 : _T_59; // @[Ctl.scala 69:37]
  assign _T_174 = cyc_cnt_shift[17]; // @[Ctl.scala 69:69]
  assign _T_176 = ~ _T_174; // @[Ctl.scala 69:73]
  assign _T_177 = io_regfile_pol ? _T_174 : _T_176; // @[Ctl.scala 69:51]
  assign m_ks_out_17 = _T_19 ? _T_177 : _T_59; // @[Ctl.scala 69:37]
  assign _T_192 = {m_ks_out_8,m_ks_out_7,m_ks_out_6,m_ks_out_5,m_ks_out_4,m_ks_out_3,m_ks_out_2,m_ks_out_1,m_ks_out_0}; // @[Ctl.scala 71:32]
  assign _T_201 = {m_ks_out_17,m_ks_out_16,m_ks_out_15,m_ks_out_14,m_ks_out_13,m_ks_out_12,m_ks_out_11,m_ks_out_10,m_ks_out_9,_T_192}; // @[Ctl.scala 71:32]
  assign _T_208 = valid_change == 1'h0; // @[Ctl.scala 85:35]
  assign _T_209 = _T_41 & _T_208; // @[Ctl.scala 85:32]
  assign _T_211 = deb_cnt + 16'h1; // @[Ctl.scala 86:24]
  assign _T_220 = sintval_finish == 1'h0; // @[Ctl.scala 101:40]
  assign _T_221 = _T_44 & _T_220; // @[Ctl.scala 101:37]
  assign _T_223 = sintval_cnt + 16'h1; // @[Ctl.scala 102:32]
  assign _T_227 = rintval_finish == 1'h0; // @[Ctl.scala 115:36]
  assign _T_228 = _T_45 & _T_227; // @[Ctl.scala 115:33]
  assign _T_230 = rintval_cnt + 4'h1; // @[Ctl.scala 116:31]
  assign _T_234 = step_cnt + 2'h1; // @[Ctl.scala 127:23]
  assign _T_286 = io_regfile_wken == 1'h0; // @[Ctl.scala 236:24]
  assign _T_287 = valid_change & _T_286; // @[Ctl.scala 236:21]
  assign _GEN_35 = io_hs_key_ack ? 1'h0 : key_vld; // @[Ctl.scala 238:33]
  assign _T_291 = _T_41 & valid_change; // @[Ctl.scala 252:26]
  assign _T_292 = ks_state == 3'h0; // @[Ctl.scala 254:22]
  assign _T_294 = _T_292 | _T_44; // @[Ctl.scala 254:33]
  assign _GEN_39 = _T_294 ? 1'h0 : int_trig; // @[Ctl.scala 254:59]
  assign io_hs_key_curinfo = key_curinfo; // @[Ctl.scala 267:21]
  assign io_hs_key_vld = key_vld; // @[Ctl.scala 268:17]
  assign io_regfile_cyc_value = _T_264 ? 5'h0 : _T_285; // @[Ctl.scala 270:24]
  assign io_regfile_ctl_int = ctl_int; // @[Ctl.scala 269:22]
  assign io_gpio_ks_out = f_ks_out; // @[Ctl.scala 272:18]
  assign io_gpio_ks_oe = f_ks_oe; // @[Ctl.scala 271:17]
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
  ks_state = _RAND_0[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  key_vld = _RAND_1[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  ks_in_d = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  ks_in_dd = _RAND_3[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  cyc_cnt = _RAND_4[17:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  step_cnt = _RAND_5[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  key_cur_st_d = _RAND_6[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  f_ks_oe = _RAND_7[17:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  sintval_cnt = _RAND_8[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  deb_cnt = _RAND_9[15:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  rintval_cnt = _RAND_10[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  f_ks_out = _RAND_11[17:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  key_curinfo = _RAND_12[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  int_trig = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  ctl_int = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
  if (reset) begin
    key_vld = 1'h0;
  end
  if (reset) begin
    cyc_cnt = 18'h0;
  end
  if (reset) begin
    step_cnt = 2'h0;
  end
  if (reset) begin
    f_ks_oe = 18'h0;
  end
  if (reset) begin
    sintval_cnt = 16'h0;
  end
  if (reset) begin
    deb_cnt = 16'h0;
  end
  if (reset) begin
    rintval_cnt = 4'h0;
  end
  if (reset) begin
    f_ks_out = 18'h0;
  end
  if (reset) begin
    key_curinfo = 8'h0;
  end
  if (reset) begin
    int_trig = 1'h0;
  end
  if (reset) begin
    ctl_int = 1'h0;
  end
end
  always @(posedge clock) begin
    if (_T_236) begin
      if (io_regfile_ksen) begin
        ks_state <= 3'h1;
      end
    end else if (_T_238) begin
      if (_T_239) begin
        ks_state <= 3'h0;
      end else if (sintval_finish) begin
        ks_state <= 3'h2;
      end
    end else if (_T_240) begin
      if (_T_239) begin
        ks_state <= 3'h0;
      end else if (step_cnt_max) begin
        if (key_change) begin
          ks_state <= 3'h3;
        end else begin
          ks_state <= 3'h4;
        end
      end
    end else if (_T_243) begin
      if (_T_239) begin
        ks_state <= 3'h0;
      end else if (_T_245) begin
        ks_state <= 3'h4;
      end
    end else if (_T_247) begin
      if (_T_239) begin
        ks_state <= 3'h0;
      end else if (_T_250) begin
        ks_state <= 3'h1;
      end else if (_T_252) begin
        ks_state <= 3'h2;
      end
    end else begin
      ks_state <= 3'h0;
    end
    ks_in_d <= io_gpio_ks_in;
    ks_in_dd <= ks_in_d;
    if (sel_cyc_value_0) begin
      if (_T_2) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_1) begin
      if (_T_3) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_2) begin
      if (_T_4) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_3) begin
      if (_T_5) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_4) begin
      if (_T_6) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_5) begin
      if (_T_7) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_6) begin
      if (_T_8) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_7) begin
      if (_T_9) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_8) begin
      if (_T_10) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_9) begin
      if (_T_11) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_10) begin
      if (_T_12) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_11) begin
      if (_T_13) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_12) begin
      if (_T_14) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_13) begin
      if (_T_15) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_14) begin
      if (_T_16) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_15) begin
      if (_T_17) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_16) begin
      if (_T_18) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else if (sel_cyc_value_17) begin
      if (_T_19) begin
        key_cur_st_d <= ks_in_mask;
      end else begin
        key_cur_st_d <= 8'h0;
      end
    end else begin
      key_cur_st_d <= 8'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      key_vld <= 1'h0;
    end else begin
      key_vld <= _T_287 | _GEN_35;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      cyc_cnt <= 18'h0;
    end else if (_T_236) begin
      cyc_cnt <= 18'h0;
    end else if (_T_238) begin
      if (_T_50) begin
        cyc_cnt <= 18'h0;
      end else if (_T_47) begin
        cyc_cnt <= cyc_cnt_shift;
      end else begin
        cyc_cnt <= 18'h20000;
      end
    end else if (_T_247) begin
      if (_T_47) begin
        cyc_cnt <= cyc_cnt_shift;
      end else if (_T_49) begin
        cyc_cnt <= 18'h20000;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      step_cnt <= 2'h0;
    end else if (_T_47) begin
      step_cnt <= _T_234;
    end else begin
      step_cnt <= 2'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      f_ks_oe <= 18'h0;
    end else if (_T_48) begin
      f_ks_oe <= m_ks_oe;
    end else if (_T_53) begin
      f_ks_oe <= 18'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      sintval_cnt <= 16'h0;
    end else if (_T_239) begin
      sintval_cnt <= 16'h0;
    end else if (_T_221) begin
      sintval_cnt <= _T_223;
    end else begin
      sintval_cnt <= 16'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      deb_cnt <= 16'h0;
    end else if (_T_239) begin
      deb_cnt <= 16'h0;
    end else if (_T_209) begin
      deb_cnt <= _T_211;
    end else begin
      deb_cnt <= 16'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      rintval_cnt <= 4'h0;
    end else if (_T_239) begin
      rintval_cnt <= 4'h0;
    end else if (_T_228) begin
      rintval_cnt <= _T_230;
    end else begin
      rintval_cnt <= 4'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      f_ks_out <= 18'h0;
    end else if (_T_48) begin
      f_ks_out <= _T_201;
    end else if (_T_51) begin
      if (io_regfile_pol) begin
        f_ks_out <= 18'h0;
      end else begin
        f_ks_out <= 18'h3ffff;
      end
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      key_curinfo <= 8'h0;
    end else if (valid_change) begin
      if (sel_cyc_value_0) begin
        if (_T_2) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_1) begin
        if (_T_3) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_2) begin
        if (_T_4) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_3) begin
        if (_T_5) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_4) begin
        if (_T_6) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_5) begin
        if (_T_7) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_6) begin
        if (_T_8) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_7) begin
        if (_T_9) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_8) begin
        if (_T_10) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_9) begin
        if (_T_11) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_10) begin
        if (_T_12) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_11) begin
        if (_T_13) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_12) begin
        if (_T_14) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_13) begin
        if (_T_15) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_14) begin
        if (_T_16) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_15) begin
        if (_T_17) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_16) begin
        if (_T_18) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else if (sel_cyc_value_17) begin
        if (_T_19) begin
          key_curinfo <= ks_in_mask;
        end else begin
          key_curinfo <= 8'h0;
        end
      end else begin
        key_curinfo <= 8'h0;
      end
    end else if (io_hs_key_ack) begin
      key_curinfo <= 8'h0;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      int_trig <= 1'h0;
    end else begin
      int_trig <= _T_291 | _GEN_39;
    end
  end
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ctl_int <= 1'h0;
    end else begin
      ctl_int <= _T_44 & int_trig;
    end
  end
endmodule
module KeyscanTop(
  input         io_global_pclk,
  input         io_global_presetn,
  input         io_global_sclk,
  input         io_global_sresetn,
  input         io_apb_psel,
  input         io_apb_pwrite,
  input         io_apb_penable,
  input  [5:0]  io_apb_paddr,
  input  [31:0] io_apb_pwdata,
  output [31:0] io_apb_prdata,
  output        io_apb_irq,
  input  [7:0]  io_gpio_ks_in,
  output [17:0] io_gpio_ks_out,
  output [17:0] io_gpio_ks_oe
);
  wire  hssync_io_global_pclk; // @[KeyscanTop.scala 11:22]
  wire  hssync_io_global_presetn; // @[KeyscanTop.scala 11:22]
  wire  hssync_io_global_sclk; // @[KeyscanTop.scala 11:22]
  wire  hssync_io_global_sresetn; // @[KeyscanTop.scala 11:22]
  wire [7:0] hssync_io_master_key_curinfo; // @[KeyscanTop.scala 11:22]
  wire  hssync_io_master_key_vld; // @[KeyscanTop.scala 11:22]
  wire  hssync_io_master_key_ack; // @[KeyscanTop.scala 11:22]
  wire [7:0] hssync_io_slave_key_curinfo; // @[KeyscanTop.scala 11:22]
  wire  hssync_io_slave_key_vld; // @[KeyscanTop.scala 11:22]
  wire  hssync_io_slave_key_ack; // @[KeyscanTop.scala 11:22]
  wire  regfile_clock; // @[KeyscanTop.scala 12:75]
  wire  regfile_reset; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_apb_psel; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_apb_pwrite; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_apb_penable; // @[KeyscanTop.scala 12:75]
  wire [5:0] regfile_io_apb_paddr; // @[KeyscanTop.scala 12:75]
  wire [31:0] regfile_io_apb_pwdata; // @[KeyscanTop.scala 12:75]
  wire [31:0] regfile_io_apb_prdata; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_apb_irq; // @[KeyscanTop.scala 12:75]
  wire [7:0] regfile_io_hs_key_curinfo; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_hs_key_vld; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_hs_key_ack; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_ctl_ksen; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_ctl_wken; // @[KeyscanTop.scala 12:75]
  wire [7:0] regfile_io_ctl_key_preinfo; // @[KeyscanTop.scala 12:75]
  wire [25:0] regfile_io_ctl_ioen; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_ctl_pol; // @[KeyscanTop.scala 12:75]
  wire [3:0] regfile_io_ctl_deb_value; // @[KeyscanTop.scala 12:75]
  wire [3:0] regfile_io_ctl_rintval_value; // @[KeyscanTop.scala 12:75]
  wire [3:0] regfile_io_ctl_sintval_value; // @[KeyscanTop.scala 12:75]
  wire [4:0] regfile_io_ctl_cyc_value; // @[KeyscanTop.scala 12:75]
  wire  regfile_io_ctl_ctl_int; // @[KeyscanTop.scala 12:75]
  wire  ctl_clock; // @[KeyscanTop.scala 13:72]
  wire  ctl_reset; // @[KeyscanTop.scala 13:72]
  wire [7:0] ctl_io_hs_key_curinfo; // @[KeyscanTop.scala 13:72]
  wire  ctl_io_hs_key_vld; // @[KeyscanTop.scala 13:72]
  wire  ctl_io_hs_key_ack; // @[KeyscanTop.scala 13:72]
  wire  ctl_io_regfile_ksen; // @[KeyscanTop.scala 13:72]
  wire  ctl_io_regfile_wken; // @[KeyscanTop.scala 13:72]
  wire [7:0] ctl_io_regfile_key_preinfo; // @[KeyscanTop.scala 13:72]
  wire [25:0] ctl_io_regfile_ioen; // @[KeyscanTop.scala 13:72]
  wire  ctl_io_regfile_pol; // @[KeyscanTop.scala 13:72]
  wire [3:0] ctl_io_regfile_deb_value; // @[KeyscanTop.scala 13:72]
  wire [3:0] ctl_io_regfile_rintval_value; // @[KeyscanTop.scala 13:72]
  wire [3:0] ctl_io_regfile_sintval_value; // @[KeyscanTop.scala 13:72]
  wire [4:0] ctl_io_regfile_cyc_value; // @[KeyscanTop.scala 13:72]
  wire  ctl_io_regfile_ctl_int; // @[KeyscanTop.scala 13:72]
  wire [7:0] ctl_io_gpio_ks_in; // @[KeyscanTop.scala 13:72]
  wire [17:0] ctl_io_gpio_ks_out; // @[KeyscanTop.scala 13:72]
  wire [17:0] ctl_io_gpio_ks_oe; // @[KeyscanTop.scala 13:72]
  Hssync hssync ( // @[KeyscanTop.scala 11:22]
    .io_global_pclk(hssync_io_global_pclk),
    .io_global_presetn(hssync_io_global_presetn),
    .io_global_sclk(hssync_io_global_sclk),
    .io_global_sresetn(hssync_io_global_sresetn),
    .io_master_key_curinfo(hssync_io_master_key_curinfo),
    .io_master_key_vld(hssync_io_master_key_vld),
    .io_master_key_ack(hssync_io_master_key_ack),
    .io_slave_key_curinfo(hssync_io_slave_key_curinfo),
    .io_slave_key_vld(hssync_io_slave_key_vld),
    .io_slave_key_ack(hssync_io_slave_key_ack)
  );
  Regfile regfile ( // @[KeyscanTop.scala 12:75]
    .clock(regfile_clock),
    .reset(regfile_reset),
    .io_apb_psel(regfile_io_apb_psel),
    .io_apb_pwrite(regfile_io_apb_pwrite),
    .io_apb_penable(regfile_io_apb_penable),
    .io_apb_paddr(regfile_io_apb_paddr),
    .io_apb_pwdata(regfile_io_apb_pwdata),
    .io_apb_prdata(regfile_io_apb_prdata),
    .io_apb_irq(regfile_io_apb_irq),
    .io_hs_key_curinfo(regfile_io_hs_key_curinfo),
    .io_hs_key_vld(regfile_io_hs_key_vld),
    .io_hs_key_ack(regfile_io_hs_key_ack),
    .io_ctl_ksen(regfile_io_ctl_ksen),
    .io_ctl_wken(regfile_io_ctl_wken),
    .io_ctl_key_preinfo(regfile_io_ctl_key_preinfo),
    .io_ctl_ioen(regfile_io_ctl_ioen),
    .io_ctl_pol(regfile_io_ctl_pol),
    .io_ctl_deb_value(regfile_io_ctl_deb_value),
    .io_ctl_rintval_value(regfile_io_ctl_rintval_value),
    .io_ctl_sintval_value(regfile_io_ctl_sintval_value),
    .io_ctl_cyc_value(regfile_io_ctl_cyc_value),
    .io_ctl_ctl_int(regfile_io_ctl_ctl_int)
  );
  Ctl ctl ( // @[KeyscanTop.scala 13:72]
    .clock(ctl_clock),
    .reset(ctl_reset),
    .io_hs_key_curinfo(ctl_io_hs_key_curinfo),
    .io_hs_key_vld(ctl_io_hs_key_vld),
    .io_hs_key_ack(ctl_io_hs_key_ack),
    .io_regfile_ksen(ctl_io_regfile_ksen),
    .io_regfile_wken(ctl_io_regfile_wken),
    .io_regfile_key_preinfo(ctl_io_regfile_key_preinfo),
    .io_regfile_ioen(ctl_io_regfile_ioen),
    .io_regfile_pol(ctl_io_regfile_pol),
    .io_regfile_deb_value(ctl_io_regfile_deb_value),
    .io_regfile_rintval_value(ctl_io_regfile_rintval_value),
    .io_regfile_sintval_value(ctl_io_regfile_sintval_value),
    .io_regfile_cyc_value(ctl_io_regfile_cyc_value),
    .io_regfile_ctl_int(ctl_io_regfile_ctl_int),
    .io_gpio_ks_in(ctl_io_gpio_ks_in),
    .io_gpio_ks_out(ctl_io_gpio_ks_out),
    .io_gpio_ks_oe(ctl_io_gpio_ks_oe)
  );
  assign io_apb_prdata = regfile_io_apb_prdata; // @[KeyscanTop.scala 15:10]
  assign io_apb_irq = regfile_io_apb_irq; // @[KeyscanTop.scala 15:10]
  assign io_gpio_ks_out = ctl_io_gpio_ks_out; // @[KeyscanTop.scala 17:11]
  assign io_gpio_ks_oe = ctl_io_gpio_ks_oe; // @[KeyscanTop.scala 17:11]
  assign hssync_io_global_pclk = io_global_pclk; // @[KeyscanTop.scala 16:13]
  assign hssync_io_global_presetn = io_global_presetn; // @[KeyscanTop.scala 16:13]
  assign hssync_io_global_sclk = io_global_sclk; // @[KeyscanTop.scala 16:13]
  assign hssync_io_global_sresetn = io_global_sresetn; // @[KeyscanTop.scala 16:13]
  assign hssync_io_master_key_curinfo = ctl_io_hs_key_curinfo; // @[KeyscanTop.scala 20:13]
  assign hssync_io_master_key_vld = ctl_io_hs_key_vld; // @[KeyscanTop.scala 20:13]
  assign hssync_io_slave_key_ack = regfile_io_hs_key_ack; // @[KeyscanTop.scala 18:17]
  assign regfile_clock = io_global_pclk;
  assign regfile_reset = io_global_presetn;
  assign regfile_io_apb_psel = io_apb_psel; // @[KeyscanTop.scala 15:10]
  assign regfile_io_apb_pwrite = io_apb_pwrite; // @[KeyscanTop.scala 15:10]
  assign regfile_io_apb_penable = io_apb_penable; // @[KeyscanTop.scala 15:10]
  assign regfile_io_apb_paddr = io_apb_paddr; // @[KeyscanTop.scala 15:10]
  assign regfile_io_apb_pwdata = io_apb_pwdata; // @[KeyscanTop.scala 15:10]
  assign regfile_io_hs_key_curinfo = hssync_io_slave_key_curinfo; // @[KeyscanTop.scala 18:17]
  assign regfile_io_hs_key_vld = hssync_io_slave_key_vld; // @[KeyscanTop.scala 18:17]
  assign regfile_io_ctl_cyc_value = ctl_io_regfile_cyc_value; // @[KeyscanTop.scala 19:18]
  assign regfile_io_ctl_ctl_int = ctl_io_regfile_ctl_int; // @[KeyscanTop.scala 19:18]
  assign ctl_clock = io_global_sclk;
  assign ctl_reset = io_global_sresetn;
  assign ctl_io_hs_key_ack = hssync_io_master_key_ack; // @[KeyscanTop.scala 20:13]
  assign ctl_io_regfile_ksen = regfile_io_ctl_ksen; // @[KeyscanTop.scala 19:18]
  assign ctl_io_regfile_wken = regfile_io_ctl_wken; // @[KeyscanTop.scala 19:18]
  assign ctl_io_regfile_key_preinfo = regfile_io_ctl_key_preinfo; // @[KeyscanTop.scala 19:18]
  assign ctl_io_regfile_ioen = regfile_io_ctl_ioen; // @[KeyscanTop.scala 19:18]
  assign ctl_io_regfile_pol = regfile_io_ctl_pol; // @[KeyscanTop.scala 19:18]
  assign ctl_io_regfile_deb_value = regfile_io_ctl_deb_value; // @[KeyscanTop.scala 19:18]
  assign ctl_io_regfile_rintval_value = regfile_io_ctl_rintval_value; // @[KeyscanTop.scala 19:18]
  assign ctl_io_regfile_sintval_value = regfile_io_ctl_sintval_value; // @[KeyscanTop.scala 19:18]
  assign ctl_io_gpio_ks_in = io_gpio_ks_in; // @[KeyscanTop.scala 17:11]
endmodule
