# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
  [0,1,2],[3,4,5],[6,7,8], # win by horizontal row
  [0,3,6],[1,4,7],[2,5,8], # win by vertical column
  [0,4,8],[2,4,6]          # win by diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    all_x = combo.all? do |index|
      board[index] == "X"
    end
    all_o = combo.all? do |index|
      board[index] == "O"
    end
    if all_x || all_o
      return combo
    end
  end
  false
end

def full?(board)
  result = board.all? do |position|
    position == "X" || position == "O"
  end
  result
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
  false
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  end
  false
end

def winner(board)
  win = won?(board)
  if win
    return board[win[0]]
  end
  nil
end
