# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
[0,1,2],
[0,3,6],
[0,4,8],
[1,4,7],
[2,5,8],
[2,4,6],
[3,4,5],
[6,7,8]
]
def won?(board)
  WIN_COMBINATIONS.detect do|win_combo|
    index1=win_combo[0]
    index2=win_combo[1]
    index3=win_combo[2]
    win1=board[index1]
    win2=board[index2]
    win3=board[index3]
  if win1=="X" && win2=="X" && win3=="X"
    return win_combo
  elsif win1=="O" && win2=="O" && win3=="O"
    return win_combo
  else
    false
 end
 end
end
def full?(board)
  board.all? do |value|
    if value=="X" || value=="O"
      true
    else
      false
    end
  end
end
def draw?(board)
  if !won?(board) && full?(board)
    return true
  elsif (!won?(board) && !full?(board)) || full?(board)
    return false
  end
end
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  else
    false
  end
end

def winner(board)
  if win_combo=won?(board)
  return board[win_combo[0]]
else
  return nil
end
end
