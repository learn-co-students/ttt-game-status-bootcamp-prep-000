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
  [2, 5, 8],
  [1, 4, 7],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)

  WIN_COMBINATIONS.each do |combination|

    # set the places we are checking
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    # fetch values from board
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return [win_index_1, win_index_2, win_index_3]

    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return [win_index_1, win_index_2, win_index_3]

    end



  end

  # we now need to return FALSE if true was never returned during the "each" loop - this covers any situation with no win condition
  return false

end

def full?(board)

  # check all elements and return TRUE only if all spaces are occupied
  board.all? do |space|
    space == "X" || space == "O"
  end

end

def draw?(board)

  if won?(board)
    false
  elsif !full?(board)
    false
  elsif full?(board)
    true

  end

end


def over?(board)

  if won?(board)
    true
  elsif draw?(board)
    true
  else
    false
  end

end

def winner(board)

  win_positions = won?(board)

  if won?(board)

    if board[win_positions[0]] == "X"
      return "X"
    elsif board[win_positions[0]] == "O"
      return "O"
    end

      # return nil if won? does not evaluate to true - no winner
      return nil
  end
end
