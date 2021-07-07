# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constat

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
winner = []
def won?(board)
  WIN_COMBINATIONS.detect do |check|
   position_taken?(board, check[0]) && board[check[0]]== board[check[1]] && board[check[1]] == board[check[2]] 
 end
end

def full?(board)
  board.none?{|i| i == " "} 
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
  won_token = won?(board)
  board[won_token.first]
end
end
