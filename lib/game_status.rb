# Helper Method
require 'pry'
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
    WIN_COMBINATIONS.detect do |win_combo| 
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
     
    board[win_index_1] == board[win_index_2] && board[win_index_2] == board[win_index_3] &&
    board[win_index_1] != " " 
    end
  end
  def full?(board)
    board.each do |check|
      if check == " "
        return false
      end
    end 
    return true
  end 
  def draw?(board)
    if !won?(board) && full?(board)
      return true
    elsif !won?(board) && !full?(board)
      return false
    elsif won?(board)
      return false
    end
  end 
  def over?(board)
    won?(board) || draw?(board) || full?(board)
  end 
  def winner(board)
    winning_combo = won?(board)
    if winning_combo != nil
      board[winning_combo[0]]
    else 
      winning_combo
    end 
  end
  
  
  
  
  
  
  