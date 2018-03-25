# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]

def won?(board)
  WIN_COMBINATIONS.each do |win_condition|
    if ((board[win_condition[0]] == "X" && board[win_condition[1]] == "X" && board[win_condition[2]] == "X") ||
        (board[win_condition[0]] == "O" && board[win_condition[1]] == "O" && board[win_condition[2]] == "O"))
        return win_condition
    end
  end
  return false
end

def full?(board)
  board.each do |value|
    if value != "X" && value != "O"
      return false
    end
  end
  return true
end

def draw?(board)
  if (!won?(board) && full?(board))
    return true
  elsif (!won?(board) && !full?(board)) || won?(board)
    return false
  end
end

def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if(win_cond = won?(board))
    return board[win_cond[0]]
  end
    return nil
end
