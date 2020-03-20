# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row 
  [3,4,5], # Middle row 
  [6,7,8], # bottom row
  [2,5,8], # all right
  [1,4,7], # middle down
  [0,3,6], # all left 
  [6,4,2], # diagonal
  [8,4,0] # diagonal
]
  
# Define won method 
def won?(board)
  WIN_COMBINATIONS.detect do |win_combination|
    # basically if the combinations are equal to one another
    # and there is a position taken 
    # we change index with win_combination[0] to represent
    # the fact that the position taken is a win.
    # return true 
    board[win_combination[0]] == board[win_combination[1]] && board[win_combination[1]] == board[win_combination[2]] && position_taken?(board,win_combination[0])
  end 
end

def full?(board)
  # remember all enumerable states if the board has all 
  board.all?{|token| token == "X" || token == "O"}
end 

def draw?(board)
  full?(board) && !won?(board)
end 

def over?(board)
  # game is over when the game is won?(board)
  # or if the board is full is the only way
  won?(board) || full?(board)
end 

def winner(board)
  if winning_combination = won?(board)
    # if there is a winner return the 
    # first array of the winning combination
    board[winning_combination.first]
  end 
end 