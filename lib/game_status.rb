WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7 , 8], 
  [0, 3, 6], [1, 4, 7], [2, 5, 8], 
  [0, 4, 8], [2, 4, 6]
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    loc1 = win_combo[0]
    loc2 = win_combo[1]
    loc3 = win_combo[2]
    
    board[loc1] == board[loc2] && board[loc2] == board[loc3] &&
    board[loc1] != " "
    end
end

def full?(board)
  board.none?{|i| i == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) 
end

def winner(board)
  if win_combo = won?(board)
    board[win_combo.first]
  end
end