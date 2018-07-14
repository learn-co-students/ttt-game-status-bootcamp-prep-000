# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  #rows
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #columns
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #diagnals
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each do |condition|
    if board[condition[0]] == "X" && board[condition[1]] == "X" && board[condition[2]] == "X"
      return condition
    elsif board[condition[0]] == "O" && board[condition[1]] == "O" && board[condition[2]] == "O"
      return condition
   end
 end
 return false
end

def full?(board)
  array_of_filled = board.select{|i| i == "X" || i == "O"}
  if array_of_filled.size == 9
    return true
  else
    return false
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end


def over?(board)
  if full?(board) == true || won?(board) != false || draw?(board) == true
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board) != false
    combination = won?(board)
    winner = board[combination[0]]
    return winner
  end
  return nil
end