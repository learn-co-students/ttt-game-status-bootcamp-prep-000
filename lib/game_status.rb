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

def won? (board)
  WIN_COMBINATIONS.each do |combo|
    if equality?(board,combo)
      return combo
    end
  end
  return nil
end

def equality?(board,combination)
  board_vals = []
  combination.each do |val|
    board_vals << board[val]
  end
  if board_vals.all?{|space| space == "X"} || board_vals.all?{|space| space == "O"}
    return true
  else
    return false
  end
end

def full?(board)
  if board.none?{|val| val==""} && board.none?{|val| val==" "}
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
