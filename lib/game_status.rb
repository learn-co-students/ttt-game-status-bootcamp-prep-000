# Helper Method

require 'pry'

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
#all possible winning combinations

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end
#this method compares board indexes to winning combinations
#this method also checks to see if there are any empty spaces in the combo

def full?(board)
  !board.detect do |xo|
    xo == "" || xo == " "
  end
end
#this method checks to see if there are empty indexes on the board

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
#this method checks to see if there is a winning combo and assigns it to
#the variable "winning_combo"
#then it checks the first index of winning combo
#whatever the first index is the rest of the winning combo will be
#either all "X"s or "O"s
