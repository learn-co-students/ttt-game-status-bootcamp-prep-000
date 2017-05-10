# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant


WIN_COMBINATIONS = [
	#horizontal
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],

	#vertical
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],

	#diagonal
	[0, 4, 8],
	[2, 4, 6]
]

def won?(board)

 WIN_COMBINATIONS.each do |combinations|
   if board[combinations[0]] == "X" &&
      board[combinations[1]] == "X" &&
      board[combinations[2]] == "X"
      return combinations
   end
   if board[combinations[0]] == "O" &&
      board[combinations[1]] == "O" &&
      board[combinations[2]] == "O"
      return combinations
   end
 end
 return false
end


def full?(board)
  board.each do |position|
    if position == "" || position == " "
      return false
    end
  end
  return true
end


def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end


def over?(board)
 WIN_COMBINATIONS.each do |combination|
   if won?(board) == combination && draw?(board) && full?(board)
     return true
   end
 end
 if draw?(board)
   return true
 elsif full?(board)
   return true
 end
 return false
end


def winner(board)
  WIN_COMBINATIONS.each do |combination|
    if won?(board) == combination
      return board[combination[0]]
    end
  end
  return nil
end
