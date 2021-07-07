# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)

  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if (position_1 == position_2 && position_2 == position_3  && position_1 != " " && position_2 != " " && position_3 != " ")
      return win_combination
    end
  end

  return false

end

def full?(board)
  board.detect do |index|
    if(index == " ")
      return false
    end
  end

  return true
end

def draw?(board)
  if (full?(board))
    if !(won?(board))
      return true
    else
      return false
    end
  else
    false
  end
end

def over?(board)
  if (won?(board) || draw?(board) || full?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if !(won?(board))
    return nil
  else
    win_combination = won?(board)
    return board[win_combination[0]]
  end
end
