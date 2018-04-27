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
  winning_combinations(board).first
end
def winning_combinations(board)
    WIN_COMBINATIONS.select do |win_combo|

    (board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X") ||  (board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O")
 end
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
  full?(board) || won?(board) || draw?(board)
end
def winner(board)
  winning_combination = won?(board)
  if winning_combination == nil
    return nil
  elsif board[winning_combination[0]] == "X"
  return "X"
else
  "O"
  end
end
# Define your WIN_COMBINATIONS constant
