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
[0,4,8],
[2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
  	if  board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||
        board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
  	  return combo
  	end
  end
  	return false
end

def full?(board)
  if board.detect {|i| i == "" || i == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board)
    return false
  elsif full?(board)
    return true
  end
end

def over?(board)
  if full?(board) || won?(board)
    p "GAME OVER!"
    return true
  end
end

def winner(board)

  if won?(board) == false
    return nil
  end
  x = board[won?(board)[0]]
  if x == "X"
	  return "X"
  end
  if x == "O"
    return "O"
  end

end
