# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  ]
  
  def won?(board)
    WIN_COMBINATIONS.each do |combination|
     if (board[combination[0]]==board[combination[1]] && board[combination[1]]==board[combination[2]])&& position_taken?(board, combination[0])
      return combination
end
  end
  return false
end 
 
 def full?(board)
   board.all? do |position|
     position == "X" || position == "O"
   end
 end
  
 
 def draw?(board)
   !won?(board) && full?(board)
   end
 
  def over?(board)   
    won?(board) || draw?(board) 
  end
  
  
  def winner(board)
    combination = won?(board)
     if combination
      return board[combination[0]]
  else
    return nil
  end
end
  

     
 
 
 
     

        