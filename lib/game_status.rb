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
  [0,4,8], # Diagonal
  [2,4,6] # Diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    who = nil
    who = board[combo[0]] if position_taken?(board, combo[0])

    return combo if (board[combo[1]] == who && board[combo[2]] == who)
  end
  false
end

def full?(board)
  board.each do |cell|
    return false if cell == ' '
  end
  true
end

def draw?(board)
  if won?(board)
    false
  elsif !full?(board) && !won?(board)
    false
  elsif full?(board) && !won?(board)
    true
  end
end

def over?(board)
  return true if full?(board) || draw?(board) || won?(board)
  false
end

def winner(board)
  combo = won?(board)
  if combo
    board[combo[0]]
  end
end
