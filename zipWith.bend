def List/zipWith(f, xs, ys):
  match xs:
    case List/Cons:
      match ys:
        case List/Cons:
          return List/Cons(f(xs.head, ys.head), List/zipWith(f, xs.tail, ys.tail))
        case List/Nil:
          return List/Nil
    case List/Nil:
      return List/Nil
