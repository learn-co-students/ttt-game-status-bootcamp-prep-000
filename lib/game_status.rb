# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],# bottom row
  [0,3,6],#left column
  [1,4,7],#middle column
  [2,5,8],#right column
  [0,4,8], #cross
  [2,4,6]
]
def won?(board)
   WIN_COMBINATIONS.each do |win_index|
   	 x_match = 0
	   o_match = 0
  	for pos in win_index
  		if board[pos] == "X"
  			x_match += 1
  			if x_match == 3
  				return win_index
  			end
		elsif board[pos] == "O"
  			o_match += 1
  			if o_match == 3
  				return win_index
			end
		else
			break;
		end
  	end
  end
	return false
end

def full?(board)
  board.none? do |el|
    el == " " || el == "   "
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  else false
end
end

def over?(board)
  if won?(board) != false || draw?(board) == true
    return true
  else false
  end
end

def winner(board)
ind = won?(board)
if ind == false
  return nil
 end
pos = ind[0]
if board[pos] == "X"
  return "X"
else return "O"
end
end
