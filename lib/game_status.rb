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
  x = board.select do |pos|
    pos == "X"
  end
  o = board.select do |pos|
    pos == "O"
  end
  WIN_COMBINATIONS.each do |arr|
    x_bool = arr.all? do |index|
      board[index] == "X"
    end
    o_bool = arr.all? do |index|
      board[index] == "O"
    end
    if x_bool || o_bool
      return arr
    end
  end
  false
end

def full?(board)
  board.all? do |pos|
    pos == "X" || pos == "O"
  end
end

def draw?(board)
  won?(board) == false && full?(board)
end

def over?(board)
  won?(board) != false || draw?(board)
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end
