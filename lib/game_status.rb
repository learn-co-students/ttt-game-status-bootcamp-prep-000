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
  [0,4,8],
  [1,4,7],
  [2,4,6],
  [2,5,8],
  ]
  
  def won?(board)
    if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      false
    elsif board.none?{|spaces| spaces == " "}
      false
    else
    WIN_COMBINATIONS.each do|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      
      if  (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
  else
    false
      end
    end 
  end
    
  end
  
  def better_won(board)
     WIN_COMBINATIONS.each do|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      
      if  (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return true
    end
  end
    return false
  end 
  
  
  def full?(board)
   board.none?{|spaces| spaces == " "}
  end 
  
def draw?(board)
  if full?(board) && !(better_won(board))
  return true
  elsif !(full?(board)) && !(better_won(board))
  false
  elsif better_won(board)
  false
end
end
  
  def over?(board)
    if full?(board) || draw?(board) || better_won(board)
    true 
  else 
    false
  end
end
   
def winner(board)
     WIN_COMBINATIONS.each do|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      
      if  (position_1 == "X" && position_2 == "X" && position_3 == "X") 
      return "X"
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O") 
      return "O"
    end
  end
  nil
end 
  