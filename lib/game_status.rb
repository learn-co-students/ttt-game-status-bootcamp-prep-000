# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2], #Top row
  [3, 4, 5], #Middle row 
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Middle column 
  [2, 5, 8], #Right column
  [0, 4, 8], #Top left to bottom right
  [2, 4, 6]  #Bottom left to top right
  ]

def won?(board)
  WIN_COMBINATIONS.each { |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  
  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
  
  if position_1 == "X" &&
    position_2 == "X" &&
    position_3 == "X"
    
    return win_combination
    
  elsif position_1 == "O" &&
  position_2 == "O" &&
  position_3 == "O"
  
    return win_combination
  end 
  }
    
  return false
end 

def full?(board)
  board.all? { |index| index == "X" || index == "O" }
end 

def draw?(board)
  if full?(board) && !won?(board)
    return true 
  end 
end 

def over?(board)
  if won?(board) || full?(board)
    return true 
  end 
end 

def winner(board)
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
  
  

  
