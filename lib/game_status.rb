# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Columns
  [1,4,7],
  [2,5,8],
  [0,4,8], #diagonals
  [2,4,6]
]


def wins?(combo, board)
  combo.all? {|pos| board[pos] == "X"} || combo.all? {|pos| board[pos] == "O"}
end

def won?(board)
  WIN_COMBINATIONS.detect {|combo| wins?(combo, board)}
end

def full?(board)
  puts board.inspect
  !(board.include?(" "))
end

def draw?(board)
  
  #returns true if the board has not been won and is full 
  if !won?(board) && full?(board)
    return true
  end

  #returns false if the board is not won and the board is not full
  if !won?(board) && !full?(board)
    return false
  end
  
  #returns false if the board is won
  if won?(board)
    return false
  end
  
end

#returns true if the board has been won, is a draw, or is full
def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  combo =  won?(board)
  if combo
    return board[combo[0]]
  end
end

