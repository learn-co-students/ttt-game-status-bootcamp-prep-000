# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |winning_array|
  if (winning_array.all?{|index| board[index] == "X"}) || (winning_array.all?{|index| board[index] == "O"})
    return winning_array
  end
end
return false
end

def full?(board)
if board.all?{|includes| includes == "X" || includes == "O"}
  return true
else
  return false
end
end

def draw?(board)
if won?(board) != false
  return false
elsif full?(board) == true
  return true
else
  return false
end
end

def over?(board)
  if (draw?(board) == true) || (full?(board) == true) || (won?(board) != false)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
    return nil
end
end
