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
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      if ((position_1 == "X" && position_2 == "X" && position_3 == "X") ||     (position_1 == "O" && position_2 == "O" && position_3 == "O"))
         return win_combination
      else 
    end 
  end 
    return nil 
 end
 
 def full?(board)
   counter = 0 
   board.each do |position|
     if (position == "X" || position == "O")
       counter +=1 
     else 
     end 
   end 
   if counter == 9 
     return true 
   else 
     return false 
   end 
 end 
 
 def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end 
 end 
 
 def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else 
    return false 
  end 
 end 
 
 
 def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = board[win_combination[0]]
      position_2 = board[win_combination[1]]
      position_3 = board[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return "X"
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return "O"
      else
        
      end
    end
  else
    return nil
  end
end


