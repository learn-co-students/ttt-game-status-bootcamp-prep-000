# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #top row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #top left to bot right diagonal
  [2,4,6]  #top right to bot left diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_con|
    board[win_con[0]] == board[win_con[1]] && board[win_con[1]] == board[win_con[2]] && position_taken?(board, win_con[0])
  end
end

def full?(board)
  board.none? do |pos|
    pos == " " || pos.nil?
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  board[won?(board)[0]] if won?(board)
end
