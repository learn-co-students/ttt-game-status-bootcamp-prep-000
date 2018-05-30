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
  [6,4,2],
  ]

def won?(board)
  WIN_COMBINATIONS.each {|win_combination|
    win_index_0 = win_combination[0]
    win_index_1 = win_combination[1]
    win_index_2 = win_combination[2]
    
    position_1 = board[win_index_0]
    position_2 = board[win_index_1]
    position_3 = board[win_index_2]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  }
  return false
end


def full?(board)
  board.all? {|index| index == "X" || index == "O"}
end  


def draw?(board)
  if won?(board) == false && full?(board) == true 
    return true
  else 
    return false
  end
end


def over?(board) 
  if won?(board) || draw?(board) == true || full?(board) == true 
    return true 
  else 
    return false
  end
end

def winner(board) 
  winning_combo = []
  winning_combo = won?(board)
  if winning_combo == false
    return nil
  else 
    if board[winning_combo[0]] == "X"
      return "X"
    else 
      return "O"
    end
  end
end