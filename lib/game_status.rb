# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Mid row
  [6,7,8], # Btm row
  [0,3,6], # L columns
  [1,4,7], # M columns
  [2,5,8], # R columns
  [0,4,8], # R diagonal
  [6,4,2]  # L diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]

    pos_1 = board[index_1]
    pos_2 = board[index_2]
    pos_3 = board[index_3]

    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return win_combo
    end

  end
  return false
end

def full?(board)
  board.each do |i|
    if i == " "
      return false
    end
  end
    return true
end

def draw?(board)
  if won?(board) != false
    return false
  end
  return full?(board)
end

def over?(board)
  if won?(board) != false
    return true
  end
return draw?(board)
end

def winner(board)
win_combo = won?(board)
  if won?(board)
    return board[win_combo[0]]
  end
return nil
end
