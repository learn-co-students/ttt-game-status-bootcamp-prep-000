# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # \ Diagonal
  [6,4,2] # / Diagonal
]


def won?(board)
  WIN_COMBINATIONS.detect do |combination| ## Find and RETURN first element (which will be an array) within WIN_COMBINATIONS that matches following conditions:
    board[combination[0]] == board[combination[1]] && ## board index corresponding to first index of |combination| equals second index of board index corresponding to second index of |combination|
    board[combination[1]] == board[combination[2]] && ## second index corresponding to second index of |combination| equals third index of board index corresponding to third index of |combination|
    position_taken?(board, combination[0]) ## first board index corresponding to first index of |combination| is not blank or nil
  end
end

def full?(board)
  board.all? do |space|
    space == "X" || space == "O"
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if winning_player = won?(board) ## sets variable <winning_player> to the array output of #won? IF such a variable is allowed to exist (is true). Else, returns nil  
  board[winning_player[0]]
  end
end
