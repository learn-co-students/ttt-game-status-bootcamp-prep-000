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
  [0,4,8], # left-right diagonal win
  [2,4,6]  # right-left diagonal win
]

def won?(board)
  WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] &&
    board[win[1]] == board[win[2]] &&
    position_taken?(board, win[0])
  end
end

def full?(board)
  board.all? {|spot| spot == "X" || spot == "O"}
end

def draw?(board)
  full?(board) && !(won?(board))
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if combo = won?(board)
    board[combo.first]
  end
end