# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
  ]


 def won?(board)
    WIN_COMBINATIONS.detect {|combination|

	if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
	return combination
	elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
	return combination
	else
	false
	end
		}
end

def full?(board)

  if board.detect {|index| 
    index == nil || index == " "}
    return false
  else
    return true
  end
end


def draw?(board)
if !won?(board) && full?(board)
  return true
else 
  return false
end
end

def over?(board)
if won?(board) || full?(board) || draw?(board)
  return true
end
end

def winner(board)
  
 WIN_COMBINATIONS.detect {|combination|

	if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
	return "X"
	elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
	return "O"
	else
	nil
	end
		}
  
end