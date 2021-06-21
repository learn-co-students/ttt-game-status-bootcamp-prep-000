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
  [0,4,8], # Left diagonal
  [2,4,6], # Right diagonal
]

def won?(board)
  won = FALSE
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      won = combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      won = combo
    end
  end
  won
end

def full?(board)
  board.all?{|item| item == "X" || item == "O"}
end

def draw?(board)
  if full?(board) && !(won?(board))
    TRUE
  elsif won?(board)
    FALSE
  elsif !(full?(board))
    FALSE
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    TRUE
  else
    FALSE
  end
end

def winner(board)
  winner = nil
  won = won?(board)
  if won != FALSE
    if board[won[0]] == "X"
      winner = "X"
    else
      winner = "O"
    end
  end
  winner
end
