# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  # row combos
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],

  # col combos
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],

  # diag combos
  [0, 4, 8],
  [2, 4, 6]
]

# ----- start of code -----
def won?(board)
  win = false

  WIN_COMBINATIONS.each do |win_combo|
    all_x = win_combo.all? {|pos| board[pos] == "X"}
    all_o = win_combo.all? {|pos| board[pos] == "O"}

    if (all_x || all_o)
      win = win_combo
    end
  end

  return win
end

def full?(board)
  board.all? {|pos| pos == "X" || pos == "O"}
end

def draw?(board)
  draw = false

  if full?(board)
    if !(won?(board))
      draw = true
    end
  end

  return draw
end

def over?(board)
  over = false

  if full?(board) || won?(board) || draw?(board)
    over = true
  end

  return over
end

def winner(board)
  token = nil

  if won?(board)
    win_combo = won?(board)
    token = board[win_combo[0]]
  end

  return token
end
