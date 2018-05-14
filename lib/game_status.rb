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
  [0,4,8], # Right Diagonal
  [2,4,6]  # Left Diagonal
]

def won?(board)
  i = 0
  x_moves = []
  o_moves = []
  board.each do |token|
    if token == "X"
      x_moves << i
    elsif token == "O"
      o_moves << i
    end
    i += 1
  end

  winners = false
  WIN_COMBINATIONS.each do |combos|
    if combos.all? {|combo| x_moves.include?(combo)}
      winners = combos
      # winners << combos[0]
      # winners << combos[1]
      # winners << combos[2]
    elsif combos.all? {|combo| o_moves.include?(combo)}
      winners = combos
    end
  end
    return winners
end

def full?(board)
  !(board.include?("") or board.include?(" "))
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  index = won?(board)
  if index
    board[index[0]]
  else
    nil
  end
end
