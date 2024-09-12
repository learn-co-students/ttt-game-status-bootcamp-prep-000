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
  WIN_COMBINATIONS.each do |comb|
    if (board[comb[0]] == "X" && board[comb[1]] == "X" && board[comb[2]] == "X") ||
      (board[comb[0]] == "O" && board[comb[1]] == "O" && board[comb[2]] == "O")
      return comb
    end
  end
      return false
end

def full?(board)
  i = 0
  while i < 9
    if !position_taken?(board, i)
      return false
    end
    i += 1
  end
return true
end

def draw? (board)
  if !won?(board) && full?(board)
    return true
  end
  if (!won?(board) && !full?(board)) || won?(board)
    return false
  end
end

def over? (board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end
