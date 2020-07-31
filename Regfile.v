module Regfile(
  input         clock,
  input         reset,
  input         io_apb_psel,
  input         io_apb_pwrite,
  input         io_apb_penable,
  input  [7:0]  io_apb_paddr,
  input  [31:0] io_apb_pwdata,
  output [31:0] io_apb_prdata,
  output        io_apb_irq,
  input  [7:0]  io_hs_key_curinfo,
  input  [3:0]  io_hs_key_vld,
  output [3:0]  io_hs_key_ack,
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
  reg [3:0] key_vld_d; // @[Regfile.scala 20:28]
  reg [31:0] _RAND_0;
  reg [3:0] key_vld_dd; // @[Regfile.scala 21:29]
  reg [31:0] _RAND_1;
  reg  key_ack; // @[Regfile.scala 22:26]
  reg [31:0] _RAND_2;
  wire  _T; // @[Regfile.scala 23:33]
  wire  _T_1; // @[Regfile.scala 23:55]
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
  wire  _T_4; // @[Regfile.scala 39:31]
  wire  _T_5; // @[Regfile.scala 54:30]
  wire  wr_en; // @[Regfile.scala 54:47]
  wire  _T_6; // @[Regfile.scala 55:32]
  wire  _T_7; // @[Regfile.scala 55:29]
  wire  _T_8; // @[Regfile.scala 55:52]
  wire  rd_en; // @[Regfile.scala 55:49]
  wire [5:0] reg_idx; // @[Regfile.scala 56:33]
  wire  _T_9; // @[Regfile.scala 58:30]
  wire  ks_en_wr; // @[Regfile.scala 58:39]
  reg  ks_en; // @[Regfile.scala 59:25]
  reg [31:0] _RAND_7;
  reg  wk_en; // @[Regfile.scala 60:25]
  reg [31:0] _RAND_8;
  wire  _T_11; // @[Regfile.scala 62:29]
  wire  _T_12; // @[Regfile.scala 63:29]
  wire [31:0] ks_en_bus; // @[Cat.scala 29:58]
  wire  _T_14; // @[Regfile.scala 67:31]
  wire  io_cfg_wr; // @[Regfile.scala 67:40]
  reg [17:0] ksoe; // @[Regfile.scala 68:24]
  reg [31:0] _RAND_9;
  reg [7:0] ksie; // @[Regfile.scala 69:24]
  reg [31:0] _RAND_10;
  wire [17:0] _T_16; // @[Regfile.scala 71:28]
  wire [7:0] _T_17; // @[Regfile.scala 72:28]
  wire [31:0] io_cfg_bus; // @[Cat.scala 29:58]
  wire  _T_19; // @[Regfile.scala 76:32]
  wire  int_cfg_wr; // @[Regfile.scala 76:41]
  reg  int_en; // @[Regfile.scala 77:26]
  reg [31:0] _RAND_11;
  reg  ksf; // @[Regfile.scala 78:23]
  reg [31:0] _RAND_12;
  reg  ksif; // @[Regfile.scala 79:24]
  reg [31:0] _RAND_13;
  wire  _T_24; // @[Regfile.scala 83:29]
  wire  _T_26; // @[Regfile.scala 84:14]
  wire  _GEN_6; // @[Regfile.scala 85:35]
  wire  _T_29; // @[Regfile.scala 88:45]
  wire  _T_30; // @[Regfile.scala 88:29]
  wire  _T_32; // @[Regfile.scala 89:15]
  wire [31:0] int_cfg_bus; // @[Cat.scala 29:58]
  wire  _T_36; // @[Regfile.scala 95:30]
  wire  ks_cfg_wr; // @[Regfile.scala 95:39]
  reg  pol; // @[Regfile.scala 96:23]
  reg [31:0] _RAND_14;
  reg  clr_key; // @[Regfile.scala 97:27]
  reg [31:0] _RAND_15;
  reg [3:0] sintval_value; // @[Regfile.scala 98:33]
  reg [31:0] _RAND_16;
  reg [3:0] rintval_value; // @[Regfile.scala 99:33]
  reg [31:0] _RAND_17;
  reg [3:0] deb_value; // @[Regfile.scala 100:29]
  reg [31:0] _RAND_18;
  wire  _T_38; // @[Regfile.scala 102:27]
  wire  _T_39; // @[Regfile.scala 103:31]
  wire [3:0] _T_40; // @[Regfile.scala 104:37]
  wire [3:0] _T_41; // @[Regfile.scala 105:37]
  wire [3:0] _T_42; // @[Regfile.scala 106:33]
  wire [31:0] ks_cfg_bus; // @[Cat.scala 29:58]
  reg [7:0] rows_0; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_19;
  wire  _T_48; // @[Regfile.scala 115:36]
  wire  _T_50; // @[Regfile.scala 115:45]
  reg [7:0] rows_1; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_20;
  wire  _T_52; // @[Regfile.scala 115:36]
  wire  _T_54; // @[Regfile.scala 115:45]
  reg [7:0] rows_2; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_21;
  wire  _T_56; // @[Regfile.scala 115:36]
  wire  _T_58; // @[Regfile.scala 115:45]
  reg [7:0] rows_3; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_22;
  wire  _T_60; // @[Regfile.scala 115:36]
  wire  _T_62; // @[Regfile.scala 115:45]
  reg [7:0] rows_4; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_23;
  wire  _T_64; // @[Regfile.scala 115:36]
  wire  _T_66; // @[Regfile.scala 115:45]
  reg [7:0] rows_5; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_24;
  wire  _T_68; // @[Regfile.scala 115:36]
  wire  _T_70; // @[Regfile.scala 115:45]
  reg [7:0] rows_6; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_25;
  wire  _T_72; // @[Regfile.scala 115:36]
  wire  _T_74; // @[Regfile.scala 115:45]
  reg [7:0] rows_7; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_26;
  wire  _T_76; // @[Regfile.scala 115:36]
  wire  _T_78; // @[Regfile.scala 115:45]
  reg [7:0] rows_8; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_27;
  wire  _T_80; // @[Regfile.scala 115:36]
  wire  _T_82; // @[Regfile.scala 115:45]
  reg [7:0] rows_9; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_28;
  wire  _T_84; // @[Regfile.scala 115:36]
  wire  _T_86; // @[Regfile.scala 115:45]
  reg [7:0] rows_10; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_29;
  wire  _T_88; // @[Regfile.scala 115:36]
  wire  _T_90; // @[Regfile.scala 115:45]
  reg [7:0] rows_11; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_30;
  wire  _T_92; // @[Regfile.scala 115:36]
  wire  _T_94; // @[Regfile.scala 115:45]
  reg [7:0] rows_12; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_31;
  wire  _T_96; // @[Regfile.scala 115:36]
  wire  _T_98; // @[Regfile.scala 115:45]
  reg [7:0] rows_13; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_32;
  wire  _T_100; // @[Regfile.scala 115:36]
  wire  _T_102; // @[Regfile.scala 115:45]
  reg [7:0] rows_14; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_33;
  wire  _T_104; // @[Regfile.scala 115:36]
  wire  _T_106; // @[Regfile.scala 115:45]
  reg [7:0] rows_15; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_34;
  wire  _T_108; // @[Regfile.scala 115:36]
  wire  _T_110; // @[Regfile.scala 115:45]
  reg [7:0] rows_16; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_35;
  wire  _T_112; // @[Regfile.scala 115:36]
  wire  _T_114; // @[Regfile.scala 115:45]
  reg [7:0] rows_17; // @[Regfile.scala 112:23]
  reg [31:0] _RAND_36;
  wire  _T_116; // @[Regfile.scala 115:36]
  wire  _T_118; // @[Regfile.scala 115:45]
  wire [31:0] ks_info0_bus; // @[Cat.scala 29:58]
  wire [31:0] ks_info1_bus; // @[Cat.scala 29:58]
  wire [31:0] ks_info2_bus; // @[Cat.scala 29:58]
  wire [31:0] ks_info3_bus; // @[Cat.scala 29:58]
  wire [31:0] ks_info4_bus; // @[Cat.scala 29:58]
  wire  _T_133; // @[Regfile.scala 131:16]
  wire  _T_134; // @[Regfile.scala 132:16]
  wire  _T_135; // @[Regfile.scala 133:16]
  wire  _T_136; // @[Regfile.scala 134:16]
  wire  _T_137; // @[Regfile.scala 135:16]
  wire [31:0] _T_138; // @[Mux.scala 87:16]
  wire [31:0] _T_139; // @[Mux.scala 87:16]
  wire [31:0] _T_140; // @[Mux.scala 87:16]
  wire [31:0] _T_141; // @[Mux.scala 87:16]
  wire [31:0] _T_142; // @[Mux.scala 87:16]
  wire [31:0] _T_143; // @[Mux.scala 87:16]
  wire [31:0] _T_144; // @[Mux.scala 87:16]
  wire [31:0] _T_145; // @[Mux.scala 87:16]
  wire [31:0] _T_146; // @[Mux.scala 87:16]
  wire  _T_148; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_0; // @[Regfile.scala 138:48]
  wire  _T_149; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_1; // @[Regfile.scala 138:48]
  wire  _T_150; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_2; // @[Regfile.scala 138:48]
  wire  _T_151; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_3; // @[Regfile.scala 138:48]
  wire  _T_152; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_4; // @[Regfile.scala 138:48]
  wire  _T_153; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_5; // @[Regfile.scala 138:48]
  wire  _T_154; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_6; // @[Regfile.scala 138:48]
  wire  _T_155; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_7; // @[Regfile.scala 138:48]
  wire  _T_156; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_8; // @[Regfile.scala 138:48]
  wire  _T_157; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_9; // @[Regfile.scala 138:48]
  wire  _T_158; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_10; // @[Regfile.scala 138:48]
  wire  _T_159; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_11; // @[Regfile.scala 138:48]
  wire  _T_160; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_12; // @[Regfile.scala 138:48]
  wire  _T_161; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_13; // @[Regfile.scala 138:48]
  wire  _T_162; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_14; // @[Regfile.scala 138:48]
  wire  _T_163; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_15; // @[Regfile.scala 138:48]
  wire  _T_164; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_16; // @[Regfile.scala 138:48]
  wire  _T_165; // @[Regfile.scala 138:53]
  wire [7:0] sel_rows_17; // @[Regfile.scala 138:48]
  wire [7:0] _T_166; // @[Mux.scala 87:16]
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
  wire [7:0] key_info; // @[Mux.scala 87:16]
  assign _T = key_vld_dd == 4'h0; // @[Regfile.scala 23:33]
  assign _T_1 = key_vld_d == 4'h1; // @[Regfile.scala 23:55]
  assign key_vld_r = _T & _T_1; // @[Regfile.scala 23:42]
  assign _T_2 = ctl_int_ddd == 1'h0; // @[Regfile.scala 39:18]
  assign _T_4 = _T_2 & ctl_int_dd; // @[Regfile.scala 39:31]
  assign _T_5 = io_apb_psel & io_apb_penable; // @[Regfile.scala 54:30]
  assign wr_en = _T_5 & io_apb_pwrite; // @[Regfile.scala 54:47]
  assign _T_6 = io_apb_penable == 1'h0; // @[Regfile.scala 55:32]
  assign _T_7 = io_apb_psel & _T_6; // @[Regfile.scala 55:29]
  assign _T_8 = io_apb_pwrite == 1'h0; // @[Regfile.scala 55:52]
  assign rd_en = _T_7 & _T_8; // @[Regfile.scala 55:49]
  assign reg_idx = io_apb_paddr[7:2]; // @[Regfile.scala 56:33]
  assign _T_9 = reg_idx == 6'h0; // @[Regfile.scala 58:30]
  assign ks_en_wr = _T_9 & wr_en; // @[Regfile.scala 58:39]
  assign _T_11 = io_apb_pwdata[0]; // @[Regfile.scala 62:29]
  assign _T_12 = io_apb_pwdata[1]; // @[Regfile.scala 63:29]
  assign ks_en_bus = {30'h0,ks_en,wk_en}; // @[Cat.scala 29:58]
  assign _T_14 = reg_idx == 6'h1; // @[Regfile.scala 67:31]
  assign io_cfg_wr = _T_14 & wr_en; // @[Regfile.scala 67:40]
  assign _T_16 = io_apb_pwdata[25:8]; // @[Regfile.scala 71:28]
  assign _T_17 = io_apb_pwdata[7:0]; // @[Regfile.scala 72:28]
  assign io_cfg_bus = {6'h0,ksoe,ksie}; // @[Cat.scala 29:58]
  assign _T_19 = reg_idx == 6'h2; // @[Regfile.scala 76:32]
  assign int_cfg_wr = _T_19 & wr_en; // @[Regfile.scala 76:41]
  assign _T_24 = int_cfg_wr & _T_12; // @[Regfile.scala 83:29]
  assign _T_26 = ~ _T_12; // @[Regfile.scala 84:14]
  assign _GEN_6 = ctl_int_r | ksf; // @[Regfile.scala 85:35]
  assign _T_29 = io_apb_pwdata[2]; // @[Regfile.scala 88:45]
  assign _T_30 = int_cfg_wr & _T_29; // @[Regfile.scala 88:29]
  assign _T_32 = ~ _T_29; // @[Regfile.scala 89:15]
  assign int_cfg_bus = {29'h0,ksif,ksf,int_en}; // @[Cat.scala 29:58]
  assign _T_36 = reg_idx == 6'h3; // @[Regfile.scala 95:30]
  assign ks_cfg_wr = _T_36 & wr_en; // @[Regfile.scala 95:39]
  assign _T_38 = io_apb_pwdata[13]; // @[Regfile.scala 102:27]
  assign _T_39 = io_apb_pwdata[12]; // @[Regfile.scala 103:31]
  assign _T_40 = io_apb_pwdata[11:8]; // @[Regfile.scala 104:37]
  assign _T_41 = io_apb_pwdata[7:4]; // @[Regfile.scala 105:37]
  assign _T_42 = io_apb_pwdata[3:0]; // @[Regfile.scala 106:33]
  assign ks_cfg_bus = {18'h0,pol,clr_key,sintval_value,rintval_value,deb_value}; // @[Cat.scala 29:58]
  assign _T_48 = io_ctl_cyc_value == 5'h0; // @[Regfile.scala 115:36]
  assign _T_50 = _T_48 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_52 = io_ctl_cyc_value == 5'h1; // @[Regfile.scala 115:36]
  assign _T_54 = _T_52 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_56 = io_ctl_cyc_value == 5'h2; // @[Regfile.scala 115:36]
  assign _T_58 = _T_56 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_60 = io_ctl_cyc_value == 5'h3; // @[Regfile.scala 115:36]
  assign _T_62 = _T_60 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_64 = io_ctl_cyc_value == 5'h4; // @[Regfile.scala 115:36]
  assign _T_66 = _T_64 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_68 = io_ctl_cyc_value == 5'h5; // @[Regfile.scala 115:36]
  assign _T_70 = _T_68 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_72 = io_ctl_cyc_value == 5'h6; // @[Regfile.scala 115:36]
  assign _T_74 = _T_72 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_76 = io_ctl_cyc_value == 5'h7; // @[Regfile.scala 115:36]
  assign _T_78 = _T_76 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_80 = io_ctl_cyc_value == 5'h8; // @[Regfile.scala 115:36]
  assign _T_82 = _T_80 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_84 = io_ctl_cyc_value == 5'h9; // @[Regfile.scala 115:36]
  assign _T_86 = _T_84 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_88 = io_ctl_cyc_value == 5'ha; // @[Regfile.scala 115:36]
  assign _T_90 = _T_88 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_92 = io_ctl_cyc_value == 5'hb; // @[Regfile.scala 115:36]
  assign _T_94 = _T_92 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_96 = io_ctl_cyc_value == 5'hc; // @[Regfile.scala 115:36]
  assign _T_98 = _T_96 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_100 = io_ctl_cyc_value == 5'hd; // @[Regfile.scala 115:36]
  assign _T_102 = _T_100 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_104 = io_ctl_cyc_value == 5'he; // @[Regfile.scala 115:36]
  assign _T_106 = _T_104 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_108 = io_ctl_cyc_value == 5'hf; // @[Regfile.scala 115:36]
  assign _T_110 = _T_108 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_112 = io_ctl_cyc_value == 5'h10; // @[Regfile.scala 115:36]
  assign _T_114 = _T_112 & key_vld_r; // @[Regfile.scala 115:45]
  assign _T_116 = io_ctl_cyc_value == 5'h11; // @[Regfile.scala 115:36]
  assign _T_118 = _T_116 & key_vld_r; // @[Regfile.scala 115:45]
  assign ks_info0_bus = {rows_3,rows_2,rows_1,rows_0}; // @[Cat.scala 29:58]
  assign ks_info1_bus = {rows_7,rows_6,rows_5,rows_4}; // @[Cat.scala 29:58]
  assign ks_info2_bus = {rows_11,rows_10,rows_9,rows_8}; // @[Cat.scala 29:58]
  assign ks_info3_bus = {rows_15,rows_14,rows_13,rows_12}; // @[Cat.scala 29:58]
  assign ks_info4_bus = {16'h0,rows_17,rows_16}; // @[Cat.scala 29:58]
  assign _T_133 = reg_idx == 6'h4; // @[Regfile.scala 131:16]
  assign _T_134 = reg_idx == 6'h5; // @[Regfile.scala 132:16]
  assign _T_135 = reg_idx == 6'h6; // @[Regfile.scala 133:16]
  assign _T_136 = reg_idx == 6'h7; // @[Regfile.scala 134:16]
  assign _T_137 = reg_idx == 6'h8; // @[Regfile.scala 135:16]
  assign _T_138 = _T_137 ? ks_info4_bus : 32'h0; // @[Mux.scala 87:16]
  assign _T_139 = _T_136 ? ks_info3_bus : _T_138; // @[Mux.scala 87:16]
  assign _T_140 = _T_135 ? ks_info2_bus : _T_139; // @[Mux.scala 87:16]
  assign _T_141 = _T_134 ? ks_info1_bus : _T_140; // @[Mux.scala 87:16]
  assign _T_142 = _T_133 ? ks_info0_bus : _T_141; // @[Mux.scala 87:16]
  assign _T_143 = _T_36 ? ks_cfg_bus : _T_142; // @[Mux.scala 87:16]
  assign _T_144 = _T_19 ? int_cfg_bus : _T_143; // @[Mux.scala 87:16]
  assign _T_145 = _T_14 ? io_cfg_bus : _T_144; // @[Mux.scala 87:16]
  assign _T_146 = _T_9 ? ks_en_bus : _T_145; // @[Mux.scala 87:16]
  assign _T_148 = ksoe[0]; // @[Regfile.scala 138:53]
  assign sel_rows_0 = _T_148 ? rows_0 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_149 = ksoe[1]; // @[Regfile.scala 138:53]
  assign sel_rows_1 = _T_149 ? rows_1 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_150 = ksoe[2]; // @[Regfile.scala 138:53]
  assign sel_rows_2 = _T_150 ? rows_2 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_151 = ksoe[3]; // @[Regfile.scala 138:53]
  assign sel_rows_3 = _T_151 ? rows_3 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_152 = ksoe[4]; // @[Regfile.scala 138:53]
  assign sel_rows_4 = _T_152 ? rows_4 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_153 = ksoe[5]; // @[Regfile.scala 138:53]
  assign sel_rows_5 = _T_153 ? rows_5 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_154 = ksoe[6]; // @[Regfile.scala 138:53]
  assign sel_rows_6 = _T_154 ? rows_6 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_155 = ksoe[7]; // @[Regfile.scala 138:53]
  assign sel_rows_7 = _T_155 ? rows_7 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_156 = ksoe[8]; // @[Regfile.scala 138:53]
  assign sel_rows_8 = _T_156 ? rows_8 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_157 = ksoe[9]; // @[Regfile.scala 138:53]
  assign sel_rows_9 = _T_157 ? rows_9 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_158 = ksoe[10]; // @[Regfile.scala 138:53]
  assign sel_rows_10 = _T_158 ? rows_10 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_159 = ksoe[11]; // @[Regfile.scala 138:53]
  assign sel_rows_11 = _T_159 ? rows_11 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_160 = ksoe[12]; // @[Regfile.scala 138:53]
  assign sel_rows_12 = _T_160 ? rows_12 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_161 = ksoe[13]; // @[Regfile.scala 138:53]
  assign sel_rows_13 = _T_161 ? rows_13 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_162 = ksoe[14]; // @[Regfile.scala 138:53]
  assign sel_rows_14 = _T_162 ? rows_14 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_163 = ksoe[15]; // @[Regfile.scala 138:53]
  assign sel_rows_15 = _T_163 ? rows_15 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_164 = ksoe[16]; // @[Regfile.scala 138:53]
  assign sel_rows_16 = _T_164 ? rows_16 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_165 = ksoe[17]; // @[Regfile.scala 138:53]
  assign sel_rows_17 = _T_165 ? rows_17 : 8'h0; // @[Regfile.scala 138:48]
  assign _T_166 = _T_116 ? sel_rows_17 : 8'h0; // @[Mux.scala 87:16]
  assign _T_167 = _T_112 ? sel_rows_16 : _T_166; // @[Mux.scala 87:16]
  assign _T_168 = _T_108 ? sel_rows_15 : _T_167; // @[Mux.scala 87:16]
  assign _T_169 = _T_104 ? sel_rows_14 : _T_168; // @[Mux.scala 87:16]
  assign _T_170 = _T_100 ? sel_rows_13 : _T_169; // @[Mux.scala 87:16]
  assign _T_171 = _T_96 ? sel_rows_12 : _T_170; // @[Mux.scala 87:16]
  assign _T_172 = _T_92 ? sel_rows_11 : _T_171; // @[Mux.scala 87:16]
  assign _T_173 = _T_88 ? sel_rows_10 : _T_172; // @[Mux.scala 87:16]
  assign _T_174 = _T_84 ? sel_rows_9 : _T_173; // @[Mux.scala 87:16]
  assign _T_175 = _T_80 ? sel_rows_8 : _T_174; // @[Mux.scala 87:16]
  assign _T_176 = _T_76 ? sel_rows_7 : _T_175; // @[Mux.scala 87:16]
  assign _T_177 = _T_72 ? sel_rows_6 : _T_176; // @[Mux.scala 87:16]
  assign _T_178 = _T_68 ? sel_rows_5 : _T_177; // @[Mux.scala 87:16]
  assign _T_179 = _T_64 ? sel_rows_4 : _T_178; // @[Mux.scala 87:16]
  assign _T_180 = _T_60 ? sel_rows_3 : _T_179; // @[Mux.scala 87:16]
  assign _T_181 = _T_56 ? sel_rows_2 : _T_180; // @[Mux.scala 87:16]
  assign _T_182 = _T_52 ? sel_rows_1 : _T_181; // @[Mux.scala 87:16]
  assign key_info = _T_48 ? sel_rows_0 : _T_182; // @[Mux.scala 87:16]
  assign io_apb_prdata = rd_en ? _T_146 : 32'h0; // @[Regfile.scala 127:19]
  assign io_apb_irq = ctl_int_r; // @[Regfile.scala 40:16]
  assign io_hs_key_ack = {{3'd0}, key_ack}; // @[Regfile.scala 29:19]
  assign io_ctl_ksen = ks_en; // @[Regfile.scala 147:15]
  assign io_ctl_wken = wk_en; // @[Regfile.scala 146:15]
  assign io_ctl_key_preinfo = key_info & ksie; // @[Regfile.scala 145:22]
  assign io_ctl_ioen = {ksoe,ksie}; // @[Regfile.scala 148:15]
  assign io_ctl_pol = pol; // @[Regfile.scala 149:14]
  assign io_ctl_deb_value = deb_value; // @[Regfile.scala 150:20]
  assign io_ctl_rintval_value = rintval_value; // @[Regfile.scala 151:24]
  assign io_ctl_sintval_value = sintval_value; // @[Regfile.scala 152:24]
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
  key_vld_d = _RAND_0[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  key_vld_dd = _RAND_1[3:0];
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
  `endif // RANDOMIZE
end
  always @(posedge clock) begin
    key_vld_d <= io_hs_key_vld;
    key_vld_dd <= key_vld_d;
    if (reset) begin
      key_ack <= 1'h0;
    end else begin
      key_ack <= key_vld_r;
    end
    ctl_int_d <= io_ctl_ctl_int;
    ctl_int_dd <= ctl_int_d;
    ctl_int_ddd <= ctl_int_dd;
    if (reset) begin
      ctl_int_r <= 1'h0;
    end else begin
      ctl_int_r <= _T_4;
    end
    if (reset) begin
      ks_en <= 1'h0;
    end else if (ks_en_wr) begin
      ks_en <= _T_11;
    end
    if (reset) begin
      wk_en <= 1'h0;
    end else if (ks_en_wr) begin
      wk_en <= _T_12;
    end
    if (reset) begin
      ksoe <= 18'h0;
    end else if (io_cfg_wr) begin
      ksoe <= _T_16;
    end
    if (reset) begin
      ksie <= 8'h0;
    end else if (io_cfg_wr) begin
      ksie <= _T_17;
    end
    if (reset) begin
      int_en <= 1'h0;
    end else if (int_cfg_wr) begin
      int_en <= _T_11;
    end
    if (reset) begin
      ksf <= 1'h0;
    end else if (_T_24) begin
      ksf <= _T_26;
    end else begin
      ksf <= _GEN_6;
    end
    if (reset) begin
      ksif <= 1'h0;
    end else if (_T_30) begin
      ksif <= _T_32;
    end else if (ctl_int_r) begin
      ksif <= int_en;
    end
    if (reset) begin
      pol <= 1'h0;
    end else if (ks_cfg_wr) begin
      pol <= _T_38;
    end
    if (reset) begin
      clr_key <= 1'h0;
    end else if (ks_cfg_wr) begin
      clr_key <= _T_39;
    end
    if (reset) begin
      sintval_value <= 4'h8;
    end else if (ks_cfg_wr) begin
      sintval_value <= _T_40;
    end
    if (reset) begin
      rintval_value <= 4'h0;
    end else if (ks_cfg_wr) begin
      rintval_value <= _T_41;
    end
    if (reset) begin
      deb_value <= 4'h4;
    end else if (ks_cfg_wr) begin
      deb_value <= _T_42;
    end
    if (reset) begin
      rows_0 <= 8'h0;
    end else if (clr_key) begin
      rows_0 <= 8'h0;
    end else if (_T_50) begin
      rows_0 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_1 <= 8'h0;
    end else if (clr_key) begin
      rows_1 <= 8'h0;
    end else if (_T_54) begin
      rows_1 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_2 <= 8'h0;
    end else if (clr_key) begin
      rows_2 <= 8'h0;
    end else if (_T_58) begin
      rows_2 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_3 <= 8'h0;
    end else if (clr_key) begin
      rows_3 <= 8'h0;
    end else if (_T_62) begin
      rows_3 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_4 <= 8'h0;
    end else if (clr_key) begin
      rows_4 <= 8'h0;
    end else if (_T_66) begin
      rows_4 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_5 <= 8'h0;
    end else if (clr_key) begin
      rows_5 <= 8'h0;
    end else if (_T_70) begin
      rows_5 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_6 <= 8'h0;
    end else if (clr_key) begin
      rows_6 <= 8'h0;
    end else if (_T_74) begin
      rows_6 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_7 <= 8'h0;
    end else if (clr_key) begin
      rows_7 <= 8'h0;
    end else if (_T_78) begin
      rows_7 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_8 <= 8'h0;
    end else if (clr_key) begin
      rows_8 <= 8'h0;
    end else if (_T_82) begin
      rows_8 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_9 <= 8'h0;
    end else if (clr_key) begin
      rows_9 <= 8'h0;
    end else if (_T_86) begin
      rows_9 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_10 <= 8'h0;
    end else if (clr_key) begin
      rows_10 <= 8'h0;
    end else if (_T_90) begin
      rows_10 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_11 <= 8'h0;
    end else if (clr_key) begin
      rows_11 <= 8'h0;
    end else if (_T_94) begin
      rows_11 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_12 <= 8'h0;
    end else if (clr_key) begin
      rows_12 <= 8'h0;
    end else if (_T_98) begin
      rows_12 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_13 <= 8'h0;
    end else if (clr_key) begin
      rows_13 <= 8'h0;
    end else if (_T_102) begin
      rows_13 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_14 <= 8'h0;
    end else if (clr_key) begin
      rows_14 <= 8'h0;
    end else if (_T_106) begin
      rows_14 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_15 <= 8'h0;
    end else if (clr_key) begin
      rows_15 <= 8'h0;
    end else if (_T_110) begin
      rows_15 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_16 <= 8'h0;
    end else if (clr_key) begin
      rows_16 <= 8'h0;
    end else if (_T_114) begin
      rows_16 <= io_hs_key_curinfo;
    end
    if (reset) begin
      rows_17 <= 8'h0;
    end else if (clr_key) begin
      rows_17 <= 8'h0;
    end else if (_T_118) begin
      rows_17 <= io_hs_key_curinfo;
    end
  end
endmodule
