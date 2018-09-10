require 'pry'
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS =[
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
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
    return combo
  end
end
return false
end

def full? (board)
  if board.detect { |i| i == " " }
    return false
  else 
    return true
  end
end

def draw? (board)
  if !won?(board) && full?(board)
    return true
  else
    return false 
  end
end

def over? (board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return
  end
end

def winner(board)
  win_combination = won?(board)
  if win_combination
    board[win_combination[0]]
  end
end