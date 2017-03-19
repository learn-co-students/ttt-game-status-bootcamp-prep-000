WIN_COMBINATIONS = [
  [0, 1, 2],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 4, 6],
  [2, 5, 8],
  [3, 4, 5],
  [6, 7, 8]
]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won? (board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  end

  WIN_COMBINATIONS.each do |combo|
    player = board[combo[0]]

    position_2 = board[combo[1]]
    position_3 = board[combo[2]]

    if ((player == position_2) && (player == position_3) && (player != " "))
      return combo
    end
  end

  return false
end

def full? (board)
  board.all?{|token| token == "X" || token == "O"}
end

def draw? (board)
  if ((won?(board) == false) && (full?(board) == true))
    return true
  else
    return false
  end
end

def over? (board)
  if won?(board)
    return true
  elsif draw?(board)
    return true
  elsif full?(board)
    return true
  else
    return false
  end
end

def winner (board)
  if won?(board)
    combo = won?(board)
    player = board[combo[0]]
    return player
  else
    return nil
  end
end
