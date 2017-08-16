# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #1
  [3,4,5], #2
  [6,7,8], #3
  [0,4,8], #4
  [2,4,6], #5
  [0,3,6], #6
  [1,4,7], #7
  [2,5,8]  #8
]
def won?(board)
  WIN_COMBINATIONS.detect do |d|
    board[d[0]]==board[d[1]]&&
    board[d[1]]==board[d[2]]&&
    position_taken?(board, d[0])
  end
end

def full?(board)
  x = board.count('X')
  o = board.count('O')
  !(x > o && x < 5)
end

def draw?(board)
  x = board.count('X')
  o = board.count('O')
  (x == 5 || o == 5) && !(won?(board))
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  x = board.count('X')
  o = board.count('O')

  if x > o
    "X"
  elsif o > x
    "O"
  else
    nil
  end
end
