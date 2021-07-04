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
  WIN_COMBINATIONS.each do |win_combination|
    position_1 = win_combination[0]
    position_2 = win_combination[1]
    position_3 = win_combination[2]
    if board[position_1] == "X" && board[position_2] == "X" && board[position_3] == "X"
      return win_combination
    elsif board[position_1] == "O" && board[position_2] == "O" && board[position_3] == "O"
      return win_combination
    end
  end

  empty_board = board.any? { |position| position == "X" || position == "O" }
  if empty_board
    return false
  end
end

def full?(board)
  board.all?{ |position| position == "X" || position == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  winning_combo = won?(board)
  if won?(board)
    return board[winning_combo[0]]
  else
    nil
  end
end
