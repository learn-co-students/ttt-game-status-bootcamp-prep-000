# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)
  if (board[0]=="X" && board[1]=="X" && board[2]=="X")||(board[0]=="O" && board[1]=="O" && board[2]=="O")
    return WIN_COMBINATIONS[0]
    
  elsif (board[3]=="X" && board[4]=="X" && board[5]=="X")||(board[3]=="O" && board[4]=="O" && board[5]=="O")
    return WIN_COMBINATIONS[1]
  
  elsif (board[6]=="X" && board[7]=="X" && board[8]=="X")||(board[6]=="O" && board[7]=="O" && board[8]=="O")
    return WIN_COMBINATIONS[2]
  
  elsif (board[0]=="X" && board[3]=="X" && board[6]=="X")||(board[0]=="O" && board[3]=="O" && board[6]=="O")
    return WIN_COMBINATIONS[3]
  
  elsif (board[1]=="X" && board[4]=="X" && board[7]=="X")||(board[1]=="O" && board[4]=="O" && board[7]=="O")
    return WIN_COMBINATIONS[4]
  
  elsif (board[2]=="X" && board[5]=="X" && board[8]=="X")||(board[2]=="O" && board[5]=="O" && board[8]=="O")
    return WIN_COMBINATIONS[5]
  
  elsif (board[0]=="X" && board[4]=="X" && board[8]=="X")||(board[0]=="O" && board[4]=="O" && board[8]=="O")
    return WIN_COMBINATIONS[6]
  
  elsif (board[6]=="X" && board[4]=="X" && board[2]=="X")||(board[6]=="O" && board[4]=="O" && board[2]=="O")
    return WIN_COMBINATIONS[7]
  else
    return FALSE
  end
end

def full?(board)
  board.all?{|number| number=="X"||number=="O"} 
end

def draw?(board)
  if full?(board) && !won?(board)
    TRUE
  else
    FALSE
end
end

def over?(board)
  if draw?(board) || (full?(board) && won?(board)) || (!full?(board) && won?(board))
    TRUE
  else
    FALSE
  end
end

def winner(board)
  if got = won?(board)
    board[got.first]
  end
end