# Helper Method
require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3]

  if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    return win_combination
  end
  #if position_1 == "X" && position_2 == "X" && position_3 == "X"
  #  return win_combination
  #elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  #  return win_combination
  #end
end
false
end

def full?(board)
count = 0
  board.each do |el|
    if el == "X" || el == "O"
      count+=1
    end
  end
  if count == 9
    return true
  else
    return false
  end
end

def draw?(board)
if !won?(board) && full?(board)
   return true
elsif !won?(board) && !full?(board)
   return false
elsif won?(board)
  return false
elsif won?(board) && full(board)
  return false
end
end

def over?(board)
  return true if (won?(board) || draw?(board) || full?(board))
end
def winner(board)
  #binding.pry
  if !draw?(board) && over?(board)
    board[won?(board)[1]]
  else
  #elsif draw?(board) && full?(board)
     return nil
  end
end
