require 'pry'
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
  [2, 4, 6]
]

# def won?(board)
#   WIN_COMBINATIONS.each do |win_combination|
#     if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
#       return win_combination
#     elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
#       return win_combination
#     end
#   end
#   false
# end

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
   return win_combination if win_combination.all?{|i| board[i] == "X" }
   return win_combination if win_combination.all?{|i| board[i] == "O" }
  end
  false
end

def full?(board)
  board.detect do |i|
    return false if i == " " || nil
  end
  true
end

def draw?(board)
  !(won?(board)) && full?(board)
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  end
end

def winner(board)
  if won?(board) == false
    return nil
  else
  won?(board).each do |i|
    return "X" if board[i] == "X"
    return "O" if board[i] == "O"
  end
  end
end
