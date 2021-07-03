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
			if check_board.all? { |elements| elements == "X"}
				return win_combo
			elsif check_board.all? { |elements| elements == "O"}
				return win_combo 
			end
			a += 1
	end
	if board.any? { |elements| elements != " "}
  else
    return false
	end
end

def full?(board)
    if board.any? { |markers| markers == " "}
      return false
    else 
      return true
  end
end


def draw?(board)
  if won?(board).kind_of?(Array) == false && full?(board) == true
    return true
  else
    return false
  end
end


def over?(board)
  if draw?(board) == true
    return true
  elsif won?(board).kind_of?(Array) == true
  return true
  elsif full?(board) == false 
    return false
end
end


def winner(board)
  won_combo = won?(board)   
  if won?(board) == nil
    return nil
  elsif board[won_combo[0]] == "X"
    return "X"
  elsif board[won_combo[0]] == "O"
    return "O"
  end
end