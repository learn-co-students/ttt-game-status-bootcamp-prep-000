# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle Row
  [6,7,8], # Bottom Row
  [0,3,6], # Left Column
  [1,4,7], # Middle Column
  [2,5,8], # Right Column
  [0,4,8], # Left to Right
  [2,4,6]  # Right to Left
]

def won?(board)
  WIN_COMBINATIONS.detect { |wins|
    win_index_1 = wins[0]
    win_index_2 = wins[1]
    win_index_3 = wins[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return wins
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return wins
  else
    false
  end
  }

end

def full?(board)

  if board.any? { |e| e == " " }
    return false
  else
    return true
  end
end

def draw?(board)
  if won?(board)
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
  elsif full?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil
  end
end
