# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top row win
  [3,4,5], # middle row win
  [6,7,8], # bottom row win
  [0,3,6], # left column win
  [1,4,7], # middle column win
  [2,5,8], # right column win
  [0,4,8], # left diagonal win
  [2,4,6]  # right diagonal win
]

#WON?
def won?(board)
  WIN_COMBINATIONS.find do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

#EMPTY?
# return true if every element in the board is empty.
def empty?(board)
  board.all? { |e| e == " "  }
end

#FULL?
# The #full? method should accept a board and
# return true if every element in the board contains either an "X" or an "O".
def full?(board)
  board.all?{|e| e.upcase == "X" || e.upcase == "O" }
end

#DRAW?
# Build a method #draw? that accepts a board and
# returns true if the board has not been won and is full
# AND returns false if the board is not won and the board is not full,
# AND returns false if the board is won.
def draw?(board)
  if !won?(board) && full?(board)
    # returns true if the board has not been won and is full
    true
  elsif !won?(board) && !full?(board) || won?(board)
    #returns false if the board is not won and the board is not full
    # returns false if the board is won
    false
  else
    false
  end
end

#OVER?
# Build a method #over? that accepts a board and
# returns true if the board has been won,
# is a draw, or
# is full.
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

#WINNER
def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
