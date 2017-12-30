# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
WIN_COMBINATIONS = [ 
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2],
  ]
  
def won?(board)
  WIN_COMBINATIONS.each{|win| 
  if win.all?{|i| board[i] == "X"}
   return win 
  elsif win.all?{|i| board[i] == "O"}
  return win
  
end}
false 
end

def full?(board) 
if draw?(board)
  true 
elsif won?(board) != false 
false
end  
end
def draw?(board) 
if board.none?{|i| i == " "} && board.none?{|i| i == ""}
    if won?(board) == false
  true 
end 
  else 
   return false 
  end 
end

def over?(board)
    if draw?(board)
      true
    elsif won?(board) == false  
       false 
    elsif won?(board) != false
     return true 
    elsif board.any?{ |i| i == " "}
    return false 
    else 
      false
  end
end

def winner(board)
  if won?(board) == false
    nil
  elsif won?(board).all?{ |i| board[i] == "X"} 
    "X"
  elsif won?(board).all?{ |i| board[i] == "O"}
    "O"
  else 
    nil 
  end
end
    
# Define your WIN_COMBINATIONS constant
