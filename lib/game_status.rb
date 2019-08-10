# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |cond|
    term1 = cond[0]
    term2 = cond[1]
    term3 = cond[2]

    p1 = board[term1]
    p2 = board[term2]
    p3 = board[term3]

    if p1 != " " && p1 == p2 && p2 == p3
      return cond
    end
  end
  return false
end


def full?(board)
  return !board.include?(" ")
end

def draw?(board)
  if full?(board)
    return !won?(board)
  else false
  end
end

def over?(board)
  if full?(board) || won?(board)
    return true
  else false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end
