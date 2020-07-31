package Keyscan

import chisel3._
import chisel3.util._

class Ctl extends Module {
  val io = IO(new Bundle {
    val hs = Flipped(new hs_io)
    val regfile = Flipped(new ctl_io)
    val gpio = new gpio
  })

  /**
   * definition
   */
  val cyc_value = Wire(UInt(5.W))
  val ks_idle :: ks_interval :: ks_step :: ks_deb :: ks_wait :: Nil = Enum(5)
  val n_ks_state = WireInit(ks_idle)
  val ks_state = RegNext(n_ks_state)
  val step_cnt_max = Wire(Bool())
  val cyc_cnt_shift = Wire(UInt(18.W))
  val valid_change = Wire(Bool())
  val rintval_finish = Wire(Bool())
  val sintval_finish = Wire(Bool())
  val cnt_complt = Wire(Bool())
  val key_vld = RegInit(0.U)

  // sync keyscan input
  val ks_in_d = RegNext(io.gpio.ks_in)
  val ks_in_dd = RegNext(ks_in_d)

  val out_en = io.regfile.ioen(25,8)
  val in_en = io.regfile.ioen(7,0)
  val pol = io.regfile.pol
  val ks_en = io.regfile.ksen
  val key_pre_st = io.regfile.key_preinfo
  val wk_en = io.regfile.wken

  val ks_in_mask = in_en & Mux(pol,ks_in_dd,~ks_in_dd).asUInt()
  val sel_cyc_value = for(i <- 0 to 17) yield cyc_value === i.U
  val sel_ks_in_mask = for(i <- 0 to 17) yield Mux(out_en(i),ks_in_mask,0.U)
  val key_cur_st = MuxCase(0.U,sel_cyc_value zip sel_ks_in_mask)
  val key_change = Mux((ks_state===ks_step) & step_cnt_max,!(key_pre_st===key_cur_st),0.U)
  val key_cur_st_d = RegNext(key_cur_st)
  val key_pulse = Mux(ks_state===ks_deb,!(key_cur_st === key_cur_st_d),0.U )

  /**
   * Generate ks_oe signal
   * 1. 1: gpio output is enabled, gpio=ks_out, 0: gpio output is disalbed, gpio = z state
   * 2. in  ks_wait, ks_idle, and ks_interval state, ks_oe=0
   * 3. in step state, ks_oe=1
   */
  val f_ks_oe = RegInit(0.U)
  val m_ks_oe = cyc_cnt_shift & out_en;
  when((ks_state===ks_interval || ks_state===ks_wait) && (n_ks_state===ks_step)){
    f_ks_oe := m_ks_oe
  }.elsewhen(n_ks_state===ks_interval || n_ks_state===ks_idle || n_ks_state===ks_wait){
    f_ks_oe := 0.U
  }

  /**
   * Generate ks_out signal
   * 1. out_en = 1, ks_out = polarity ? cyc_cnt : ~cyc_cnt
   * 2. out_en = 0, ks_out = ~polarity
   * 3. in ks_inteval and ks_idle state, ks_out = ~polarity
   */
  val f_ks_out = RegInit(0.U)
  val m_ks_out = Wire(Vec(18,UInt(1.W)))
  for(i<-0 to 17) m_ks_out(i) := Mux(out_en(i),Mux(pol,cyc_cnt_shift(i),~cyc_cnt_shift(i)),~pol)
  when((ks_state===ks_interval || ks_state===ks_wait) && (n_ks_state===ks_step)){
    f_ks_out := m_ks_out.asUInt()
  }.elsewhen(n_ks_state===ks_interval || n_ks_state===ks_idle){
    f_ks_out := Mux(pol,0.U,"h3ffff".U)
  }

  /**
   * Debounce counter
   * 1. debounce time = 2^deb_value + 1
   */
  val deb_value = io.regfile.deb_value
  val deb_cnt_max = ("h0001".U << deb_value).asUInt()
  val deb_cnt = RegInit(0.U(16.W))
  when(!ks_en){
    deb_cnt := 0.U
  }.elsewhen(ks_state===ks_deb && !valid_change){
    deb_cnt := deb_cnt + 1.U
  }.otherwise{
    deb_cnt := 0.U
  }
  valid_change := (deb_cnt===deb_cnt_max) && !key_pulse && !(key_cur_st === key_pre_st)

  /**
   * Scan interval counter
   * 1. sintval time = 2^sintval_value + 1
   */
  val sintval_value = io.regfile.sintval_value
  val sintval_cnt_max = ("h0001".U << sintval_value).asUInt()
  val sintval_cnt = RegInit(0.U(16.W))
  when(!ks_en){
    sintval_cnt := 0.U
  }.elsewhen(ks_state===ks_interval && !sintval_finish){
    sintval_cnt := sintval_cnt + 1.U
  }.otherwise{
    sintval_cnt := 0.U
  }
  sintval_finish := sintval_cnt===sintval_cnt_max

