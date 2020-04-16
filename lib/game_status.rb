require "pry"
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
]

def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    position_taken?(board, win_combo[0]) && board[win_combo[0]] == board[win_combo[1]] && board[win_combo[1]] == board[win_combo[2]]
    end
  end

def full?(board)
  if board.all? {|i| i == "X" || i == "O"}
    return true
  else
    return false
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif !won?(board)
    return false
  else !full?(board)
    return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
   if won?(board)
      return board[won?(board)[0]]
   end
end
