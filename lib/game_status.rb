# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # vertical middle row
  [6,7,8], # bottom row
  [0,3,6], # right row
  [1,4,7], # horitzonal middle row
  [2,5,8], # left row
  [0,4,8], # top left to bottom right diagonal
  [6,4,2] # bottom left to top right diagonal
  ]
  

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
  if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" 
      return win_combination
  elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
      return win_combination
    else
      false
    end
  end
false
end

def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  win = won?(board)
  if !(win == false)
    return board[win[0]]
  end
end