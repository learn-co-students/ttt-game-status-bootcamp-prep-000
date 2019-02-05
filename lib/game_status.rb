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
  [2, 4, 6]
]

def won?(board)
  x_indices = []
  o_indices = []
  win_status = false

  board.each_index do |i|
    x_indices << i if board[i] == "X"
    o_indices << i if board[i] == "O"
  end


 WIN_COMBINATIONS.each do |combination|
    win_status = combination if x_indices & combination == combination
    win_status = combination if o_indices & combination == combination
  end
  win_status
end

def full?(board)
  board.none?{|space| space === " "} && !won?(board)
end

def draw?(board)
  full?(board)
end

def over?(board)
  draw?(board) || won?(board)

def winner(board)
  winning_indices = won?(board)
  winner = won?(board) ? board[winning_indices[0]] : nil
  winner
end
