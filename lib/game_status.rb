# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |x|
  if board[x[0]]==board[x[1]] && board[x[1]]==board[x[2]] && board[x[1]]== "X" || board[x[0]]==board[x[1]] && board[x[1]]==board[x[2]] && board[x[1]]== "O"
     return x
  end
end
false
end

def full?(board)
  if board.include? (" ")||board.include?("")
false
else
true
end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  if (!(won?(board)) && !(full?(board))) || won?(board)
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
return true
end
end

def winner(board)
if won?(board)
  return board[won?(board)[0]]
end
end
