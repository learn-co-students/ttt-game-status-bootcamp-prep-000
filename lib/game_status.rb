# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [6,4,2], # Forward slash
  [0,4,8]  # Back slash
]

def won?(board)
  WIN_COMBINATIONS.each do|win_combination|
    if ((board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X") || (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"))
      return win_combination
    end
  end
  return false
end

def full?(board)
  board.detect do |element|
    if (element == " " || element == "")
      return false
    end
  end
  true
end

def draw?(board)
  if (won?(board) == false && full?(board) == true)
    return true
  elsif ((won?(board) == false && full?(board) == false) || won?(board) == true)
    false
  end
end

def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    return true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do|win_combination|
    if (board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X")
      return "X"
    elsif (board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O")
      return "O"
    end
  end
  nil
end
