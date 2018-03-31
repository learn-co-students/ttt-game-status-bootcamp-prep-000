# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Forward-slash diagonal
  [2, 4, 6], # Backward-slash diagonal
  ]

def won?(board)
  WIN_COMBINATIONS.each do |wc|
    if ((board[wc[0]] == "X") && 
      (board[wc[1]] == "X") && 
      (board[wc[2]] == "X")) ||
      ((board[wc[0]] == "O") && 
      (board[wc[1]] == "O") && 
      (board[wc[2]] == "O"))
        return wc
    end
  end
  return false
end

def full?(board)
  board.all? do |place|
    (place== "X") || (place == "O")
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    winner = won?(board)
    return board[winner[0]]
  else
    return nil
  end
end