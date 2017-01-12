# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,4,8], # Diagonal
  [2,4,6], # Diagonal
  [0,3,6], # Top column
  [1,4,7], # Middle column
  [2,5,8]  # Bottom column
]

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == board[combination[1]] &&
    board[combination[1]] == board[combination[2]] &&
    position_taken?(board, combination[0])
  end
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    board[won?(board).first]
  end
end
