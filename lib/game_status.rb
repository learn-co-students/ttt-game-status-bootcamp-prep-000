# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
def won?(board)
  if position_taken?(board, 1) && (board[0] == board[1] && board[1] == board[2])
    return [0,1,2]
  elsif position_taken?(board, 3) &&  (board[3] == board[4] && board[4] == board[5])
    return [3,4,5]
  elsif  position_taken?(board, 6) && (board[6] == board[7] && board[7] == board[8])
    return [6,7,8]
  elsif position_taken?(board, 0) && (board[0] == board[3] && board[3] == board[6])
    return [0,3,6]
  elsif position_taken?(board, 1) && (board[1] == board[7] && board[4] == board[7])
    return [1,4,7]
  elsif position_taken?(board, 2) && (board[2] == board[5] && board[5] == board[8])
    return [2,5,8]
  elsif position_taken?(board, 0) && (board[0] == board[4] && board[4] == board[8])
    return [0,4,8]
  elsif position_taken?(board, 2) && (board[2] == board[4] && board[4] == board[6])
    return [2,4,6]
  else
    return false
  end
end

def full?(board)
  board.all? do |n|
    n == "X" || n == "O"
  end
end

def draw?(board)
  if full?(board) && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
xs = []
board.each_with_index do |n, index|
  if board[index] == "X"
    xs << index
  end
end

os = []
board.each_with_index do |m, index|
  if board[index] == "O"
     os << index
  end
end

result = nil
WIN_COMBINATIONS.each do |arr|
  if (arr-xs).empty?
    result = "X"
  elsif (arr-os).empty?
    result = "O"
end
end
return result
end
