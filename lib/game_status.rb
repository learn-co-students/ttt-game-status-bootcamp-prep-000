# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #first column win
  [1,4,7], #second column win
  [2,5,8], #third column win
  [0,4,8], #diagonal win
  [2,4,6] #diagonal win
]

def won?(board)
  won = false
  WIN_COMBINATIONS.detect do |combo|
    if board[combo[0]] == " "
      won = false
    elsif board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
      won = combo
    end
  end
  won
end

def full?(board)
  board.none?{|space| space == " "}
end

def draw?(board)
  won?(board) == false && full?(board) ? true : false
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board) != false
    board[won?(board)[0]]
  end
end
