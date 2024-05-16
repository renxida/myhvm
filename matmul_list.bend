
def prod(a,b):
  return a*b



def sum(nums):
  fold nums:
    case List/Nil: 
      return 0
    case List/Cons:
      return nums.head + nums.tail

def dot(a, b):
  return sum(prod(a,b))


def head(list):
  match list:
    case List/Cons:
      return list.head
    case List/Nil :
      return list


def tail(list):
  match list:
    case List/Cons:
      return list.tail
    case List/Nil:
      return list


def List.map(f, list):
  fold list:
    case List/Cons:
      return List/Cons {head: f(list.head), tail: list.tail}
    case List/Nil:
      return List/Nil

def transpose(matrix):
  match matrix:
    case List/Cons:
      match head(matrix):
        case List/Cons:
          return List/Cons {head: List.map(head, matrix), tail: transpose(List.map(tail, matrix))}
        case List/Nil:
          return List/Nil
    case List/Nil:
      return List/Nil
      

def mv(mat, vec):
  match mat:
    case List/Nil:
      return List/Nil
    case List/Cons:
      return List/Cons {
        head: dot(mat.head, vec),
        tail: mv(mat.tail, vec)
      }
        

def matmul(a, b):
  bt = transpose(b)
  match a:
    case List/Nil:
      return List/Nil
    case List/Cons:
      return List/Cons {
        head: mv(bt, a.head)
        tail: matmul(a.tail, b)
      }
