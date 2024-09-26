# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #right diagonal
  [2,4,6], #left diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |moves|
    board[moves[0]] == board[moves[1]] &&
    board[moves[1]] == board[moves[2]] &&
    position_taken?(board, moves[0])
  end
end

def full?(board)
  board.all?{|move| move == "X" || move == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end


def winner(board)
  if winning_moves = won?(board)
    board[winning_moves.first]
  end
end
