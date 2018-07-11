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
  WIN_COMBINATIONS.each do |combo| 
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    
    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3
    
    
    
  if (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
    return combo # return the win_combination indexes that won.
  
  
  else
     false
  end
  
  def full?(board)
    
    board.each do |check|
      if (check != "X") && (check != "O")
        return false
      end
      true
    end
  end
  
end
  false
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
 else 
   return false
 end
  
end  
  
def over?(board)
  if draw?(board) || won?(board) || won?(board)
    return true
  else 
    return false
  end
end

def winner(board)
  #if WIN_COMBINATIONS = won?(board)
    
    win = won?(board)
    
    if win
      choice = win[0]
    end
    if won?(board)
      return board[choice]
    #elsif won?(board)==nil
      # return nil
    #else
    
    end
  return nil
end



