# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # bottom row
  [0,3,6],  #left column
  [1,4,7],  # middle column
  [2,5,8],  #right column
  [0,4,8], #first diagonal
  [2,4,6]  #second diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
full?(board) && !won?(board)
end

def over?(board)
full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
