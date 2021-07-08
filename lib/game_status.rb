# Helper Method
require "pry"
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
  [2,4,6] # ETC, an array for each win combination
]
def won?(board)
  WIN_COMBINATIONS.any? do |i|
    #  binding.pry
    if  board[i[0]] == board[i[1]] && board[i[1]] == board[i[2]] && position_taken?(board, i[0])
      # binding.pry
    return  i
    end
  end
end
def full?(board)
  board.all? do |i|
    #  binding.pry
     i == "X" || i == "O"
  end
end
def draw?(board)
 full?(board) && !won?(board)
end
def over?(board)
full?(board) || won?(board) || draw?(board)
end

def winner(board)
  winner_arr = won?(board)
  if winner_arr
    winner_index = winner_arr[0]
    board[winner_index]
  end
end
