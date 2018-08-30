 #board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Across
  [3,4,5],
  [6,7,8],
  [0,3,6], # Down
  [1,4,7],
  [2,5,8],
  [0,4,8], # Diagonal
  [2,4,6] 
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |i|
  win_index_1 = i[0]
  win_index_2 = i[1] 
  win_index_3 = i[2]
   if ((board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X") || (board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"))
   return "#{i}"
    end
  end
  puts false
end  