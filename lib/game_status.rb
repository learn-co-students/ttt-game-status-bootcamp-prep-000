# Helper Method

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

def won?(board)
    WIN_COMBINATIONS.detect do |array|
       board[array[0]] == board[array[1]] && board[array[2]] == "X" && board[array[0]] == board[array[2]] ||
       board[array[0]] == board[array[1]] && board[array[2]] == "O" && board[array[0]] == board[array[2]]

    end
end

def full?(board)
  board.all? { |element| element == "X" || element == "O" }
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else return false
  end
end

def over?(board)
  if won?(board) || full?(board) || draw?(board)
    return true
  end
end

def winner(board)
  array = won?(board)
  if array == nil
    nil
  elsif board[array[0]] == "X"
    "X"
  else
    "O"
  end
end


#   if won?(board) board[array[0]] == "X"
#     return"X"
#   elsif won?(board) board[array[0]] == "O"
#     return"O"
#   else return nil
#   end
# end
