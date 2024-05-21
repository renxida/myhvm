type BlockMatrix:
  Blocks { ~a, ~b, ~c, ~d }
  Cell { val }
  Nil

def BlockMatrix/FromList(m):
  match m:
    case BlockMatrix/Nil:
      return [[]]
    case BlockMatrix/Cell:
      return [[m.val]]
    case BlockMatrix/Cell:
      // break the block matrix down to rows and concat the results
      
