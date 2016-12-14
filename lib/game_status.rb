# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], # Top row 0
[3,4,5], # Middle row 1
[6,7,8], # bottom row 2

[0,3,6], # left column 3
[1,4,7], # middle column 4
[2,5,8], # right col 5

[0,4,8], # right diagonal 6
[2,4,6] # left diagonal 7
]
WIN = WIN_COMBINATIONS

def won?(board)

if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
		return false

  elsif board[0] == "X" && board[1] == "X" && board[2] == "X"
    xwin = true
    return WIN[0]
    elsif board[3] == "X" && board[4] == "X" && board[5] == "X"
    xwin = true
    return WIN[1]
    elsif board[6] == "X" && board[7] == "X" && board[8] == "X"
    xwin = true
    return WIN[2]
  elsif board[0] == "X" && board[3] == "X" && board[6] == "X"
  xwin = true
  return WIN[3]
elsif board[1] == "X" && board[4] == "X" && board[7] == "X"
xwin = true
return WIN[4]
elsif board[2] == "X" && board[5] == "X" && board[8] == "X"
  owin = true
  return WIN[5]
elsif board[0] == "X" && board[4] == "X" && board[8] == "X"
  owin = true
  return WIN[6]
elsif board[2] == "X" && board[4] == "X" && board[6] == "X"
  owin = true
  return WIN[7]

  elsif board[0] == "O" && board[1] == "O" && board[2] == "O"
    owin = true
    return WIN[0]
  elsif board[3] == "O" && board[4] == "O" && board[5] == "O"
    owin = true
    return WIN[1]
  elsif board[6] == "O" && board[7] == "O" && board[8] == "O"
    owin = true
    return WIN[2]
  elsif board[0] == "O" && board[3] == "O" && board[6] == "O"
    owin = true
    return WIN[3]
  elsif board[1] == "O" && board[4] == "O" && board[7] == "O"
    owin = true
    return WIN[4]
  elsif board[2] == "O" && board[5] == "O" && board[8] == "O"
    owin = true
    return WIN[5]
  elsif board[0] == "O" && board[4] == "O" && board[8] == "O"
    owin = true
    return WIN[6]
  elsif board[2] == "O" && board[4] == "O" && board[6] == "O"
    owin = true
    return WIN[7]
  else

    return false
  end
end

def full?(board)
	if board.include?(" ")       #if the board has any empty spaces, it's not full
		return false
	end
	return true
end



def draw?(board)
	if full?(board) && !won?(board)  # if board’s full and no one’s won
		return true 	             # it’s a draw
	else
		return false
end
end

def over?(board)
	if full?(board)              #if the board's full
		return true                #the game's over
	end
return false                   # >_> otherwise it's not
end

def winner(board)
victor = won?(board) ? board[won?(board)[0]] : nil
return victor
end
