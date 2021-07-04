# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top Horizontal
  [3,4,5], # Middle Horizontal
  [6,7,8], # Bottom Horizontal
  [0,3,6], # Left Vertical
  [1,4,7], # Middle Vertical
  [2,5,8], # Right Vertical
  [0,4,8], # L to R Diag
  [2,4,6]  # R to L Diag
]

def won?(board)
  WIN_COMBINATIONS.each do |i|
    first = i[0]
    second = i[1]
    third = i[2]
    if board[first] == "X" && board[second] == "X" && board[third] == "X"
      winner = "X"
      return i
    elsif board[first] == "O" && board[second] == "O" && board[third] == "O"
      winner = "O"
      return i
    end
  end
  return false
end

def full?(board)
  if board.include?(" " || "")
    return false
  else
    return true
  end
end

def draw?(board)
  if full?(board) && won?(board) == false
    return true
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
  x_win = 0
  o_win = 0
  board.each do |i|
    if i == "X"
      x_win += 1
    elsif i == "O"
      o_win += 1
    end
  end

  if x_win > o_win
    return "X"
  elsif o_win > x_win
    return "O"
  end
end

# Define your WIN_COMBINATIONS constant
