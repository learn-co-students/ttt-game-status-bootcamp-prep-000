# Helper Method
require "pry"

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
  [0,4,8],
  [2,4,6]
  ]
  
  def won?(board)
    WIN_COMBINATIONS.detect do |combo|
       board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[0]) 
    end
  end
 
 
 
 def full?(board)
   board.none? do |value|
    value == " "
  end
end


def draw?(board)
  won?(board) == nil && full?(board) == true
end

def over?(board)
  draw?(board) == true || won?(board) != nil
end


def winner(board)
  if won?(board) == nil
    return nil
  elsif board[won?(board)[0]] == "O"
    return "O"
  elsif board[won?(board)[0]] == "X"
    return "X"
  end   
end