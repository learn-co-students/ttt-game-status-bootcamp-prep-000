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
  WIN_COMBINATIONS.each do |combo|
    next unless position_taken?(board, combo.first)
    first_token = board[combo.first]
    return combo if combo.drop(1).all? { |idx| board[idx] == first_token }
  end

  nil
end

def full?(board)
  board.none? { |el| el == " " }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  winning_combo = won?(board)
  return unless winning_combo

  winning_token = board[winning_combo.first]
  winning_token
end
