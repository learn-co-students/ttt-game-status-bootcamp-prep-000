# Helper Method
#require 'pry'

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
  return_val = false
  WIN_COMBINATIONS.select do |combo|
    if (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
      return_val = combo
    end
  end
  return_val
end

def full?(board)
  board.all? do |space|
    (space == "X" || space =="O")
  end
end

def draw?(board)
  (won?(board) == false && full?(board) == true)
end

def over?(board)
  (draw?(board) || won?(board))
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  else
    nil
  end
end
#def won2?(board)
  #WIN_COMBINATIONS.any?{|combo|
  #(board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") || (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O")
  #}
#end
#pry.start
