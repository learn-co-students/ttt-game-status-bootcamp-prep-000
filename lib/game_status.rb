# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Left/Right diagonal
  [2, 4, 6] # Right/Left diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    windex0 = combo[0]
    windex1 = combo[1]
    windex2 = combo[2]

    position_0 = board[windex0]
    position_1 = board[windex1]
    position_2 = board[windex2]

    if position_taken?(board, windex0) && position_0 == position_1 && position_1 == position_2
      return combo
    end
  end
  false
end

def full?(board)
  !(board.include?(" ") || board.include?(""))
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  end
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end

board = []
9.times do
  board << " "
end
board[0] = "X"
board[1] = "X"
board[2] = "X"

puts full?(board)
