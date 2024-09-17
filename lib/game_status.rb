# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6],
]
#defining won?
def won?(board)
  WIN_COMBINATIONS.detect do |combo|
  #looking for first situation on board where win_combition is present (all three index spots need to appear the same as well as defined as taken)
    board[combo[0]] == board[combo[1]] &&
    board[combo[1]] == board[combo[2]] &&
    position_taken?(board, combo[0])
  end
end

def full?(board)
  # conditional- only if all indexes on board array (all elements of board) are filled/ statement is truth
  board.all? do |position|
    position == "X" || position == "O"
  end
end

def draw?(board)
  # only a draw if no one won and the board is full
  full?(board) && !won?(board)
end

def over?(board)
  # if either cases is truthy the game is over - draw is truthy in this case
  won?(board) || full?(board)
end

def winner(board)
  # the positions of a winning combination if present will be set to a variable, winning_com and then the character X or O will be returned
  if winning_com = won?(board)
    board[winning_com.first]
  end
end
