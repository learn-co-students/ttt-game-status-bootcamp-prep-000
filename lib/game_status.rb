# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  #return T/F if there is a win combination
  WIN_COMBINATIONS.each do |combo|
    if (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
      return combo
    end 
  end 
  false
end 

def full?(board)
  #return True if every element in the board is an XorO 
  board.all? {|el| el == "X" || el == "O"}
end 

def draw?(board)
  if((full?(board) == true) && ( won?(board) == false) )
    true 
  else 
    false 
  end 
end 

def over?(board)
  won?(board) || draw?(board) || full?(board)
end 

def winner(board)
  arr = won?(board)
  return nil if arr == false  
  board[arr[0]]
end 

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Left to Right Diagonal
  [2,4,6] # Right to Left Diagonal
]