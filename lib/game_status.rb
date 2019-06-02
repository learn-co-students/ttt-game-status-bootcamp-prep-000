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
  [0,4,8],
  [2,4,6]
  ]
  
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
    
#    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
#      return win_combo
#    else false
  end
#end
end

def full?(board)
  board.all?{|token| token == "X" || token == "O"}
#  !board.any?{|cell| cell == " "}
end

def draw?(board)
#  if (won?(board) == false || won?(board) == nil) && full?(board) == true
#    return true
#  elsif ((won?(board) == false || won?(board) == nil) && full?(board) == false) || (won?(board) != false || won?(board) != nil)
#  return false
#  else return false
#  end
  !won?(board) && full?(board)
end

def over?(board)
#  if draw?(board) == false
#    return false
#  elsif won?(board) != false || won?(board) != nil || draw?(board) == true
#    return true
#  end
#  if draw?(board) == true
#    return true
#  elsif (won?(board) != false || won?(board) != nil) && full?(board) == true
#  return true
#  elsif (won?(board) != false || won?(board) != nil) && full?(board) == false
#  return true
#  elsif full?(board) == false
#  return false
#else return false
#end
#  if won?(board) != false || full?(board) == true
#    return true
#  end
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  win_index = won?(board)
  
  if won?(board)
    if board[win_index[0]] == "X"
      return "X"
    elsif board[win_index[0]] == "O"
      return "O"
    else
      return nil
    end
  end
end

