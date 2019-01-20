# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], 
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
  ]
  
  
  def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
      first_index = win_combo[0]
      second_index = win_combo[1]
      third_index = win_combo[2]
      
      if board[first_index]  == "X" && board[second_index] == "X" && board[third_index] == "X"
          return win_combo
      elsif board[first_index] == "O" && board[second_index] == "O" && board[third_index] == "O"
          return win_combo
      end
    end
    
    return false
  end
 
  def full?(board)
    board.all? {|i| i == "X" || i ==  "O"}
  end
  
  def draw?(board)
    if !won?(board) && full?(board) 
      return true
    else
      return false
    end
  end
  
  def over?(board)
    if won?(board) || full?(board) || draw?(board)
      return true
    end
  end

  def winner(board)
    
   #if won?(board).all? {|i| i = "O"}
    # return "O"
   #end
   #if won?(board).all? {|i| i = "X"}
     #return "X"
   #end
   
   if !won?(board)
     return nil
    else
      if board[won?(board)[0]] == "O"
       return "O"
      else 
         return "X"
      end
    end
 end
    
  