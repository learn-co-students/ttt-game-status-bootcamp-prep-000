# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top horizontal
  [3,4,5], #Middle horizontal
  [6,7,8], #Bottom horizontal
  [0,3,6], #Left vertical
  [1,4,7], #Middle vertical
  [2,5,8], #Right vertical
  [0,4,8], #Left-to-right diagonal
  [2,4,6] #Right-to-left diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect{|win_combo|
    board[win_combo[0]] == board[win_combo[1]] &&
    board[win_combo[1]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
  }
end

def full?(board)
  board.all? {|cell| cell == "X" || cell == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
