# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  
  
  def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
      index_one=win_combo[0]
      index_two=win_combo[1]
      index_three=win_combo[2]
      if ((board[index_one]=="X" && board[index_two]=="X" && board[index_three]=="X") || (board[index_one]=="O" && board[index_two]=="O" && board[index_three]=="O"))
        return win_combo
      end
    end
    return false
  end
  
  def full?(board)
    board.all? {|element| (element=="X" || element=="O")}
  end
 
def draw?(board)
  if (!won?(board) && full?(board))
    return true
  elsif (!won?(board)  && !full?(board))
    return false
  elsif won?(board)
    return FALSE
  end
end
 
def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) 
    if board[won?(board)[0]]=="X"
      return "X"
    else
      return "O"
    end
  else
    return nil
  end
end

