# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    if(board[win_combo[0]].upcase == "X" && board[win_combo[1]].upcase == "X" && board[win_combo[2]].upcase == "X" )
      return win_combo
    elsif (board[win_combo[0]].upcase == "O" && board[win_combo[1]].upcase == "O" && board[win_combo[2]].upcase == "O" )
      return win_combo
    end
  end
  return false
end

def full?(board)
  return (!((board.include?(" ")) || (board.include?(""))))
end

def draw?(board)
  return (full?(board) && (!(won?(board))))
end

def over?(board)
  return (won?(board) || full?(board) || draw?(board))  
end

def winner(board)
  if(won?(board))
    return (board[won?(board)[0]])
  else
    return nil
  end
end


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]