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
  WIN_COMBINATIONS.each do |win_combination|
    if (board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]]) && position_taken?(board, win_combination[0])
      return win_combination
    end
  end
  false
end

def full?(board)
  board.all? do |token|
    token == "X" || token == "O"
  end
end

def draw?(board)
  if won?(board)
    false
  else
    full?(board)
  end
end

def over?(board)
   won?(board) || draw?(board)

end

def winner(board)
  if won?(board)
    winning = won?(board)
    board[winning[0]]
  end
end
