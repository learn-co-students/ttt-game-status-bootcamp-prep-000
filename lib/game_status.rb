# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal 1 (negative slope)
  [2,4,6]  # Diagonal 2 (positive slope)
]

def won?(board) # Return the win combination, if any. Otherwise, return false.
  # Maybe I should make this easier to read (see Solution for better code)
  WIN_COMBINATIONS.each do|win_combination| # Examine each 3-element win_combination
    
    # all_x is true if the board has an "X"
    # at each win_index of the current win_combination array
    all_x = win_combination.all? do |win_index|
      board[win_index] == "X"
    end
    
    all_o = win_combination.all? do |win_index|
      board[win_index] == "O"
    end
    
    if all_x || all_o # Move onto the next win_combination if this is false
      return win_combination
    end
  end
  false # No win combinations were found
end

def full?(board)
  board_indexes = [0,1,2,3,4,5,6,7,8]
  # I could make an array for a board of any length with a while loop.
  # But, let's assume that the board's length is 9, since it's Tic Tac Toe.
  
  board_indexes.all? do |index|
    position_taken?(board, index)
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  #draw? can only be true if #full? is true, so I really only need to check one of them.
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  winning_player = won?(board) # This is either false, or it's a win combination.
  
  if winning_player
    board[winning_player[0]] # This will be "X" or "O"
  end
  # This will return nil if winning_player is false.
end