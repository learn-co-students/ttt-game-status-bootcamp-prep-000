# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], #last row
  [0,3,6], #first row down
  [1,4,7], #second row down
  [2,5,8], #third row down
  [0,4,8], #first diagonal
  [2,4,6], #second diagonal
 ]
 
def won?(board)
  WIN_COMBINATIONS.each {|win_combo|
    index_0 = win_combo[0]
    index_1 = win_combo[1]
    index_2 = win_combo[2]

    position_1 = board[index_0]
    position_2 = board[index_1]
    position_3 = board[index_2]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combo
    end
  }
  return false
end

def full?(board)
 board.all? { |index| index == "X" || index == "O"}
end

def draw?(board)
  if won?(board) == false  && full?(board) == true
    return true
  else
    false
  end
end

def over?(board)
if won?(board) || draw?(board) || full?(board)  
  return true
else
  false
  end 
end 

def winner (board)
  index = []
  index = won?(board)
  if index == false
    return nil
  else
    if board[index[0]] == "X"
      return "X"
    else
      return "O"
    end
  end
end




