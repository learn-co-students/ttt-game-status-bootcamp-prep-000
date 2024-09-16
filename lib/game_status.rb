# Learn.co Bootcamp Prep - Ruby Fundamentals - 20: Tic Tac Toe Game Status

WIN_COMBINATIONS = [
  [0, 1, 2],  # first row
  [3, 4, 5],  # second row
  [6, 7, 8],  # third row
  [0, 3, 6],  # first column
  [1, 4, 7],  # second column
  [2, 5, 8],  # third column
  [0, 4, 8],  # top left diagonal
  [2, 4, 6]   # top right diagonal
]

############################### HELPER METHOD #################################
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
###############################################################################


# Define a method, 'won?', that accepts one parameter(s):
# 'board', an array that represents the current state of tokens on the game board.
# Determine if a 'win' exists.
# If there is no win combination present, return false.
# If there is a win combination present, return true and an array containing
# the winning indexes.
def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  end
end


# Define a method, 'full?', that accepts one parameter(s):
# 'board', an array that represents the current state of tokens on the game board.
# Determine if the game board is full.
# If so, return true, else, false.
def full?(board)
  board.all?{|cell| cell == "X" || cell == "O"}
end


# Define a method, 'draw?', that accepts one parameter(s):
# 'board', an array that represents the current state of tokens on the game board.
# Determine if the game board is full AND has not been won.
# If so, return true, else, false.
def draw?(board)
  !won?(board) && full?(board)
end


# Define a method, 'over?', that accepts one parameter(s):
# 'board', an array that represents the current state of tokens on the game board.
# Determine if the game has been won, there is a tie, or the board is full.
# If so, return true, else, false.
def over?(board)
  won?(board) || full?(board) || draw?(board)
end


# Define a method, 'winner', that accepts one parameter(s):
# 'board', an array that represents the current state of tokens on the game board.
# Return the token, "X" or "O", of the winning player.
def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
