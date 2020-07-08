# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS =[
   [0,1,2],#top_row
   [3,4,5],#middle_row
   [6,7,8],#bottomrow
   [0,3,6],# left_column
   [1,4,7],#middle_column
   [2,5,8],# right_column
   [0,4,8],# diagonal1
   [6,4,2],# diagonal2
  
  
  ]
  def won?(board)
    WIN_COMBINATIONS.detect do |win_combination| 
    
  
          win_index_1 = win_combination[0]
          win_index_2 = win_combination[1]
          win_index_3 = win_combination[2]
         
        
          position_1 = board[win_index_1] 
          position_2 = board[win_index_2]
          position_3 = board[win_index_3] 
        
  
  
  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination 
  elsif
     position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
  else
    false
    end
  end
end
  def full?(board)
    if board.detect { |play| play == " " || play == nil}
     return false
    else
      return true
      end
    end
  
  def draw?(board)
   if !won?(board) && full?(board)
     ##WIN_COMBINATIONS.none?{|j| j == board}
     return true
    else
     return false
    end
  end
    
    def over?(board)
      if won?(board) || draw?(board)
        return true
      else
        return false
      end
    end

  
  
def winner(board)
  if win_combination = won?(board)
    board[win_combination.first]
  end
end