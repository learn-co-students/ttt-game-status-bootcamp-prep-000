# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  if board.all? {|a| a == " "}
    return false
  end
  WIN_COMBINATIONS.each do |combo|
    pos1 = board[combo[0]]
    pos2 = board[combo[1]]
    pos3 = board[combo[2]]
    if pos1 == pos2 && pos2 == pos3 && pos1 != " "
      return combo
    end
  end
  return false
end

def full?(board)
  board.none? {|a| a == " "}
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  combo = won?(board)
  if !combo
    return nil
  else
    board[combo[0]]
  end
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
