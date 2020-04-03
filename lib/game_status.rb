# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.each do |array|
    matchesX = []
    matchesO = []
    array.each do |position|
      matchesX << position if board[position] == "X"
      matchesO << position if board[position] == "O"
    end
    if matchesX.length == 3
      return matchesX
    elsif matchesO.length == 3
      return matchesO
    end
  end
  return false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  !won?(board) && full?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board) == false
    puts nil
  else
    win = won?(board)[0]
    board[win]
  end
end
