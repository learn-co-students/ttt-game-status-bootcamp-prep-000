# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # bottom row
  [0,3,6], # first column
  [1,4,7], # second column
  [2,5,8], # third column
  [0,4,8], # upper left to lower right
  [6,4,2]
]

def won?(board)
		WIN_COMBINATIONS.find { |combo|
				combo.all? {
						|comboIndex|
								board[comboIndex] == "X"
				} ||
						combo.all? {
						|comboIndex|
								board[comboIndex] == "O"
				}
		}
end

def full?(board)
		board.all? {
				|position|
				position != " "
		}
end

def draw?(board)
		if !won?(board) && full?(board)
				return true
		else
				return false
		end
end

def over?(board)
		full?(board) || draw?(board) || won?(board)
end

def winner(board)
		if won?(board)
				if (WIN_COMBINATIONS.find { |combo|
						combo.all? {
								|comboIndex|
										board[comboIndex] == "X"
						}})
						return "X"
				else
						return "O"
				end
		end
end


