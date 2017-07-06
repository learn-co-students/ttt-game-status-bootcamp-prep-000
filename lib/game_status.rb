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

def position_indexer(board, player="X")
  position_indexes = []
  board.each_index do |i|
    if board[i] == player
      position_indexes << i
    end
  end
  position_indexes
end

def won?(board)
  xpos_index = position_indexer(board)
  opos_index = position_indexer(board, "O")

  WIN_COMBINATIONS.detect do |array|
    array.all? { |e| xpos_index.include?(e)} || array.all? { |e| opos_index.include?(e)}
  end
end

def full?(board)
  board.all? do |cell|
    cell == "X" || cell == "O"
  end
end

def draw?(board)
  if full?(board) && won?(board) == nil
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  won_result = won?(board)
  if won_result == nil
    nil
  else
    board[won_result[0]]
  end
end
