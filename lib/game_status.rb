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
  [6,4,2],
]

def won?(board)
  WIN_COMBINATIONS.each do |x|
    p1 = board[x[0]]
    p2 = board[x[1]]
    p3 = board[x[2]]
    if p1 == "X" && p2 == "X" && p3 == "X"
      return [x[0], x[1], x[2]]
    elsif p1 == "O" && p2 == "O" && p3 == "O"
      return [x[0], x[1], x[2]]
    end
  end
  return false
end

def full?(board)
  board.each do |x|
    if x == " "
      return false
    end
  end
  true
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  elsif !won?(board) && !full?(board)
    return false
  elsif won?(board)
    return false
  end
end

def over?(board)
  if full?(board) || draw?(board) || won?(board)
    return true
  end
end


def winner(board)
  count_x = 0
  count_o = 0
  board.each do |x|
    if x == "X"
      count_x +=1
    elsif x == "O"
      count_o +=1
    end
  end

  if won?(board) && count_x > count_o
    "X"
  elsif won?(board) && count_x < count_o
    "O"
  else
    nil
  end
end
