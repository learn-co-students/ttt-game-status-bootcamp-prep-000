# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  
  def won?(board)
    WIN_COMBINATIONS.detect do |winner|
      board[winner[0]] == board[winner[1]] &&
      board[winner[1]] == board[winner[2]] &&
      position_taken?(board, winner[0])
  end
end

def full?(board)
  board.all?{|move| move == "X" || move == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  if full?(board) || won?(board)
  true
  end
end

def winner(board)
  if combo = won?(board)
    board[combo.first]
  end
end
  