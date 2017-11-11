# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won? (board)
  WIN_COMBINATIONS.each do |index_array|
    combo = []
    index_array.each do |index|
      combo << board[index]
    end
    if combo.all? { |move| move == "X" } || combo.all? { |move| move == "O" }
      return index_array
    end
  end
  return false
end

def full?(board)
  board.all? do |element|
    element == "X" || element == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end
