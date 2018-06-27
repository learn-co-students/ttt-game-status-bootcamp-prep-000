# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]


def won?(board)

win_combo_length = WIN_COMBINATIONS.length - 1
	for a in 0..win_combo_length
	win_combo= WIN_COMBINATIONS[a]
	check_board = []
	
		for i in 0..2
		check_board.push(board[win_combo[i]])
		i += 1
		end
			if check_board.all? { |elements| elements == "X" || elements == "O"}
				return win_combo
			else
		  a += 1
		end	
	end
	if board.all? { |markers| markers != ""}
	  return false
	elsif full?(board) == true
    return false
	end
end


def full?(board)
    if board.any? { |markers| markers != ""}
    return false
  elsif draw?(board) == true
  end
end


def draw?(board)
  won?(board) == false && full?(board) == true
end


def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board) ==true && full?(board) == true
  return true
  elsif won?(board) ==true && full?(board) == false
  return true
  elsif full?(board) == false 
    return false
end
end


def winner(board)

end