# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # top-left to bottom-right diagonal
  [2, 4, 6] # top-right to bottom-left diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |outer_pos| # First true, returns. Otherwise, nil
    win = false
    if position_taken?(board,outer_pos[0]) # If the first pos has X or O
      first_char = board[outer_pos[0]]     # Save the first char
      win = outer_pos.all? do |inner_pos|  # Make sure rest of row has same char
        board[inner_pos] == first_char
      end
    end
    win #returns true or false to the WIN_COMBINATIONS.detect
  end
end

def full?(board)
  board.all? do |pos|
    pos == "X" || pos == "O"
  end
end

def draw?(board)
  if !won?(board)
    if full?(board)
      return true
    else
      return false
    end
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
  return false
end

def winner(board)
  if !won?(board)
    return nil
  else
    board[won?(board)[0]]
  end
end
