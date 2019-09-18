# Helper Method

require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X" 
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  end
return false
end

def full?(board)
  board_count = 0
  board.each do |token|
    if token == "X" || token == "O"
      board_count += 1
    end
  end
  if board_count < 9
    false
  else
    true
  end
  # board.all?{|token| token == "X" || token == "O"}
end

def draw?(board)
  full?(board) && !won?(board) 
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if index = won?(board)
    board[index[0]]
  end
end