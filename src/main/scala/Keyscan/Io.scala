package Keyscan

import chisel3._


class global_io extends Bundle{
  val pclk = Input(Clock())
  val presetn = Input(AsyncReset())
  val sclk = Input(Clock())
  val sresetn = Input(AsyncReset())
}

class apb_io extends Bundle{
  val psel = Input(UInt(1.W))
  val pwrite = Input(UInt(1.W))
  val penable = Input( UInt(1.W))
  val paddr = Input(UInt(6.W))
  val pwdata = Input(UInt(32.W))
  val prdata = Output(UInt(32.W))
  val irq = Output(UInt(1.W))
}

class hs_io extends Bundle{
  // handshake interface
  val key_curinfo = Input(UInt(8.W))
  val key_vld = Input(UInt(1.W))
  val key_ack = Output(UInt(1.W))
}

class ctl_io extends Bundle{
  // regfile and ctl module interface
  val ksen  = Output(UInt(1.W))
  val wken = Output(UInt(1.W))
  val key_preinfo = Output(UInt(8.W))
  val ioen = Output(UInt(26.W))
  val pol = Output(Bool())
  val deb_value = Output(UInt(4.W))
  val rintval_value = Output(UInt(4.W))
  val sintval_value = Output(UInt(4.W))
  val cyc_value = Input(UInt(5.W))
  val ctl_int = Input(UInt(1.W))
}

class gpio extends Bundle{
  val ks_in = Input(UInt(8.W))
  val ks_out = Output(UInt(18.W))
  val ks_oe = Output(UInt(18.W))
}


