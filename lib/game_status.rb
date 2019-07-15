# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  #horizontal
  [0, 1, 2], 
  [3, 4, 5], 
  [6, 7, 8],
  
  #vertical
  [0, 3, 6], 
  [1, 4, 7], 
  [2, 5, 8], 
  
  #diagonal
  [0, 4, 8], 
  [2, 4, 6],
  ]
  
  def won?(board)
    
    x_count = 0
    o_count = 0
    
    WIN_COMBINATIONS.each do |i|
      i.each do |j|
        if(board[j] == "X")
          x_count+=1
        end
        if(board[j] == "O")
          o_count+=1 
        end
      end
      if(x_count == 3 || o_count == 3)
        return i.to_ary
        return true
        break
      else 
        x_count = 0 
        o_count = 0
      end
    end
    
    if(x_count != 3 && o_count != 3)
      return false 
    end
    
    board.each do |i|
      if(i == " ")
        return false
      end
    end
  end
  
  def full?(board)
    count = 0
    board.each do |i|
      if(i != " ")
        count+=1 
      end
    end
    if(count == 9)
      return true
    else  
      return false
    end
  end
  
  def draw?(board)
    if(won?(board) == false && full?(board) == true)
      return true
    else 
      false 
    end
  end
  
  def over?(board)
    if( won?(board) == true || draw?(board) == true || (won?(board) && full?(board) == true) || (won?(board) && !full?(board) == true))
      return true 
    else 
      return false
    end
  end
  
  def winner(board)
      if(won?(board))
        return board[won?(board)[0]]
      end
  end
  
  