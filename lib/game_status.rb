def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    if (board[win_index_1] == 'X' && board[win_index_2] == 'X' && board[win_index_3] == 'X') ||
      (board[win_index_1] == 'O' && board[win_index_2] == 'O' && board[win_index_3] == 'O')
      return combo
    end
  end
  return false
end

def full?(board)
  full = [0,1,2,3,4,5,6,7,8]
  check = full.all? do |index|
    position_taken?(board,index)
  end
  return check
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if (draw?(board) || won?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if (over?(board) && !draw?(board))
    winpos = won?(board)
    return board[winpos[0]]
  else
    return nil
  end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
