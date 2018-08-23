# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ") #true if taken
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [6, 4, 2],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]
  
  def won?(board) #return false if there are no winning combinations
    WIN_COMBINATIONS.each {|combination| 
      return combination if 
        (combination.all? {|position| board[position] == "X"}) || 
        (combination.all? {|position| board[position] == "O"})}
    return false
  end
  
  def full?(board)
    board.all? {|position| position == "X" || position == "O"}
  end
  
  def draw?(board) #returns true if the board has not been won but is full
    return true if won?(board) == false && full?(board)
  end
  
  def over?(board)
    return true if draw?(board) || won?(board) != false
  end
  
  def winner(board)
    return board[won?(board)[0]] if won?(board) != false
  end
  
  
  
  
  
  
  
  
  
  
  
  
  
  