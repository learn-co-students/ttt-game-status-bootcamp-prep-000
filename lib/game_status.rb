# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.detect{|l|
    l.collect{|x| board[x]}.uniq.length == 1 && position_taken?(board, l[0])}
end

def full?(board)
  board.all?{|x| x == "X" || x == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won_game = won?(board)
  if won_game
    board[won_game[0]]
  end
end