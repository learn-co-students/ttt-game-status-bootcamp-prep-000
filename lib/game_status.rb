# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |i|
    if i.all?{|index| board[index] == "X"}
      return i
    elsif i.all?{|index| board[index] == "O"}
      return i
    end
  end
  return false
end

def full?(board)
  return board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    true
  elsif won?(board) == false && full?(board) == false
    false
  elsif won?(board) == true
    true
  end
end

def over?(board)
  return won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    player = won?(board)
    return board[player[0]]
  else return nil
  end
end
