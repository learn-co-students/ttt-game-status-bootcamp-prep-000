# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row 
  [0,4,8], # Diagonal 0 
  [2,4,6], # Diagonal 2
  [0,3,6], # Left Column 
  [1,4,7], # Middle Column
  [2,5,8]  # Right Column
]
def won?(board)
  var = false
  WIN_COMBINATIONS.detect { |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
  }
end 
def full?(board)
 !board.detect { |cell| cell.nil? || cell == " "}
end 
def draw?(board)
  !(!(!won?(board) && full?(board)) || (!won?(board) && !full?(board)) || won?(board))
end 
def over?(board)
  won?(board) || draw?(board) || full?(board)
end 
def winner(board)
  won?(board)? board[won?(board)[0]] : nil
end