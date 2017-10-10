# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |win|
    if win.all?{|i| board[i] == "X"}
      return win
    elsif win.all?{|i| board[i] == "O"}
      return win
    end
  end
  return false
end

def full?(board)
  board.none? do |token|
    if token == " "
      true
    else
      false
    end
  end
end

def draw?(board)
  WIN_COMBINATIONS.each do |win|
    if win.all?{|i| board[i] == "X"}
      return false
    elsif win.all?{|i| board[i] == "O"}
      return false
    end
  end
  return true
end

def over?(board)
  if full?(board)
    return true
  elsif won?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    WIN_COMBINATIONS.each do |win|
      if win.all?{|i| board[i] == "X"}
        return "X"
      elsif win.all?{|i| board[i] == "O"}
        return "O"
      end
    end
  end
  return nil
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8],
]
