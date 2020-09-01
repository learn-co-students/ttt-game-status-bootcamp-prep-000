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
  
  top_row_win = [0, 1, 2]
    middle_row_win = [3, 4, 5]
    bottom_row_win = [6, 7, 8]
    left_column_win = [0, 3, 6]
    middle_column_win = [1, 4, 7]
    right_column_win = [2, 5, 8]
    left_diagonal_win = [0, 4, 8]
    right_diagonal_win = [2, 4, 6]
    
  def won?(board)
WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
 if board.include?(" ")
   return false
 else
   true
   
def draw?(board)
  if full?(board) && !won?(board)
    return true
    elsif !full?(board) && !won?(board)
    return false
  else won?(board)
    return false
end
end
end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
  return true
end
end

def winner(board)
  if over?(board) && board[0] == "X" && board[4] == "X" && board[8] == "X"
    return "X"
  elsif over?(board) && board[1] == "O" && board[4] == "O" && board[7] == "O"
  return "O"
else draw?(board)
  return nil
end
end