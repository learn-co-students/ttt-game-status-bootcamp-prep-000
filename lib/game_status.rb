# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7], 
  [2, 5, 8]
  ]
  
  def won?(board)
    
    WIN_COMBINATIONS.each do |pos|
      return pos if board[pos[0]] == "X" && board[pos[1]] == "X" && board[pos[2]] == "X" 
      return pos if board[pos[0]] == "O" && board[pos[1]] == "O" && board[pos[2]] == "O"
    end 
   return nil if full?(board)
  end 
  
  def full?(board)
    board.all?{ |el| el != " "}
  end 
  
  def draw?(board)
   return false if full?(board) && won?(board) 
   return false unless full?(board)
   true
  end 
  
  def over?(board)
    return true if draw?(board)
    return true if won?(board)
  end 
  
  def winner(board)
    if won?(board)
     pos = won?(board)
     return board[pos[0]]
    else 
     return nil
    end
  end 