# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
result = false
WIN_COMBINATIONS.each do |set|
  if board[set[0]] == "X" && board[set[1]] == "X" && board[set[2]] == "X"
    result = set
  elsif board[set[0]] == "O" && board[set[1]] == "O" && board[set[2]] == "O"
    result = set
  end
end
result
end

def full?(board)
filled = board.all? do |spot|
  spot != " " && spot != ""
end
filled
end

def draw?(board)
end

def over?(board)
end

def winner(board)
end
