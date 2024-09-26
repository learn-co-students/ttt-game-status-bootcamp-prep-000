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

	count = 0

	WIN_COMBINATIONS.each do |awin|

		if board[awin[0]] == "X" && board[awin[1]] == "X" && board[awin[2]] == "X"
			return awin
     	break
		elsif board[awin[0]] == "O" && board[awin[1]] == "O" && board[awin[2]] == "O"
			return awin
     	break
		end
    count += 1
  end

	if count == 8
		return false
	end
end

def full?(board)

  count = 0

  board.each do |x|
    if x == "X" || x == "O"
      count += 1
    end
  end

  if count == 9
    return true
  else
    return false
  end
end

def draw?(board)

  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)

  if draw?(board) == true || full?(board) == true || won?(board) != false
    return true
  else
    return false
  end
end

def winner(board)

  if won?(board) != false

    if board[won?(board)[0]] == "X"
      return "X"
    elsif board[won?(board)[0]] == "O"
      return "O"
    end

  else
    return nil
  end
end
