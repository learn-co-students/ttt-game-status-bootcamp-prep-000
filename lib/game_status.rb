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
    gotxwin = false
    gotowin = false
    windex = []
  WIN_COMBINATIONS.each do |blah| 
    
   if blah.all?{|numb| board[numb] == "X"}
   gotxwin = true
   windex = blah
  
   elsif blah.all?{|numb| board[numb] == "O"}
   gotowin = true
   windex = blah
  end
  
  end
  
   if gotxwin && gotowin
    [d, r, a, w]
  elsif gotxwin || gotowin
    windex
  else
  false
  end
  
  
end
  
def full?(board)
  
board.all?{|token| token == "X" || token == "O"}
  
end  
  
  
def draw?(board)
  if !won?(board) && full?(board)
    true
    elsif !won?(board) && !full?(board)
    false
  elsif won?(board)
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
  
if !won?(board)
    nil  
  
  elsif board[won?(board)[0]] == "O"
 "O"
 elsif board[won?(board)[0]] == "X"
 "X"
 
 end
 
  
end
  
 

  
  
  