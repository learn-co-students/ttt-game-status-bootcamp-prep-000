# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
WIN_COMBINATIONS.detect do |combo|
   board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[1])
 end
end

def full?(board)
board.all? { |space| space == "X" || space == "O" }
end

def draw?(board)
WIN_COMBINATIONS.none? do |combo|
  board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]] && position_taken?(board, combo[1])
end
end

def over?(board)
if full?(board) == true
  return true
else
  return false
end
end

def winner(board)
  if game_winner = won?(board)
board[game_winner.first]
end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
