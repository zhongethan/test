package Test


object MyTest {
  // 斐波那契数列
  // 0 1 1 2 3 5 8
  def fib(n:Int) : Int = {
    if(n<=1) 0
    else if(n==2) 1
    else fib(n-1)+fib(n-2)
  }

  // 模式匹配
  sealed trait List[+A]
  case object Nil extends List[Nothing]
  case class Cons[+A](head:A,tail:List[A]) extends List[A]
  object List{
    def sum (ints:List[Int]):Int = ints match {
      case Nil => 0
      case Cons(x,xs) => x+sum(xs)
    }
    def product (ds:List[Double]):Double =ds match{
      case Nil => 1.0
      case Cons(0.0,_) => 0.0
      case Cons(x,xs) => x*product(xs)
    }
    def apply[A](as:A*):List[A] =
      if(as.isEmpty) Nil
      else Cons(as.head,apply(as.tail:_*))
  }

  // ex3.1
  val x = List(1,2,3,4,5) match {
    case Cons(x,Cons(2,Cons(4,_))) => x
    case Nil => 42
    case Cons(x,Cons(y,Cons(3,Cons(4,_)))) => x*y
    case Cons(h, t) => h + List.sum(t)
    case _ => 101
  }
  // ex3.2
  def tail[A](list: List[A]):List[A] = list match {
    case Nil => Nil
    case Cons(_,Nil) => Nil
    case Cons(_,t) => t
  }
  def main(args:Array[String]):Unit = {
    println((List(1,2,3,4,5)))
  }
}
