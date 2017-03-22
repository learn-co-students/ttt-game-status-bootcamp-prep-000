# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],  # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal 1
  [2,4,6], # Diagonal 2
]


def check_winners(board)
  WIN_COMBINATIONS.each do |winning_array|
    new_array = [ ] #placement is very important.  Did not work where this was outside the WIN_COMBINATIONS each do
    winning_array.each do |index|
      new_array << board[index]
    end
    if new_array == ["X", "X", "X"] || new_array == ["O", "O", "O"]
      return winning_array # note the return is telling the whole method to stop! Distinguish this from break!
    end
  end
  return false # this is what got a return of false on a draw
end

def won?(board)
  board_empty = board.all? do |space|
    space == " "
  end
  if board_empty == true
    return false #return false
  else
    check_winners(board)
  end
end

def full?(board)
  board_full = board.all? do |space|
    space != " "
  end
  if board_full == true
    true
  else
    false
  end
end

def draw?(board)
  any_winner = won?(board)
  board_full = full?(board)
  if any_winner != false #Don't feel great about this, but it's how I tested for false if game won -- because won? will either produce false or an array -- it won't produce true
      false
  elsif board_full == false
    false
  else
    true
  end
end

def over?(board)
  if draw?(board) || won?(board) # Note this is a good example of how you can run a function for "true".  This says, if running these produces true, then the return here is true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    winny = won?(board)
    board[winny[0]]
  end
end
