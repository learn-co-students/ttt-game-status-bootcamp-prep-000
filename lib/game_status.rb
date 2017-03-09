# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# 0 1 2
# 3 4 5
# 6 7 8

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # an array for each win combination
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left column
  [1,4,7],  # Middle column
  [2,5,8],  # Right column
  [0,4,8],  # Left top diagonal
  [2,4,6]   # Right top diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all?{|token| ["X", "O"].include?(token)}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
 won?(board) || draw?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end

=begin
def won?(board)
  for win_combination in WIN_COMBINATIONS do
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    board_value_1 = board[win_index_1]
    board_value_2 = board[win_index_2]
    board_value_3 = board[win_index_3]

    if (board_value_1 == "X" && board_value_2 == "X" && board_value_3 == "X") || (board_value_1 == "O" && board_value_2 == "O" && board_value_3 == "O")
      return win_combination
    end
  end
  return false
end

def won?(board)
  for win_combination in WIN_COMBINATIONS do
    board_win_combinations = [board[win_combination[0]], board[win_combination[1]], board[win_combination[2]]]
    if (board_win_combinations.all?{|p| p == "X"}) || (board_win_combinations.all?{|p| p == "O"})
      return win_combination
    end
  end
  return false
end
=end
