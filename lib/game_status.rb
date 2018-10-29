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
  [0,4,8],
]
def won?(board)
WIN_COMBINATIONS.each do |combination|
  i1 = combination[0]
  i2 = combination[1]
  i3 = combination[2]

  position_1 = board[i1]
  position_2 = board[i2]
  position_3 = board[i3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
return combination
elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
return combination
    end
  end
false
end

def full?(board)
board.all? do |inprogress|
  inprogress == "X" || inprogress == "O"
  end
end
def draw?(board)
if !won?(board) && full?(board)
 return true
  end
end

def over?(board)
if won?(board) || full?(board)

  return true
  end
end

def winner(board)
if won?(board)
  inprogress = won?(board)
  i = inprogress[0]
  if board[i] == "X"
    "X"
  elsif board[i] == "O"
      "O"
  end
else return nil
end
end
