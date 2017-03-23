# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def won?(board)
 candidates = []
  WIN_COMBINATIONS.each do |comb|
    if comb.all? { |el| position_taken?(board,el) }
      candidates << comb
    end
  end

  candidates.each do |candidate|
    if candidate.all? { |el| board[el] == "X"}
      return candidate
    elsif candidate.all? { |e| board[e] == "O" }
      return candidate
    end
  end
  return false
end

def full?(board)
  if board.all? { |e| (e != " " && e != "" && e != nil) }
    return true
  end
  return false
end

def draw?(board)
  if( !won?(board) && full?(board ))
    return true
  end
  return false
end

def over?(board)
  if( won?(board) || draw?(board) || full?(board) )
    return true
  end
  return false
end

def winner(board)
  won = won?(board)
  if( won )
    return board[won[0]]
  end
  return nil
end
