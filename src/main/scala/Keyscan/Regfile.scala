package Keyscan

import chisel3._
import chisel3.util._

import scala.collection._

class Regfile extends Module{
  val io = IO(new Bundle() {
    val apb = new apb_io
    val hs = new hs_io
    val ctl = new ctl_io
  })

  /**
   * Handshake interface
   * Generate key_ack signal
   */

    val key_vld_d = RegNext(io.hs.key_vld)
    val key_vld_dd = RegNext(key_vld_d)
    val key_ack = RegInit(0.U)
    val key_vld_r = (key_vld_dd === 0.U) & (key_vld_d === 1.U) // rising edge of key_vld signal
    when(key_vld_r) {
      key_ack := 1.U
    }.otherwise {
      key_ack := 0.U
    }
    io.hs.key_ack := key_ack


    /**
     * Generate interrupt signal
     */
    val ctl_int_d = RegNext(io.ctl.ctl_int)
    val ctl_int_dd = RegNext(ctl_int_d)
    val ctl_int_ddd = RegNext(ctl_int_dd)
    val ctl_int_r = RegInit(0.U(1.W)) // rising edge of ctl_int
    ctl_int_r := !ctl_int_ddd && (ctl_int_dd === 1.U)
    io.apb.irq := ctl_int_r

    /** reg_idx : reg
     * 0: ks_en register
     * 1: io_config register
     * 2: int_config register
     * 3: ks_config register
     * 4: ks_info0 register
     * 5: ks_info1 register
     * 6: ks_info2 register
     * 7: ks_info3 register
     * 8: ks_info4 register
     */
    // initial register
    val wr_en = (io.apb.psel & io.apb.penable & io.apb.pwrite)
    val rd_en = io.apb.psel & (!io.apb.penable) & (!io.apb.pwrite)
    val reg_idx = io.apb.paddr

    val ks_en_wr = ((reg_idx === 0.U) & wr_en)
    val ks_en = {RegInit(0.U(1.W))}
    val wk_en = {RegInit(0.U(1.W))}
    when(ks_en_wr === 1.U) {
      ks_en := io.apb.pwdata(0)
      wk_en := io.apb.pwdata(1)
    }.elsewhen(ctl_int_r===1.U && (!wk_en)){
      ks_en := 0.U
    }
    val ks_en_bus = Cat(0.U(30.W), wk_en,ks_en)

    val io_cfg_wr = ((reg_idx === 1.U) & wr_en)
    val ksoe = {RegInit(0.U(18.W))}
    val ksie = {RegInit(0.U(8.W))}
    when(io_cfg_wr === 1.U) {
      ksoe := io.apb.pwdata(25, 8)
      ksie := io.apb.pwdata(7, 0)
    }
    val io_cfg_bus = Cat(0.U(6.W), ksoe, ksie)

    val int_cfg_wr = ((reg_idx === 2.U) & wr_en)
    val int_en = {RegInit(0.U(1.W))}
    val ksf = {RegInit(0.U(1.W))}
    val ksif = {RegInit(0.U(1.W))}
    when(int_cfg_wr === 1.U) {
      int_en := io.apb.pwdata(0)
    }
    when(int_cfg_wr === 1.U && io.apb.pwdata(1)) { // write 1 to clear this bit
      ksf := ~io.apb.pwdata(1)
    }.elsewhen(ctl_int_r === 1.U) {
      ksf := 1.U
    }
    when(int_cfg_wr === 1.U && io.apb.pwdata(2)) { // write 1 to clear this bit
      ksif := ~io.apb.pwdata(2)
    }.elsewhen(ctl_int_r === 1.U) {
      ksif := int_en // ksif = 0 while int is masked
    }
    val int_cfg_bus = Cat(0.U(29.W), ksif, ksf, int_en)

    val ks_cfg_wr = (reg_idx === 3.U) & wr_en
    val pol = {RegInit(0.U(1.W))}
    val clr_key = {RegInit(0.U(1.W))}
    val sintval_value = {RegInit(8.U(4.W))}
    val rintval_value = {RegInit(0.U(4.W))}
    val deb_value = {RegInit(4.U(4.W))}
    when(ks_cfg_wr === 1.U) {
      pol := io.apb.pwdata(13)
      clr_key := io.apb.pwdata(12)
      sintval_value := io.apb.pwdata(11, 8)
      rintval_value := io.apb.pwdata(7, 4)
      deb_value := io.apb.pwdata(3, 0)
    }.otherwise{
      clr_key := 0.U
    }
    val ks_cfg_bus = Cat(0.U(18.W), pol, clr_key, sintval_value, rintval_value, deb_value)

    val rows = mutable.ArrayBuffer[UInt]()
    for (i <- 0 to 17) {
      rows += {RegInit(0.U(8.W))}
      when(clr_key === 1.U) {
        rows(i) := 0.U
      }.elsewhen((io.ctl.cyc_value === i.U) && (key_vld_r === 1.U)) {
        rows(i) := io.hs.key_curinfo
      }.otherwise {
        rows(i) := rows(i)
      }
    }
    val ks_info0_bus = Cat(rows(3), rows(2), rows(1), rows(0))
    val ks_info1_bus = Cat(rows(7), rows(6), rows(5), rows(4))
    val ks_info2_bus = Cat(rows(11), rows(10), rows(9), rows(8))
    val ks_info3_bus = Cat(rows(15), rows(14), rows(13), rows(12))
    val ks_info4_bus = Cat(0.U(16.W), rows(17), rows(16))

    val prdata = MuxCase(0.U(32.W), Array((reg_idx === 0.U) -> ks_en_bus,
      (reg_idx === 1.U) -> io_cfg_bus,
      (reg_idx === 2.U) -> int_cfg_bus,
      (reg_idx === 3.U) -> ks_cfg_bus,
      (reg_idx === 4.U) -> ks_info0_bus,
      (reg_idx === 5.U) -> ks_info1_bus,
      (reg_idx === 6.U) -> ks_info2_bus,
      (reg_idx === 7.U) -> ks_info3_bus,
      (reg_idx === 8.U) -> ks_info4_bus))
    val prdata_d = RegInit(0.U)
    when(rd_en.asBool()) {
      prdata_d := prdata
    }
    io.apb.prdata := prdata_d

    val sel_cyc_value = for (i <- 0 to 17) yield io.ctl.cyc_value === i.U
    val sel_rows = for (i <- 0 to 17) yield Mux(ksoe(i), rows(i), 0.U)
    val key_info = MuxCase(0.U(8.W), sel_cyc_value zip sel_rows)


  /**
   * CTL and REGFILE interface
   */
  io.ctl.key_preinfo := key_info & ksie
  io.ctl.wken := wk_en
  io.ctl.ksen := ks_en
  io.ctl.ioen := Cat(ksoe, ksie)
  io.ctl.pol := pol
  io.ctl.deb_value := deb_value
  io.ctl.rintval_value := rintval_value
  io.ctl.sintval_value := sintval_value

}

