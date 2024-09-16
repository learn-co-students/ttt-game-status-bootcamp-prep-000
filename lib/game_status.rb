# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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

def won?(board)
  count = 0
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all?{|i| board[i] == "X"} || win_combo.all?{|i| board[i] == "O"}
      return win_combo
    else
      count += 1
    end
    end
    if board.all? { |e| e == " "} || board.all? { |e| e == ""}
      return false
  end
  if count = 8
    return false
  end
end

def full?(board)
  if board.detect { |e| e == "" } || board.detect { |e| e == " " }
    return false
  else
    true
  end
end

def draw?(board)
 if won?(board) === false && full?(board) === true
   return true
 elsif won?(board) != false && full?(board) === false
   return false
 else
   false
 end
end

def over?(board)
  if won?(board) != false || full?(board) === true || draw?(board) === true
    return true
  end
end

def winner(board)
  if won?(board) != false && over?(board) === true
    return board[won?(board)[0]]
  end
end
