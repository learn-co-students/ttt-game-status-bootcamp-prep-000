require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
]

def won?(board)
  winner = nil
  WIN_COMBINATIONS.each do |wc|
    x1 = wc[0]
    x2 = wc[1]
    x3 = wc[2]

    pos1 = board[x1]
    pos2 = board[x2]
    pos3 = board[x3]

    if pos1 == "X" && pos2 == "X" && pos3 == "X"
      winner = wc
    elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
      winner = wc
    end
  end
  winner
end

def full?(board)
  board.none?{|x| x == " "}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
