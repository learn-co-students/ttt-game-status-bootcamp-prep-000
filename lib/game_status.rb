# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.detect do |combination|
    board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X" ||
    board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
  end
end

def full?(board)
  board.none? do |token|
    token == " "
  end
end
#if none of the slots in the board equals to a space then return true for draw else return false
#if any of the slots does not equal to a space then return true. The reason why it won't return false for
#an in progress board, is that any will return true if there is any element within the board that is not
#equal to a space.

#Build a method `#draw?` that accepts a board and returns true if the board has not been won and is full
#false if the board is not won and the board is not full
#false if the board is won.
#You should be able to compose this method solely using the methods you used above with some ruby logic.

def draw?(board)
  if !won?(board) && !full?(board) || won?(board)
    false
  else
    true
  end
end
#if no one won the game and the board is not full OR if someone won then it's not a draw therefore false

#Build a method `#over?` that accepts a board and returns true if the board has been won, is a draw, or is full.
def over?(board)
  if won?(board) || full?(board) || draw?(board)
    true
  else
    false
  end
end

#The `#winner` method should accept a board and return the token, "X" or "O" that has won the game given a
#winning board.
def winner(board)
  if won?(board)
  board[won?(board)[0]]
  else
    nil
  end
end

#if won?(board) is true (or if someone won the game), then take the first value of the return value of won?(board)
#and use it as the index for board. Recall that won?(board) returns the winning array of index in the board
#so to figure out the winning token, use any of the 3 indices for the board.
#example won?(board) returns [0,1,2] board[0]== "X" or "O"
