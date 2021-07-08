# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if ((board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O") )
      return combo
    end
  end
  return false;
end

def full? (board)
  index = 0
  board.each do |cell|
    if !position_taken?(board, index)
      return false;
    end
    index += 1
  end
  return true
end

def draw?(board)
  if won?(board) == false && full?(board)
    return true
  elsif won?(board) == false && !full?(board)
    return false
  elsif won?(board) != false
    return false
  end
end

def over?(board)
  if won?(board) != false || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if !draw?(board) && over?(board)
    comboArray = won?(board)
    if board[comboArray[0]] == "X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end
