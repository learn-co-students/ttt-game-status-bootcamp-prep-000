# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # LR diagonal
  [2,4,6]  # RL diagonal
  # ETC, an array for each win combination
]

def won?(board)
won = false
  WIN_COMBINATIONS.each do |win_combination|
  	board_combo = []
  	win_combination.each do |i|
  		if position_taken?(board, i)
  			board_combo << board[i]
  		end
  	end
  	if board_combo.length == 3
  		won = board_combo.all? do |b_i|
  			b_i == board_combo[0]
  		end
  	end
  	if won == true
  		return win_combination
  	else
  		won
  	end
  end
  return won
end

def full?(board)
  index = 0
  board.all? do |content |
    content != " " || nil
  end
end

def draw?(board)
  index = 0
  if full?(board) && !(won?(board))
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false
    return nil
  elsif board[won?(board)[0]] == "X"
    return "X"
  elsif board[won?(board)[0]] == "O"
    return "O"
  end
end
