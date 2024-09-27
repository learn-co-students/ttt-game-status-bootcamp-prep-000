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
    [2,4,6],
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    bd0 = combo[0]
    bd1 = combo[1]
    bd2 = combo[2]

    if board[bd0] == "X" && board[bd1] == "X" && board[bd2] == "X"
      return combo
    elsif board[bd0] == "O" && board[bd1] == "O" && board[bd2] == "O"
      return combo
    end
  end
  return false
end

def full?(board)
  board.all? { |e| e == "X" || e == "O" }
end

def over?(board)
  if won?(board) || full?(board)
    return true
  else
    return false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    x = won?(board)
    y = board[x[0]]
    return y
  end
  return nil
end
