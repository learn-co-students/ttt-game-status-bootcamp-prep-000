# Helper Method
require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.find do |win_combo|
  board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]] && position_taken?(board, win_combo[0])
  end
end

def full?(board)    
  board.all?{ |token| token == "X" || token == "O" }
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  
  
WIN_COMBINATIONS = [
 [0,1,2], # Top row
 [3,4,5], # Middle row
 [6,7,8], # Bottom row
 [0,3,6], # First column
 [1,4,7], # Second column
 [2,5,8], # Third column
 [0,4,8], # Left diagonal
 [2,4,6]  # Right diagonal
]
