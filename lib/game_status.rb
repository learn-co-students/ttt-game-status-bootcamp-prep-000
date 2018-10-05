def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # top row win
  [3,4,5], # middle row win
  [6,7,8], # bottom row win
  [0,3,6], # left column win
  [1,4,7], # middle column win
  [2,5,8], # right column win
  [0,4,8], # left diagnal win
  [2,4,6]  # right diagnol win
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|

    position_1 = combo[0]
    position_2 = combo[1]
    position_3 = combo[2]

    position_on_board_1 = board[position_1]
    position_on_board_2 = board[position_2]
    position_on_board_3 = board[position_3]

    if (position_on_board_1 == "X" && position_on_board_2 == "X" && position_on_board_3 == "X") || (position_on_board_1 == "O" && position_on_board_2 == "O" && position_on_board_3 == "O")
      return combo
    end
  end
  return false
end

def full?(board)
  board.all? do |spot_on_board|
    spot_on_board == "X" || spot_on_board == "O"
  end
end

def draw?(board)
  # returns true if the board has not been won & is full
  if won?(board) == false && full?(board) == true
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    true
  else
    false
  end
end


def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  end
end
