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
  [6, 4, 2]
]

def won?(board)
WIN_COMBINATIONS.detect do |win_combo|
  board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]] &&
    position_taken?(board, win_combo[0])
end
end

def full?(board)
    if board.include? (" ")
      return false
    else
      return true
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  end
end

def winner(board)
  if WIN_COMBINATIONS[0] == "X" && WIN_COMBINATIONS[1] == "X" && WIN_COMBINATIONS[2] == "X"
    return "X"
  elsif
    WIN_COMBINATIONS[0] == "O" && WIN_COMBINATIONS[1] == "O" && WIN_COMBINATIONS[2] == "O"
    return "O"
  end
end
