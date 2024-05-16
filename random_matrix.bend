
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
  m = 50
  return random_matrix(m, m, 42069)