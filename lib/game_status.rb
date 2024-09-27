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

def xwin(array)
  array.all? { |d| d == "X"}
end

def owin(array)
  array.all? { |d| d == "O"}
end

def full?(board)
  board.none? { |f| f == " " }
end


def won?(board)
  WIN_COMBINATIONS.each do |i|
    result = []
    i.each do |j|
      result << board[j]
    end
    if owin(result)
      return i
    elsif xwin(result)
      return i
    end
    end
  return false
end

def draw?(board)
  if full?(board)
    if !won?(board)
      return true
    end
  end
    return false
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  end
  return false
end

def winner(board)
  WIN_COMBINATIONS.each do |i|
    result = []
    i.each do |j|
      result << board[j]
    end
    if owin(result)
      return "O"
    elsif xwin(result)
      return "X"
    end
    end
  return nil
end
