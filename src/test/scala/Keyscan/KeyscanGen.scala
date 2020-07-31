package Keyscan

import chisel3._

object KeyscanGen extends App {
  //chisel3.Driver.execute(args,()=>new Ctl)
  //chisel3.Driver.execute(args,()=>new Regfile)
  //chisel3.Driver.execute(args,()=>new Hssync(8))
  chisel3.Driver.execute(args,()=>new KeyscanTop)
}
