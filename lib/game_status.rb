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
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combinations|
    board[combinations[0]] == board[combinations[1]] && board[combinations[0]] == board[combinations[2]] && position_taken?(board, combinations[0])
  end
end
#[9,9,9,9,9,9,9,9,9,9,9,9].all?{|x| x == 9} # => true
def full?(board)
  board.all?{|markers| markers == "X" || markers == "O"}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  while combinations = won?(board)
    return board[combinations[0]]
  end
end
