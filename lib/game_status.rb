# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [2,4,6],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [0,1,2],
  [1,4,7],
  [2,5,8]
  ]
  def won?(board)
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|space| board[space] == "X"}
        return combo
      elsif combo.all? {|space| board[space] == "O"}
        return combo
      end
    end
    return FALSE
  end
  
  def full?(board)
    if board.all? {|space| space == "X" || space == "O"}
      return TRUE
    else
      return FALSE
    end
  end
  
  def draw?(board)
    if won?(board) == FALSE && full?(board) == TRUE
      return TRUE
    else
      return FALSE
    end
  end
  
  def over?(board)
    if won?(board) != FALSE || draw?(board) == TRUE
      return TRUE
    else
      return FALSE
    end
  end
  
  def winner(board)
    if won?(board) != FALSE
      return board[won?(board)[0]]
    end
  end
    
    
      