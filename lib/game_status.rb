# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
  ]
  
 def won?(board)
   WIN_COMBINATIONS.each do |win|
     a = win[0]
     b = win[1]
     c = win[2]
     if position_taken?(board, a)
       lol = board[a]
       if board[b] == lol && board[c] == lol
         return win
       end
     end
   end
   false
 end
 
 def full?(board)
   board.all? do |n|
     n == "X" || n == "O"
   end
 end
 
 def draw?(board)
   full?(board) && !won?(board)
 end 
 
 def over?(board)
   full?(board) || won?(board)
 end 
 
 def winner(board)
   if won?(board)
   wing = won?(board)
   sing = wing[0]
   return board[sing]
 else 
   nil
 end
 end