package Keyscan
import chisel3._

class KeyscanTop extends RawModule {
  val io = IO(new Bundle() {
    val global = new global_io
    val apb = new apb_io
    val gpio = new gpio
  })

  val hssync = Module(new Hssync(8))
  val regfile = withClockAndReset(io.global.pclk,io.global.presetn){Module(new Regfile)}
  val ctl = withClockAndReset(io.global.sclk,io.global.sresetn) {Module(new Ctl)}

  io.apb <> regfile.io.apb
  io.global <> hssync.io.global
  io.gpio <> ctl.io.gpio
  regfile.io.hs <> hssync.io.slave
  ctl.io.regfile <> regfile.io.ctl
  ctl.io.hs <> hssync.io.master
}
