# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6]
]

def won?(board)
	WIN_COMBINATIONS.each do |win_combination|
		w1 = win_combination[0]
		w2 = win_combination[1]
		w3 = win_combination[2]

		p1 = board[w1]
		p2 = board[w2]
		p3 = board[w3]

		if p1 == "O" && p2 == "O" && p3 == "O"
			return win_combination
		elsif p1 == "X" && p2 == "X" && p3 == "X"
			return win_combination
		end
	end
	return false
end

def full?(board)
	board.all? do |check|
		check == "X" || check == "O"
	end
end

def draw?(board)
	!won?(board) && full?(board)
end

def over?(board)
	won?(board) || draw?(board) || full?(board)
end

def winner(board)
	if won?(board)
		x = won?(board)
		board[x.first]
	end
	

end
