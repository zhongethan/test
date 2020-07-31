package Keyscan

import chisel3._
import chisel3.util._

// handshake sync module
class Hssync(datawidth:Int) extends RawModule{
  val io = IO(new Bundle() {
    val global = new global_io
    val master = new hs_io
    val slave = Flipped(new hs_io)
  })
  val req_mclk = Wire(UInt())
  val ack_sclk = Wire(UInt())

  //fsm in hclk domain
  val m_reset :: m_wait_req :: m_wait_ack :: m_wait_nack :: Nil = Enum(4)
  withClockAndReset(io.global.sclk,io.global.sresetn){
    val ack_mclk =  {RegNext(ack_sclk)}
    val ack_mclk_d = {RegNext(ack_mclk)}
    val mabort_nack = !ack_mclk_d
    val m_state = {RegInit(m_reset)}
    switch(m_state) {
      is(m_reset){
        m_state := m_wait_req
      }
      is(m_wait_req) {
        when(io.master.key_vld === 1.U){
          m_state := m_wait_ack
        }}
      is(m_wait_ack){
        when(!io.master.key_vld){
          m_state := m_wait_req
        }.elsewhen(ack_mclk_d===1.U){
          m_state := m_wait_nack
        }
      }
      is(m_wait_nack){
        when(mabort_nack){
          m_state := m_wait_req
        }
      }
    }
    req_mclk := (m_state === m_wait_req) && io.master.key_vld === 1.U ||
                    (m_state === m_wait_ack) && (!ack_mclk_d)

    io.master.key_ack := (m_state === m_wait_ack) && (ack_mclk_d===1.U)
  }
  //fsm in sclk domain

  val s_reset :: s_wait_req :: s_wait_ack :: s_wait_nreq :: Nil = Enum(4)
  withClockAndReset(io.global.pclk,io.global.presetn){
    val s_state = {RegInit(s_reset)}
    val req_sclk = {RegNext(req_mclk)}
    val req_sclk_d = {RegNext(req_sclk)}
    switch(s_state){
      is(s_reset){
        s_state := s_wait_req
      }
      is(s_wait_req){
        when(req_sclk_d===1.U){s_state := s_wait_ack}
      }
      is(s_wait_ack){
        when(io.slave.key_ack === 1.U) {s_state := s_wait_nreq}
      }
      is(s_wait_nreq){
        when(!req_sclk_d) {s_state := s_wait_req}
      }
    }
    io.slave.key_vld := (s_state === s_wait_ack) || ((s_state === s_wait_req) && (req_sclk_d=== 1.U))
    ack_sclk := (s_state === s_wait_nreq) && (req_sclk_d === 1.U)
  }

  io.slave.key_curinfo := io.master.key_curinfo

}
