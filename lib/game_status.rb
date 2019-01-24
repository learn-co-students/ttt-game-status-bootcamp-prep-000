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
	WIN_COMBINATIONS.each do |combo|
		win_index_1 = combo[0]
		win_index_2 = combo[1]
		win_index_3 = combo[2]

		position_1 = board[win_index_1]
		position_2 = board[win_index_2]
		position_3 = board[win_index_3]

		if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
			return combo
		end
	end
	false
end

def full?(board)
	!(board.any? { |position| position == " "})
end

def draw?(board)
	!won?(board) && full?(board)
end

def over?(board)
	draw?(board) || won?(board)
end

def winner(board)
	if won?(board)
		board[won?(board)[0]]
	else
		nil
	end
end