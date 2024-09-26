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
  [0,4,8], # Across
  [2,4,6]  # Across
]

def won?(board)
  WIN_COMBINATIONS.each do |moves|
    if board[moves[0]] == "X" && board[moves[1]] == "X" && board[moves[2]] == "X"
      return moves
    end
    if board[moves[0]] == "O" && board[moves[1]] == "O" && board[moves[2]] == "O"
      return moves
    end
  end
  false
end

def full?(board)
  board.all? { |space| space == "X" || space == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if draw?(board) || !over?(board)
    return nil
  else
    return board[won?(board)[0]]
  end
end
