# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  #return false if no WIN_COMBINATIONS, return winning array if won
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  #returns true if all spots filled up
  board.all? do |space|
    space == 'X' || space == 'O'
  end
end

def draw?(board)
  #returns true if board is full and not won. Returns false if board not won or full
  full?(board) && !won?(board)
end

def over?(board)
  #returns true if board is won, a draw, or full
  won?(board) || full?(board)
end

def winner(board)
  #return the winning token
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
