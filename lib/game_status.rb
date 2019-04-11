require "pry"


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
	WIN_COMBINATIONS.each do |combo|
		arr = []
		for i in combo
			arr.push(board[i])
			if arr == ["X","X","X"] || arr == ["O","O","O"]
				return combo
			end
		end
	end
	return false
end

def full?(board)
	for i in board
		if i == " " || i == ""
			return false
		end
	end
	true
end

def draw?(board)
	if !won?(board) && full?(board)
		return true
	end
	false
end

def over?(board)
	if full?(board) || won?(board) || draw?(board)
		# binding.pry
		return true
	end
	return false
end

# over?(["X", " ", "X", " ", "X", " ", "O", "O", " "])

def winner(board)
	combo = won?(board)
	if won?(board)
		for i in combo
			return board[i]
		end
	end
end