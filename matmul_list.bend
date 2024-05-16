
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


def List/map(f, list):
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
          return List/Cons {head: List/map(head, matrix), tail: transpose(List/map(tail, matrix))}
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


def random_row(m, seed):
  bend k = 0, s=seed:
    when k < m:
      s = s ^ (s * 0b10000000000000)
      s = s ^ (s / 0b100000000000000000)
      s = s ^ (s * 0b100000)
      return List/Cons {head: s, tail: fork(k+1, s)}
    else:
      return List/Nil

def random_matrix(n, m, seed):
  bend j = 0, s = seed:
    when j < n:
      s += 42
      return List/Cons {head: random_row(m, s), tail: fork(j+1, s)}
    else:
      return List/Nil

def main():
  N = 50
  seed_a = 42
  seed_b = 42069
  a = random_matrix(N, N, seed_a)
  b = random_matrix(N, N, seed_b)
  return matmul(a, b)