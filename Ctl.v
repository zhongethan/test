module Ctl(
  input         clock,
  input         reset,
  output [7:0]  io_hs_key_curinfo,
  output [3:0]  io_hs_key_vld,
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
  reg [17:0] cyc_cnt; // @[Ctl.scala 186:24]
  reg [31:0] _RAND_4;
  wire  _T_262; // @[Ctl.scala 212:15]
  wire [1:0] _T_263; // @[OneHot.scala 30:18]
  wire  _T_265; // @[OneHot.scala 32:14]
  wire [15:0] _T_264; // @[OneHot.scala 31:18]
  wire [15:0] _GEN_42; // @[OneHot.scala 32:28]
  wire [15:0] _T_266; // @[OneHot.scala 32:28]
  wire [7:0] _T_267; // @[OneHot.scala 30:18]
  wire  _T_269; // @[OneHot.scala 32:14]
  wire [7:0] _T_268; // @[OneHot.scala 31:18]
  wire [7:0] _T_270; // @[OneHot.scala 32:28]
  wire [3:0] _T_271; // @[OneHot.scala 30:18]
  wire  _T_273; // @[OneHot.scala 32:14]
  wire [3:0] _T_272; // @[OneHot.scala 31:18]
  wire [3:0] _T_274; // @[OneHot.scala 32:28]
  wire [1:0] _T_275; // @[OneHot.scala 30:18]
  wire  _T_277; // @[OneHot.scala 32:14]
  wire [1:0] _T_276; // @[OneHot.scala 31:18]
  wire [1:0] _T_278; // @[OneHot.scala 32:28]
  wire  _T_279; // @[CircuitMath.scala 30:8]
  wire [4:0] _T_283; // @[Cat.scala 29:58]
  wire [4:0] cyc_value; // @[Ctl.scala 212:22]
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
  reg [18:0] f_ks_oe; // @[Ctl.scala 53:24]
  reg [31:0] _RAND_7;
  wire [18:0] cyc_cnt_shift; // @[Ctl.scala 187:29]
  wire [18:0] _GEN_43; // @[Ctl.scala 54:31]
  wire [18:0] m_ks_oe; // @[Ctl.scala 54:31]
  wire  _T_44; // @[Ctl.scala 55:17]
  wire  _T_45; // @[Ctl.scala 55:43]
  wire  _T_46; // @[Ctl.scala 55:32]
  wire  _T_236; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_11; // @[Ctl.scala 145:24]
  wire  _T_238; // @[Conditional.scala 37:30]
  wire  _T_239; // @[Ctl.scala 148:12]
  reg [15:0] sintval_cnt; // @[Ctl.scala 98:28]
  reg [31:0] _RAND_8;
  wire [15:0] sintval_cnt_max; // @[Ctl.scala 97:36]
  wire  sintval_finish; // @[Ctl.scala 106:32]
  wire [2:0] _GEN_12; // @[Ctl.scala 150:33]
  wire [2:0] _GEN_13; // @[Ctl.scala 148:19]
  wire  _T_240; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_14; // @[Ctl.scala 158:34]
  wire [2:0] _GEN_15; // @[Ctl.scala 157:31]
  wire [2:0] _GEN_16; // @[Ctl.scala 155:19]
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
  wire  _T_245; // @[Ctl.scala 168:29]
  wire [2:0] _GEN_17; // @[Ctl.scala 168:54]
  wire [2:0] _GEN_18; // @[Ctl.scala 166:19]
  wire  _T_247; // @[Conditional.scala 37:30]
  wire  cnt_complt; // @[Ctl.scala 188:24]
  wire  _T_249; // @[Ctl.scala 175:31]
  wire  _T_250; // @[Ctl.scala 175:29]
  reg [3:0] rintval_cnt; // @[Ctl.scala 112:28]
  reg [31:0] _RAND_10;
  wire  rintval_finish; // @[Ctl.scala 120:33]
  wire  _T_252; // @[Ctl.scala 177:33]
  wire [2:0] _GEN_19; // @[Ctl.scala 177:44]
  wire [2:0] _GEN_20; // @[Ctl.scala 175:40]
  wire [2:0] _GEN_21; // @[Ctl.scala 173:19]
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
  wire [18:0] _GEN_27; // @[Ctl.scala 196:39]
  wire [18:0] _GEN_28; // @[Ctl.scala 194:33]
  wire [17:0] _GEN_29; // @[Ctl.scala 205:43]
  wire [18:0] _GEN_30; // @[Ctl.scala 203:33]
  wire [18:0] _GEN_31; // @[Conditional.scala 39:67]
  wire [18:0] _GEN_32; // @[Conditional.scala 39:67]
  wire [18:0] _GEN_33; // @[Conditional.scala 40:58]
  wire  _T_284; // @[Ctl.scala 224:24]
  wire  _T_285; // @[Ctl.scala 224:21]
  wire  _GEN_35; // @[Ctl.scala 226:33]
  wire  _GEN_36; // @[Ctl.scala 224:31]
  reg [7:0] key_curinfo; // @[Ctl.scala 229:28]
  reg [31:0] _RAND_12;
  reg  int_trig; // @[Ctl.scala 239:25]
  reg [31:0] _RAND_13;
  wire  _T_289; // @[Ctl.scala 240:26]
  wire  _T_290; // @[Ctl.scala 242:22]
  wire  _T_292; // @[Ctl.scala 242:33]
  wire  _GEN_39; // @[Ctl.scala 242:59]
  wire  _GEN_40; // @[Ctl.scala 240:42]
  reg  ctl_int; // @[Ctl.scala 245:24]
  reg [31:0] _RAND_14;
  wire  _GEN_41; // @[Ctl.scala 246:31]
  assign out_en = io_regfile_ioen[25:8]; // @[Ctl.scala 32:31]
  assign in_en = io_regfile_ioen[7:0]; // @[Ctl.scala 33:30]
  assign _T = ~ ks_in_dd; // @[Ctl.scala 39:45]
  assign _T_1 = io_regfile_pol ? ks_in_dd : _T; // @[Ctl.scala 39:31]
  assign ks_in_mask = in_en & _T_1; // @[Ctl.scala 39:26]
  assign _T_262 = cyc_cnt == 18'h0; // @[Ctl.scala 212:15]
  assign _T_263 = cyc_cnt[17:16]; // @[OneHot.scala 30:18]
  assign _T_265 = _T_263 != 2'h0; // @[OneHot.scala 32:14]
  assign _T_264 = cyc_cnt[15:0]; // @[OneHot.scala 31:18]
  assign _GEN_42 = {{14'd0}, _T_263}; // @[OneHot.scala 32:28]
  assign _T_266 = _GEN_42 | _T_264; // @[OneHot.scala 32:28]
  assign _T_267 = _T_266[15:8]; // @[OneHot.scala 30:18]
  assign _T_269 = _T_267 != 8'h0; // @[OneHot.scala 32:14]
  assign _T_268 = _T_266[7:0]; // @[OneHot.scala 31:18]
  assign _T_270 = _T_267 | _T_268; // @[OneHot.scala 32:28]
  assign _T_271 = _T_270[7:4]; // @[OneHot.scala 30:18]
  assign _T_273 = _T_271 != 4'h0; // @[OneHot.scala 32:14]
  assign _T_272 = _T_270[3:0]; // @[OneHot.scala 31:18]
  assign _T_274 = _T_271 | _T_272; // @[OneHot.scala 32:28]
  assign _T_275 = _T_274[3:2]; // @[OneHot.scala 30:18]
  assign _T_277 = _T_275 != 2'h0; // @[OneHot.scala 32:14]
  assign _T_276 = _T_274[1:0]; // @[OneHot.scala 31:18]
  assign _T_278 = _T_275 | _T_276; // @[OneHot.scala 32:28]
  assign _T_279 = _T_278[1]; // @[CircuitMath.scala 30:8]
  assign _T_283 = {_T_265,_T_269,_T_273,_T_277,_T_279}; // @[Cat.scala 29:58]
  assign cyc_value = _T_262 ? 5'h0 : _T_283; // @[Ctl.scala 212:22]
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
  assign cyc_cnt_shift = {cyc_cnt, 1'h0}; // @[Ctl.scala 187:29]
  assign _GEN_43 = {{1'd0}, out_en}; // @[Ctl.scala 54:31]
  assign m_ks_oe = cyc_cnt_shift & _GEN_43; // @[Ctl.scala 54:31]
  assign _T_44 = ks_state == 3'h1; // @[Ctl.scala 55:17]
  assign _T_45 = ks_state == 3'h4; // @[Ctl.scala 55:43]
  assign _T_46 = _T_44 | _T_45; // @[Ctl.scala 55:32]
  assign _T_236 = 3'h0 == ks_state; // @[Conditional.scala 37:30]
  assign _GEN_11 = io_regfile_ksen ? 3'h1 : 3'h0; // @[Ctl.scala 145:24]
  assign _T_238 = 3'h1 == ks_state; // @[Conditional.scala 37:30]
  assign _T_239 = io_regfile_ksen == 1'h0; // @[Ctl.scala 148:12]
  assign sintval_cnt_max = 16'h1 << io_regfile_sintval_value; // @[Ctl.scala 97:36]
  assign sintval_finish = sintval_cnt == sintval_cnt_max; // @[Ctl.scala 106:32]
  assign _GEN_12 = sintval_finish ? 3'h2 : 3'h0; // @[Ctl.scala 150:33]
  assign _GEN_13 = _T_239 ? 3'h0 : _GEN_12; // @[Ctl.scala 148:19]
  assign _T_240 = 3'h2 == ks_state; // @[Conditional.scala 37:30]
  assign _GEN_14 = key_change ? 3'h3 : 3'h4; // @[Ctl.scala 158:34]
  assign _GEN_15 = step_cnt_max ? _GEN_14 : 3'h0; // @[Ctl.scala 157:31]
  assign _GEN_16 = _T_239 ? 3'h0 : _GEN_15; // @[Ctl.scala 155:19]
  assign _T_243 = 3'h3 == ks_state; // @[Conditional.scala 37:30]
  assign deb_cnt_max = 16'h1 << io_regfile_deb_value; // @[Ctl.scala 81:32]
  assign _T_212 = deb_cnt == deb_cnt_max; // @[Ctl.scala 90:27]
  assign _T_213 = key_pulse == 1'h0; // @[Ctl.scala 90:46]
  assign _T_214 = _T_212 & _T_213; // @[Ctl.scala 90:43]
  assign _T_215 = key_cur_st == io_regfile_key_preinfo; // @[Ctl.scala 90:73]
  assign _T_216 = _T_215 == 1'h0; // @[Ctl.scala 90:60]
  assign valid_change = _T_214 & _T_216; // @[Ctl.scala 90:57]
  assign _T_245 = key_pulse | valid_change; // @[Ctl.scala 168:29]
  assign _GEN_17 = _T_245 ? 3'h4 : 3'h0; // @[Ctl.scala 168:54]
  assign _GEN_18 = _T_239 ? 3'h0 : _GEN_17; // @[Ctl.scala 166:19]
  assign _T_247 = 3'h4 == ks_state; // @[Conditional.scala 37:30]
  assign cnt_complt = cyc_cnt == 18'h20000; // @[Ctl.scala 188:24]
  assign _T_249 = key_vld == 1'h0; // @[Ctl.scala 175:31]
  assign _T_250 = cnt_complt & _T_249; // @[Ctl.scala 175:29]
  assign rintval_finish = rintval_cnt == io_regfile_rintval_value; // @[Ctl.scala 120:33]
  assign _T_252 = rintval_finish & _T_249; // @[Ctl.scala 177:33]
  assign _GEN_19 = _T_252 ? 3'h2 : 3'h0; // @[Ctl.scala 177:44]
  assign _GEN_20 = _T_250 ? 3'h1 : _GEN_19; // @[Ctl.scala 175:40]
  assign _GEN_21 = _T_239 ? 3'h0 : _GEN_20; // @[Ctl.scala 173:19]
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
  assign _GEN_27 = _T_47 ? cyc_cnt_shift : 19'h20000; // @[Ctl.scala 196:39]
  assign _GEN_28 = _T_50 ? 19'h0 : _GEN_27; // @[Ctl.scala 194:33]
  assign _GEN_29 = _T_49 ? 18'h20000 : cyc_cnt; // @[Ctl.scala 205:43]
  assign _GEN_30 = _T_47 ? cyc_cnt_shift : {{1'd0}, _GEN_29}; // @[Ctl.scala 203:33]
  assign _GEN_31 = _T_247 ? _GEN_30 : {{1'd0}, cyc_cnt}; // @[Conditional.scala 39:67]
  assign _GEN_32 = _T_238 ? _GEN_28 : _GEN_31; // @[Conditional.scala 39:67]
  assign _GEN_33 = _T_236 ? 19'h0 : _GEN_32; // @[Conditional.scala 40:58]
  assign _T_284 = io_regfile_wken == 1'h0; // @[Ctl.scala 224:24]
  assign _T_285 = valid_change & _T_284; // @[Ctl.scala 224:21]
  assign _GEN_35 = io_hs_key_ack ? 1'h0 : key_vld; // @[Ctl.scala 226:33]
  assign _GEN_36 = _T_285 | _GEN_35; // @[Ctl.scala 224:31]
  assign _T_289 = _T_41 & valid_change; // @[Ctl.scala 240:26]
  assign _T_290 = ks_state == 3'h0; // @[Ctl.scala 242:22]
  assign _T_292 = _T_290 | _T_44; // @[Ctl.scala 242:33]
  assign _GEN_39 = _T_292 ? 1'h0 : int_trig; // @[Ctl.scala 242:59]
  assign _GEN_40 = _T_289 | _GEN_39; // @[Ctl.scala 240:42]
  assign _GEN_41 = _T_44 & int_trig; // @[Ctl.scala 246:31]
  assign io_hs_key_curinfo = key_curinfo; // @[Ctl.scala 255:21]
  assign io_hs_key_vld = {{3'd0}, key_vld}; // @[Ctl.scala 256:17]
  assign io_regfile_cyc_value = _T_262 ? 5'h0 : _T_283; // @[Ctl.scala 258:24]
  assign io_regfile_ctl_int = ctl_int; // @[Ctl.scala 257:22]
  assign io_gpio_ks_out = f_ks_out; // @[Ctl.scala 260:18]
  assign io_gpio_ks_oe = f_ks_oe[17:0]; // @[Ctl.scala 259:17]
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
  f_ks_oe = _RAND_7[18:0];
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
end
  always @(posedge clock) begin
    if (_T_236) begin
      if (io_regfile_ksen) begin
        ks_state <= 3'h1;
      end else begin
        ks_state <= 3'h0;
      end
    end else if (_T_238) begin
      if (_T_239) begin
        ks_state <= 3'h0;
      end else if (sintval_finish) begin
        ks_state <= 3'h2;
      end else begin
        ks_state <= 3'h0;
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
      end else begin
        ks_state <= 3'h0;
      end
    end else if (_T_243) begin
      if (_T_239) begin
        ks_state <= 3'h0;
      end else if (_T_245) begin
        ks_state <= 3'h4;
      end else begin
        ks_state <= 3'h0;
      end
    end else if (_T_247) begin
      if (_T_239) begin
        ks_state <= 3'h0;
      end else if (_T_250) begin
        ks_state <= 3'h1;
      end else if (_T_252) begin
        ks_state <= 3'h2;
      end else begin
        ks_state <= 3'h0;
      end
    end else begin
      ks_state <= 3'h0;
    end
    if (reset) begin
      key_vld <= 1'h0;
    end else begin
      key_vld <= _GEN_36;
    end
    ks_in_d <= io_gpio_ks_in;
    ks_in_dd <= ks_in_d;
    if (reset) begin
      cyc_cnt <= 18'h0;
    end else begin
      cyc_cnt <= _GEN_33[17:0];
    end
    if (reset) begin
      step_cnt <= 2'h0;
    end else if (_T_47) begin
      step_cnt <= _T_234;
    end else begin
      step_cnt <= 2'h0;
    end
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
    if (reset) begin
      f_ks_oe <= 19'h0;
    end else if (_T_48) begin
      f_ks_oe <= m_ks_oe;
    end else if (_T_53) begin
      f_ks_oe <= 19'h0;
    end
    if (reset) begin
      sintval_cnt <= 16'h0;
    end else if (_T_239) begin
      sintval_cnt <= 16'h0;
    end else if (_T_221) begin
      sintval_cnt <= _T_223;
    end else begin
      sintval_cnt <= 16'h0;
    end
    if (reset) begin
      deb_cnt <= 16'h0;
    end else if (_T_239) begin
      deb_cnt <= 16'h0;
    end else if (_T_209) begin
      deb_cnt <= _T_211;
    end else begin
      deb_cnt <= 16'h0;
    end
    if (reset) begin
      rintval_cnt <= 4'h0;
    end else if (_T_239) begin
      rintval_cnt <= 4'h0;
    end else if (_T_228) begin
      rintval_cnt <= _T_230;
    end else begin
      rintval_cnt <= 4'h0;
    end
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
    if (reset) begin
      int_trig <= 1'h0;
    end else begin
      int_trig <= _GEN_40;
    end
    if (reset) begin
      ctl_int <= 1'h0;
    end else begin
      ctl_int <= _GEN_41;
    end
  end
endmodule
