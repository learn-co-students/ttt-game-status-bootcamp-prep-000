# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
#top_row_across = [0,1,2]
#mid_row_across = [3,4,5]
#bottom_row_across = [6,7,8]

#top_row_down = [0,3,6]
#mid_row_down = [1,4,7]
#bottom_row_down = [2,5,8]

#left_diag = [0,4,8]
#right_diag = [2,4,6]

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
   board.all? {|index| index == "X" || index == "O"}
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
   else
     return false 
   end 
 end 
 
 def winner(board)
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