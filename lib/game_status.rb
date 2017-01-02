# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  # First row
  [1,4,7],  # Second row
  [2,5,8],  # Third row
  [0,4,8],  # Right diagonal
  [6,4,2]  # Left diagonal
  # ETC, an array for each win combination
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    #puts combo[0]
    #puts combo[1]
    #puts combo[2]
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? do |token|
     token == "X" || token == "O"
  end
end


def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo.first]
  end
end
