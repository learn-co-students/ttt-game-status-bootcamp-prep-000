# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #first column
  [1, 4, 7], #second column
  [2, 5, 8], #third column
  [0, 4, 8], #diagonal down
  [2, 4, 6]  #diagonal up
]

def won?(b)
  WIN_COMBINATIONS.detect do |c|
    (b[c[0]] == "X" && b[c[1]] == "X" && b[c[2]] == "X") || (b[c[0]] == "O" && b[c[1]] == "O" && b[c[2]] == "O")
  end
end

def full?(board)
  (1..8).all? {|i| position_taken?(board, i)}
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  won?(board) || draw?(board) ? true : false
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
