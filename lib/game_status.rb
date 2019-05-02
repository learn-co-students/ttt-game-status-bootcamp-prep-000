# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  
  def won?(board)
  WIN_COMBINATIONS.detect do |combos|
  (board[combos[0]] == board[combos[1]] && board[combos[1]] == board[combos[2]]) && (board[combos[0]]== 'X'|| board[combos[0]] == 'O')
    
end
end
   
   def full?(board)
     board.all? do |letter|
       letter == 'X' || letter == 'O'
  end
end

  def draw?(board)
    full?(board) && !won?(board) 
   
end  

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if !won?(board)
    return nil
    else
  return board[won?(board)[0]]
end
end
  