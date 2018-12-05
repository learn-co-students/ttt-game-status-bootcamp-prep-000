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
  [2,4,6],
  [0,4,8]
  ]

def won?(board)
  WIN_COMBINATIONS.each do|win_combination|
    if board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X"
    return win_combination
    elsif board[win_combination[0]] == "O" && board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    return win_combination
    end
  end
    false 
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def full?(board)
  board.all? do|index|
  index == "X" || index == "O"
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
  if full?(board) == true
    true
  elsif won?(board) != false 
    true
  elsif draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != false
    win_combination = won?(board)[0]
    board[won?(board)[0]]
  else
    nil
  end
end
  

