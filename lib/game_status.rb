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

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    pos1 = board[combo[0]]
    pos2 = board[combo[1]]
    pos3 = board[combo[2]]

    if pos1 == "X" && pos2 == "X" && pos3 == "X"
      return combo
    end
    if pos1 == "O" && pos2 == "O" && pos3 == "O"
      return combo
    end
  end
  return false
end

def full?(board)
  board.none? do |p|
    p == " "
  end
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if !over?(board) || draw?(board)
    return nil
  else
    return board[won?(board)[0]]
  end
end
