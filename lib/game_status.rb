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
  [2, 4 ,6]
]

def won?(board)
  WIN_COMBINATIONS.any? do |combination|
    pos_0 = combination[0]
    pos_1 = combination[1]
    pos_2 = combination[2]
    val = board[pos_0]

    if val != " " && val != "" && board[pos_1] == val && board[pos_2] == val
      return combination
    end
  end
  return false
end

def full?(board)
  board.each do |val|
    if val == " " || val == ""
      return false
    end
  end
  return true
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  end
  return false
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
  return false
end

def winner(board)
  combination = won?(board)  # Win combination or false.
  if combination
    return board[combination[0]]  # combination[0] would be a board position
                                  # where winner had made a move.
  end
end
