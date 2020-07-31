//package Test

object exercise {
  def main(args:Array[String]):Unit={
//    args.foreach(arg=>println(arg))
//    println("Hello "+args(0)+"!")
    for(arg <- args)
      println(arg)
  }
}
