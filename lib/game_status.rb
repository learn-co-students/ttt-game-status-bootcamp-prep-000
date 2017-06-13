board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # left diagonal
  [2, 4, 6]  # right diagonal
]
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  win_combo = []
  won = false

  WIN_COMBINATIONS.each do |combo|
    combo.each do |i|
      win_combo.push(board[i])
    end
    if (win_combo.all? { |i| i == "X"} || (win_combo.all? { |i| i=="O"}))
      return combo
    else
      win_combo = []
    end
  end
  # print win_combo
  return won
end

def full?(board)
  board.none?{ |i| i == " "}
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  if (full?(board) || (won?(board) != false) || draw?(board))
    return true
  end
end

def winner(board)
  winner = nil
  combo = []
  if (over?(board) && won?(board))
     combo = won?(board)
     winner = board[combo[0]]
  endl
  return winner
end

winner(board)
