# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def empty?(board)
  board.all? {|e| e==nil || e==" "}
end
def full?(board)
  board.all? {|e| e=="X" || e=="O"}
end
def won?(board)
  if empty?(board)
    false
  else
    WIN_COMBINATIONS.detect do |indexes|
      indexes.all? { |e| board[e]=="X" } ||
      indexes.all? { |e| board[e]=="O" }
    end
  end
end
def draw?(board)
  full?(board) && !won?(board)
end
def over?(board)
  won?(board) || draw?(board)
end
def winner(board)
  board[won?(board)[0]] if won?(board)
end
