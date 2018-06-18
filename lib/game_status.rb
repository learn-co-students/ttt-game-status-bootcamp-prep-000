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
  [2,4,6],
  ]
  
  def won?(board)
    WIN_COMBINATIONS.any? do |winning_combo|
     win_index_1 = winning_combo[0]
     win_index_2 = winning_combo[1]
     win_index_3 = winning_combo[2]
     
     position_1 = board[win_index_1]
     position_2 = board[win_index_2]
     position_3 = board[win_index_3]
     
     if position_1 == "X" && position_2 == "X" && position_3 == "X"
       return winning_combo
       elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       return winning_combo
     else
       false
     end
    end
  end
  
  def full?(board) 
    board.all? do |full|
      if full == " "
         false
      else
         true
      end
    end
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
    won?(board).each do |game_over|
    if   won?(board) 
      return game_over
    else
      return nil
     end
    end
  end
  
  
  def winner(board) 
    if   won?(board)
      return board[won?(board)[0]]
    else
      return nil
    end
  end
  
  
  
  
  