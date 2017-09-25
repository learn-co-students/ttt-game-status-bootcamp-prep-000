# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

def won?(board)
  WIN_COMBINATIONS.each do |comb|
    #puts comb.display
    win_comb = comb
    if(board[comb[0]]===board[comb[1]]&&board[comb[0]]===board[comb[2]])&&(board[comb[0]] != " ")
      return win_comb
    end
  end
  return false
end

def full?(board)
  i = 0
  full = true
  while i < 10
    if board[i] === " "
      full = false
    end
    i += 1
  end
  return full
end

def draw?(board)
  if (full?(board) && !won?(board))
    return true
  else
    #board is not full
    return false
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
  if won?(board) === false
    return nil
  else
    return board[won?(board)[0]]
  end
end
