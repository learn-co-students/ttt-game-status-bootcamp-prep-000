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
  [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |combination|

    if position_taken?(board, combination[0]) && position_taken?(board, combination[1]) && position_taken?(board, combination[2])
      position_1 = board[combination[0]]
      position_2 = board[combination[1]]
      position_3 = board[combination[2]]

      if position_1 == position_2 && position_2 == position_3
        return combination
      end
    end
  end
  return false
end

def full?(board)
  board.each do |position|
    if position != "X" && position != "O"
      return false
    end
  end
  return true
end

def draw?(board)
  if full?(board) &&  !won?(board)
    return true
  elsif !full?(board) && !won?(board)
    return false
  else
    false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  winning_combination = won?(board)
  if winning_combination
    return board[winning_combination[0]]
  else
    return nil
  end
end
