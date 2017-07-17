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
  [2,4,6],
  [0,4,8]
]

#won?
def won?(board)
  WIN_COMBINATIONS.each do |win_comb|
    if board[win_comb[0]] == "X" && board[win_comb[1]] == "X" && board[win_comb[2]] == "X" || board[win_comb[0]] == "O" && board[win_comb[1]] == "O" && board[win_comb[2]] == "O"
      return win_comb
    end
  end
  false
end

#full?
def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

#draw?
def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  false
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
