# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #middle column
  [2,5,8], #third column
  [0,4,8], #negative diagonal
  [6,4,2] #positive diagonal
]

def won?(board)
  WIN_COMBINATIONS.detect do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[1])
  end
end


def full?(board)
  board.all? { |space| space == "X" || space == "O" }
end


def draw?(board)
  WIN_COMBINATIONS.none? do |combo|
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[1])
  end
end

def over?(board)
  if full?(board) == true
    return true
  else
    false
  end
end


def winner(board)
  if the_winner = won?(board)
   board[the_winner.first]
  end
end
