# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end

  WIN_COMBINATIONS.each do | win_combination |
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
    else
       false
    end
  end

  return false
end


def full?(board)
  board.each do | position |
    if !(position == " ")
    else
      return false
    end
  end
  return true
end


def draw?(board)
  if (won?(board) == false) && full?(board)
    return true
  else
    return false
  end
  # return true if board has not been won and is full
  # return false if board is not won and board is not full
  # return false if the board is won
end

def over?(board)
  if draw?(board)
    true
  elsif won?(board)
    true
  else
    return false
  end
end

def winner(board)
  if won?(board) == false
      return nil
  else
    winning_combo = won?(board)
    first_position = winning_combo[0]
    if board[first_position] == "X"
      return "X"
    else
      return "O"
    end
  end
end


WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
