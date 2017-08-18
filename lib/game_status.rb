# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row winner
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left vertical
  [1,4,7], #middle vertical
  [2,5,8], #right vertical
  [0,4,8], #diagonal 1
  [2,4,6] #diagonal 2
]


def won?(board)
  WIN_COMBINATIONS.detect do |win_combo|
    board[win_combo[0]] == "X" && board[win_combo[1]] == "X" && board[win_combo[2]] == "X" ||
    board[win_combo[0]] == "O" && board[win_combo[1]] == "O" && board[win_combo[2]] == "O"
    end
end

def full?(board)
  board.all? do |space|
    space == "X" || space =="O"
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
  if won?(board) || draw?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end
