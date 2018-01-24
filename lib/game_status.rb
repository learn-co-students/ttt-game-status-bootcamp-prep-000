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
  WIN_COMBINATIONS.each do |combo|
    if combo.all? { |i| board[i] == "X" } || combo.all? { |i| board[i] == "O" }
      return combo
    end
  end
  nil
end

def full?(board)
  board.all? { |x| !(x.nil? || x == " ") }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  draw?(board) || won?(board)
end

def winner(board)
  trip = won?(board)
  if trip
    return board[trip[0]]
  end
  nil
end
