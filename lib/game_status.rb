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
		if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
		 	return combo
		end
	end
		WIN_COMBINATIONS.each do |combo|
		if board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
		 	return combo
		end
	end
	return false 
end

def full?(board)
	board.all? do |spot|
		spot.include?("X") == true || spot.include?("O") == true
	end
end

def draw?(board)
	if won?(board)
		return false
	end
	if full?(board)
		return true
	end
end

def over?(board)
	if draw?(board)
		return true
	end
	if won?(board)
		return true
	end
	return false
end

def winner(board)
	if over?(board) == false
		return nil
	end

	WIN_COMBINATIONS.each do |combo|
		if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
		 	return "X"
		end
	end

	WIN_COMBINATIONS.each do |combo|
		if board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
		 	return "O"
		end
	end

end















