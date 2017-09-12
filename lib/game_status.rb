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
  arrays = WIN_COMBINATIONS.select { |c| ( board[c[0]] == board[c[1]] && board[c[0]] == board[c[2]] ) && ( board[c[0]] == "X" || board[c[0]] == "O" ) }
  if arrays == []
    return false
  else
    return arrays[0]
  end
end

def full?(board)
  arrays = board.select { |s| s == " " || s == "" }
  return arrays == []
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  winner = won?(board)
  if winner
    board[winner[0]]
  else
    nil
  end
end
