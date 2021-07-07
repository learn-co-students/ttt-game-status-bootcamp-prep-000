def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # mid row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # diag1
  [2,4,6] # diag2
  ]

def won?(board)
  WIN_COMBINATIONS.detect do |arr|
    if board[arr[0]] == board[arr[1]] && board[arr[0]] == board[arr[2]] && board[arr[0]] != ' '
      return arr
    end
  end
end
       
def full?(board)
  board.all? do |element|
    element == 'X' || element == 'O'
    end
end

def draw?(board)
 if !won?(board)
   return true
 end
end

def over?(board)
  if full?(board) || won?(board) 
    return true
  end
end

def winner(board)
  if won?(board)
    arr = won?(board)
  return board[arr[0]]
end
end
