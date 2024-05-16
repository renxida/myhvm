
def prod(a,b):
  return a*b



def sum(nums):
  fold nums:
    case List/nil: 
      return 0
    case List/cons:
      return nums.head + nums.tail

def dot(a, b):
  return sum(prod(a,b))


def head(list):
  match list:
    case List/cons:
      return list.head
    case List/nil :
      return list


def tail(list):
  match list:
    case List/cons:
      return list.tail
    case List/nil:
      return list


def List.map(f, list):
  fold list:
    case List/cons:
      return List/cons {head: f(list.head), tail: list.tail}
    case List/nil:
      return List/nil

def transpose(matrix):
  match matrix:
    case List/cons:
      match head(matrix):
        case List/cons:
          return List/cons {head: List.map(head, matrix), tail: transpose(List.map(tail, matrix))}
        case List/nil:
          return List/nil
    case List/nil:
      return List/nil
      

def mv(mat, vec):
  match mat:
    case List/nil:
      return List/nil
    case List/cons:
      return List/cons {
        head: dot(mat.head, vec),
        tail: mv(mat.tail, vec)
      }
        

def matmul(a, b):
  bt = transpose(b)
  match a:
    case List/nil:
      return List/nil
    case List/cons:
      return List/cons {
        head: mv(bt, a.head)
        tail: matmul(a.tail, b)
      }
  
def main():
  a = [[1,2,3],[4,5,6],[7,8,9]]
  b = [[1,2,3],[4,5,6],[7,8,9]]
  return matmul(a, b)
