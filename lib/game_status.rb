# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
# Defines a constant WIN_COMBINATIONS with arrays for each win combination
WIN_COMBINATIONS = [
  [0,1,2],  # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # Left row
  [1,4,7],  # Middle row
  [2,5,8],  # Right row
  [0,4,8],  # First diagonal to the right
  [6,4,2]  # Second diagonal to the left
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    board[win_combination[0]] == board[win_combination[1]] &&
    board[win_combination[1]] == board[win_combination[2]] &&
    position_taken?(board, win_combination[0])
  end
end

# returns true for a draw, false for an in-progess game
def full?(board)
  board.all? do | player_char|
    player_char == "X" || player_char == "O"
  end
end

# Returns true for a draw, false for a gne in the first row, won game diagonaly & for an in-progress game.
def draw?(board)
  return full?(board) && !won?(board)
end

# Returns true for a draw and for a won game flase for an in-progress game
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

# return X when X won, O when O won and return Nil when no winner.
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
