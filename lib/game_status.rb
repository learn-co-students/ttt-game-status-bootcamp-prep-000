# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end
# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]
]

$x = []
def won?(board)
  y = []
  WIN_COMBINATIONS.each do |win_combo| # ex [0,1,2]
    $x = win_combo
    if $x.all?{|i| board[i] == "X"} || $x.all?{|i| board[i] == "O"}
      y = $x
      break
    else
      y = nil
    end
  end
  return y
end

def full?(board)
  if board.none?{|i| i == " "}
    true
  else
    false
  end
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  end
end

def over?(board)
  if draw?(board) || won?(board) != nil
    true
  end
end

def winner(board)
  if won?(board) != nil
    if won?(board).all?{|i| board[i] == "X"}
      "X"
    elsif won?(board).all?{|i| board[i] == "O"}
      "O"
    end
  end
end