  /**
   * Row inteval counter
   */
  val rintval_value = io.regfile.rintval_value
  val rintval_cnt = RegInit(0.U(4.W))
  when(!ks_en){
    rintval_cnt:=0.U
  }.elsewhen(ks_state===ks_wait && !rintval_finish){
    rintval_cnt:= rintval_cnt + 1.U
  }.otherwise{
    rintval_cnt:=0.U
  }
  rintval_finish := rintval_cnt === rintval_value

  /**
   * Step counter
   */
  val step_cnt = RegInit(0.U(2.W))
  when(n_ks_state===ks_step){
    step_cnt:=step_cnt+1.U
  }.otherwise{
    step_cnt:=0.U
  }
  step_cnt_max := step_cnt===3.U

  /**
   * FSM
   * Current state : Next_state
   * idle          : interval
   * interval      : idle, step
   * step          : idle, deb, wait
   * deb           : idle, wait
   * wait          : idle, interval, step
   */

  switch(ks_state){
    is(ks_idle) {
      when(ks_en===1.U){
        n_ks_state:=ks_interval
      }.otherwise{
        n_ks_state := ks_state
      }
    }
    is(ks_interval){
      when(!ks_en){
        n_ks_state:=ks_idle
      }.elsewhen(sintval_finish){
        n_ks_state:=ks_step
      }.otherwise{
        n_ks_state := ks_state
      }
    }
    is(ks_step){
      when(!ks_en){
        n_ks_state:=ks_idle
      }.elsewhen(step_cnt_max){
        when(key_change.asBool()){
          n_ks_state:=ks_deb
        }.otherwise{
          n_ks_state:=ks_wait
        }
      }.otherwise{
        n_ks_state := ks_state
      }
    }
    is(ks_deb){
      when(!ks_en){
        n_ks_state:= ks_idle
      }.elsewhen((key_pulse | valid_change).asBool()){
        n_ks_state:=ks_wait
      }.otherwise{
        n_ks_state := ks_state
      }
    }
    is(ks_wait){
      when(!ks_en){
        n_ks_state:=ks_idle
      }.elsewhen(cnt_complt & !key_vld){
        n_ks_state:=ks_interval
      }.elsewhen(rintval_finish & !key_vld){
        n_ks_state := ks_step
      }.otherwise{
        n_ks_state := ks_state
      }
    }
  }

  /**
   * Cyc counter
   */
  val cyc_cnt = RegInit(0.U(18.W))
  cyc_cnt_shift := Cat(cyc_cnt(16,0),cyc_cnt(17))
  cnt_complt := cyc_cnt==="h20000".U
  switch(ks_state){
    is(ks_idle){
      cyc_cnt:=0.U
    }
    is(ks_interval){
      when(n_ks_state===ks_idle){
        cyc_cnt := 0.U
      }.elsewhen(n_ks_state===ks_step){
        cyc_cnt:=cyc_cnt_shift
      }.otherwise{
        cyc_cnt:="h20000".U
      }
    }
    is(ks_wait){
      when(n_ks_state===ks_step){
        cyc_cnt := cyc_cnt_shift
      }.elsewhen(n_ks_state===ks_interval){
        cyc_cnt:="h20000".U
      }
    }
  }

  // generate cyc_value
  when(cyc_cnt===0.U){
    cyc_value := 0.U
  }.otherwise{
    cyc_value := OHToUInt(cyc_cnt)
  }

  /**
   * Handshake interface
   * 1. Generate key_vld signal
   * 2. Write key cur info
   */
  val key_ack = io.hs.key_ack
  when(valid_change && !wk_en){
    key_vld := 1.U
  }.elsewhen((key_ack).asBool()){
    key_vld:=0.U
  }
  val key_curinfo = RegInit(0.U)
  when(valid_change){
    key_curinfo:=key_cur_st
  }.elsewhen(key_ack.asBool()){
    key_curinfo:=0.U
  }

  /**
   * Generate interrupt signal
   */
  val int_trig = RegInit(0.U)
  when(ks_state===ks_deb && valid_change){
    int_trig := 1.U
  }.elsewhen(ks_state===ks_idle || ks_state===ks_interval){
    int_trig := 0.U
  }
  val ctl_int = RegInit(0.U)
  when(ks_state===ks_interval){
    ctl_int := int_trig
  }.otherwise{
    ctl_int := 0.U
  }

  /**
   * Output signal
   */
  io.hs.key_curinfo := key_curinfo
  io.hs.key_vld := key_vld
  io.regfile.ctl_int := ctl_int
  io.regfile.cyc_value := cyc_value
  io.gpio.ks_oe := f_ks_oe
  io.gpio.ks_out := f_ks_out


}
