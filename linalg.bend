data list = (cons head tail) | nil

def prod(a,b):
  return a*b



def sum(nums):
  fold nums:
    case list/nil:
      return 0
    case list/cons:
      return nums.head + nums.tail

def dot(a, b):
  return sum(prod(a,b))



def main():
  a = [3,2,1]
  b = [1,2,3]
  return dot(a,b)