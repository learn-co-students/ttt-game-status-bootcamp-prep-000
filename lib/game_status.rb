# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],  # row1
  [3,4,5],  # row2
  [6,7,8],  # row3
  [0,3,6],  # column1
  [1,4,7],  # column2
  [2,5,8],  # column3
  [0,4,8],  # diag left to right
  [2,4,6]   # diag right to left
]


def won?(board) 
  WIN_COMBINATIONS.each do |wincombo| 
    if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X" 
      return wincombo 
    elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O" 
      return wincombo 
      end 
  end 
  false 
end



def full?(board)
  if board.detect {|i| i == " " || i == nil}
    return false
  else
    return true
  end
end



def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  end
  if won?(board) == false && full?(board) == false
    return false
  end
  if won?(board) == true
    return false
  end
end



def over?(board)
  if full?(board) || draw?(board) || won?(board)
    return true
  else
    return false
  end
end


def winner(board)
  WIN_COMBINATIONS.each do |wincombo| 
    if (board[wincombo[0]]) == "X" && (board[wincombo[1]]) == "X" && (board[wincombo[2]]) == "X" 
      return "X" 
    elsif (board[wincombo[0]]) == "O" && (board[wincombo[1]]) == "O" && (board[wincombo[2]]) == "O" 
      return "O"
      end 
  end 
  nil 
end




