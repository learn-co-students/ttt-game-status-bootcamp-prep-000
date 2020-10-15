

# list wining combinations
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

# check if there is a win
def won?(board)
  # loop through WIN_COMBINATIONS to see if any fit criteria below
  WIN_COMBINATIONS.any? do | combo |
    # assign array elements to postions
    position_1 = board[combo[0]]
    position_2 = board[combo[1]]
    position_3 = board[combo[2]]
    # check if the positions are all "X" or "O"
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      # if they do return that array combo
      return combo
    end
  end
end

# check if board is full
def full?(board)
  # check if all elements in board array are "X" or "O", => true if they are
  board.all? do | space |
    space == "X" || space == "O"
  end
end

# => (board full, now win) : (no win, not full) (win)
def draw?(board)
  # checks if board is full without a win
  if full?(board) == true && won?(board) == false
    return true
  end
end

# => won, draw, full : anything else
def over?(board)
  # returns true if #won? doesn't return array, it is a draw, or board is full
  if won?(board) != false || draw?(board) == true || full?(board) == true
    return true
  end
end

# => tolken of winner | "X" or "O"
def winner(board)
  # assigns value of #won? to winner_tolken
  winner_tolken = won?(board)
  # if there was a winner it returns an array
  if winner_tolken != false
    # return what the element in the winning position is | "X" or "O"
    return board[winner_tolken[0]]
  end
end
