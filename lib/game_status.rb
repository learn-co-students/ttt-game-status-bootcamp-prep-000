# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  won = WIN_COMBINATIONS.find do |combo|
    pieces = combo.map { |pos| board[pos] }
    pieces.uniq.length == 1 && position_taken?(board, combo[0])
  end
end

def full?(board)
  board.all? { |piece| piece == 'X' || piece == 'O' }
end

def draw?(board)
  !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  won = won?(board)
  won.nil? ? nil : board[won[0]]
end