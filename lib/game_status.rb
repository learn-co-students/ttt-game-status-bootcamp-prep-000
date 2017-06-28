require 'pry'

# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5],
  [6,7,8],
  [0,3,6], #first col
  [1,4,7],
  [2,5,8],
  [0,4,8], #diag
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|
    if ((board[combination[0]] == board[combination[1]]) && (board[combination[1]] == board[combination[2]]) && (board[combination[0]] != " "))
      return combination
    end
  end
  return false
end

def full?(board)
  if board.any? { |pos| pos == " "}
    false
  else
    true
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  winning_combo = won?(board)
  if winning_combo.kind_of?(Array)
    return board[winning_combo[0]]
  end
  nil
end
