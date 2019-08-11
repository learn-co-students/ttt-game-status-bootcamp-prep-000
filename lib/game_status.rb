# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2], #Top Row 
    [3, 4, 5], #Middle Row 
    [6, 7, 8], #Bottom Row 
    [0, 3, 6], #First Column 
    [1, 4, 7], #Second Column 
    [2, 5, 8], #Third Column 
    [0, 4, 8], #Diagonal 1 
    [2, 4, 6], #Diagonal 2 
  ]
  
def won?(board)
  WIN_COMBINATIONS.detect do |combos|
    board[combos[0]] == board[combos[1]] && board[combos[1]] == board[combos[2]] &&
    position_taken?(board, combos[0])
  end
end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end 
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if winner = won?(board)
    board[winner.first]
  end
end