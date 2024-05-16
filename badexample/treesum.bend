enum MyTree:
  Node(val, ~left, ~right)
  Leaf

def MyTree.sum(x):
  # Sum all the values in the tree.
  fold x:
    # The fold is implicitly called for fields marked with '~' in their definition.
    Node:
      return val + x.left + x.right
    Leaf:
      return 0

def main:
  bend val = 0 while val < 0:
    # 'fork' calls the bend recursively with the provided values.
    x = Node(val=val, left=fork(val + 1), right=fork(val + 1))
  then:
    # 'then' is the base case, when the condition fails.
    x = Leaf

  return MyTree.sum(x)
