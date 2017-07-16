# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #left diagonal
  [2,4,6]  #right diagonal
]

board = ["X", "O", "X", "O", "X", "O", "X", "X", "O"]

def won?(board)
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|position| board[position] == "X"} || combo.all? {|position| board[position] == "O"}
        return combo
      end
    end
    return false
end


def full?(board)
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  full?(board) && won?(board) == false
end

def over?(board)
  draw?(board) || won?(board) != false
end

def winner(board)
  index = won?(board)
  if index
    board[index[0]]
  else
    nil
  end
end
