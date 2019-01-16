require 'pry'
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
def get_board_combo(board, combo)
  combo.map{|x| board[x]}
end
def won?(board)
  wins = WIN_COMBINATIONS.detect do |win_combo|
    board_combo = get_board_combo(board, win_combo)
    if board_combo == ['X','X','X']
      board_combo
    elsif board_combo == ['O','O','O']
      board_combo
    end
  end
end

def full?(board)
  if board.detect {|x| x == " "}
    FALSE
  else
    TRUE
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return TRUE
  else
    return FALSE
  end
end

def over?(board)
  if draw?(board) || won?(board)
    return TRUE
  end
end

def winner(board)
  if index = won?(board)
    board[index[0]]
  end
end
  