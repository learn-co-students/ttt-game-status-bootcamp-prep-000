# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == ' ')
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
  [0, 4, 8], [2, 4, 6] # Diagonals
].freeze

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    return combination if won_with_this(board, combination)
  end
  false
end

def won_with_this(board, spaces)
  symbols = [board[spaces[0]], board[spaces[1]], board[spaces[2]]]
  symbols.all? { |symbol| symbol == 'X' } ||
    symbols.all? { |symbol| symbol == 'O' }
end

def full?(board)
  board.all? { |space| %w(X O).include?(space) }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    winning_symbol_position = won?(board)[0]
    return board[winning_symbol_position]
  end
  nil
end
