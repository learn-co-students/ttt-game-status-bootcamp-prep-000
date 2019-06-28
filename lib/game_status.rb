# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS= [ 
  [0,1,2], #top row
  [3,4,5], #mid row
  [6,7,8], #low row
  [0,3,6], #L colum
  [1,4,7], #mid colum
  [2,5,8], # R colum
  [2,4,6], #dig one
  [0,4,8] #dig tow
]
def won?(board)
  WIN_COMBINATIONS. each do |combination|

    if board[combination[0]]=="X" && board[combination[1]]=="X" && board[combination[2]]=="X" || board[combination[0]]=="O" && board[combination[1]]=="O" && board[combination[2]]=="O"
      return combination 
    end 
  end
  return false 
end 

def full?(board)
  board.all? do |positions|
    positions !=" "
  end
  
end
  
def draw?(board)

if full?(board) && !won?(board)
  true 
else 
  false
end
  
end
   

def over?(board)
  if won?(board) || draw?(board) || full?(board)
  true
  else 
    false
  end
end

def winner(board)
  if won?(board)== false 
    nil
  else WIN_COMBINATIONS. each do |combination|

    if board[combination[0]]=="X" && board[combination[1]]=="X" && board[combination[2]]=="X" 
      return "X"
      
    elsif board[combination[0]]=="O" && board[combination[1]]=="O" && board[combination[2]]=="O"
      return "O"
    end
  end
end
  
end