# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,4,8], #top left diagonal win
  [2,4,6], #top right diagonal win
  [0,3,6], #left column win
  [1,4,7], #middle column win
  [2,5,8] #right column win
]

def won?(board)
  WIN_COMBINATIONS.each do |x|
    win_index1 = x[0]
    win_index2 = x[1]
    win_index3 = x[2]

    if position_taken?(board, win_index1) == true && board[win_index2] == board[win_index1] && board[win_index3] == board[win_index1]
      return x
    end
  end
  return false
end

def full?(board)
  board.all? do |x| x == "X" || x == "O" end
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  else return false
  end
end

def winner(board)
  if won?(board) != false
    return board[won?(board)[0]]
  else
    return nil
  end
end
