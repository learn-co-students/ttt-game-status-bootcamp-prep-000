# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |el|
    pos1 = board[el[0]]
    pos2 = board[el[1]]
    pos3 = board[el[2]]
    if (pos1 == "X" && pos2 == "X" && pos3 == "X") || (pos1 == "O" && pos2 == "O" && pos3 == "O")
      return el
    end
  end
  return false
end

def full?(board)
  board.all? do |el|
    position_taken?(board, board.index(el))
  end
end

def draw?(board)
  full?(board) && !(won?(board)) ? true : false
end

def over?(board)
  won?(board) || draw?(board) ? true : false
end

def winner(board)
  if won?(board)
    arr = won?(board)
    winning = board[arr[0]]
    return winning
  else
    return nil
  end
end
