# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #toprow
  [3,4,5], #middlerow
  [6,7,8], #bottomrow
  [0,3,6], #1stcolumn
  [1,4,7], #2ndcolumn
  [2,5,8], #3rdcolumn
  [0,4,8], #1stdiagonal
  [2,4,6]  #2nddiagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_index_1)
      return win_combination
    end
  end 
  false 
end  
    
def full?(board)
   board.all?{|i| i == "X" || i == "O"}
end
 
def draw?(board)
   if !won?(board) && full?(board)
    return true
   elsif !won?(board) && !full?(board)
    return false 
   end
end
 
def over?(board)
   if won?(board) || draw?(board) || full?(board)
    true
   elsif !full?(board)
    false
  end
end
   
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end