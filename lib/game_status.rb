def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Last row
  [0,3,6], # First Vertical Row
  [1,4,7], # Second Vertical Row
  [2,5,8], # Third Vertical Row
  [0,4,8], # \ Diagonal
  [2,4,6], # / Diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    !!(position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
  end
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  !!(won?(board) || full?(board) || draw?(board))
end

def winner(board)
  !!won?(board)? board[won?(board)[0]]: won?(board)  # where won?(board)[0] -> win_combination_array[0]
end
