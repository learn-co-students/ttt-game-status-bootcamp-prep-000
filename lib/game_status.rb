# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # TOP ROW
  [3,4,5], # MIDDLE ROW
  [6,7,8], # BOTTOM ROW
  [0,3,6], # FIRST COLUMN
  [1,4,7], # MIDDLE COLUMN
  [2,5,8], # LAST COLUMN
  [0,4,8], # DIAGONAL TOP LEFT, BOTTOM RIGHT
  [2,4,6]  # DIAGONAL TOP RIGHT, BOTTOM LEFT
]

def won?(board)
  WIN_COMBINATIONS.detect { |combo|
    if position_taken?(board, combo[0])
      board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" || board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
    end
}
end

def full?(board)
  board.all? do |move|
    move != " "
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  elsif !(won?(board) && full?(board))
    false
  elsif won?(board)
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  
  if won?(board)
    winning_combo = won?(board)
    if board[winning_combo[0]] == "X"
      "X"
    elsif board[winning_combo[0]] == "O"
      "O"
    end
  end

end
