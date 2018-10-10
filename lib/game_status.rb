# Helper Method
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


def won?(board)
  WIN_COMBINATIONS.each do |win_combinations|
    
    win_index_1 = win_combinations[0]
    win_index_2 = win_combinations[1]
    win_index_3 = win_combinations[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X"  && position_3 == "X"
      return win_combinations
      
    elsif position_1 == "O" && position_2 == "O"  && position_3 == "O"
      return win_combinations
    end
  end
  return false
end



def full?(board)
  fullArray = []
  
  board.each do |is_board_full|
    
  if is_board_full == "X" || is_board_full == "O"
      fullArray.push (is_board_full)
      
    end
  end
  
  if fullArray.length == 9
    return true
  else
    return false
  end
end


def draw?(board)
  
  if full?(board) == true && won?(board) == false
    return true
    
  else 
    return false
  end
end


def over?(board)
  
  if draw?(board) == true
    return true
  
  elsif full?(board) == true && won?(board) != false
    return true
    
  elsif full?(board) == false && won?(board) != false
  return true
  
else 
  return false
 
  end
end



def winner(board)
  
  if won?(board) != false
  win_index = won?(board)
  winning_letter = board[win_index[0]]
  return winning_letter
    
  
    
  end
end

  
  
    
 
    
    
    

    
    
    

 