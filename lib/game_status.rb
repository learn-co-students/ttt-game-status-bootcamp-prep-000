# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [0,3,6],
  [0,4,8],
  [1,4,7],
  [2,5,8],
  [3,4,5],
  [6,7,8],
  [6,4,2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |winning_array|
  win1 = winning_array[0]
  win2 = winning_array[1]
  win3 = winning_array[2]
  if board[win1] == "X" && board[win2] == "X" && board[win3] == "X"
    true
  elsif board[win1] == "O" && board[win2] == "O" && board[win3] == "O"
    true
  else false
  end
end
end


def full?(board)
  full = board.all? do |index|
    index == "X" || index == "O"
  end
  return full
end

def over?(board)
  if won?(board) != nil || draw?(board) == true
    return true
  else
    return false
  end
end

def draw?(board)
  full = full?(board)
  won = won?(board)
  if full == false
    return false
  elsif full == true && won != nil
    return false
  else
    return true
  end
end

def winner(board)
  win = won?(board)
  if win != nil
    return board[win[0]]
  else
    return nil
  end
end
