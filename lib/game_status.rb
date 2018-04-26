require_relative '../spec/game_status_spec.rb'
require 'pry'

# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right  column
  [0,4,8],  # Backslash diagonal
  [2,4,6]   # Forwardslash diagonal
  ]
  win_index_1 = WIN_COMBINATIONS[0]
  win_index_2 = WIN_COMBINATIONS[1]
  win_index_3 = WIN_COMBINATIONS[2]
  win_index_4 = WIN_COMBINATIONS[3]
  win_index_5 = WIN_COMBINATIONS[4]
  win_index_6 = WIN_COMBINATIONS[5]
  win_index_7 = WIN_COMBINATIONS[6]
  win_index_8 = WIN_COMBINATIONS[7]
  
  
  def full?(board)
    board.all?{|cell| cell == "X" || cell == "O"}
  end
  
  def draw?(board)
    (won?(board)? false : true)
  end
  
  def over?(board)
    won?(board) || full?(board) 
  end  
  
  def winner(board)
    if won?board
        board[won?(board)[0]]
    end
  end
  
  def won?(board)
    WIN_COMBINATIONS.detect do |combo|
   board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[1])
  end
end
  