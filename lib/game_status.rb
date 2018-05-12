# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  
def winning_combos(board)
  WIN_COMBINATIONS.select do |winning_combo|
    (board[winning_combo[0]] == "X" && board[winning_combo[1]] == "X" && board[winning_combo[2]] == "X") || (board[winning_combo[0]] == "O" && board[winning_combo[1]] == "O" && board[winning_combo[2]] == "O")
   end
end
 
def won?(board)
  winning_combos(board).first
end

def full?(board)
  !board.any? do |board_position|
   board_position == " "
 end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  winning_combination = won?(board)
  if winning_combination == nil
     nil
     elsif board[winning_combination[0]] == "X"
     "X"
   else
     "O"
   end
end

  