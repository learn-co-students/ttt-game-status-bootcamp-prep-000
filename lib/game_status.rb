# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.each { | combination |
    if (board[combination[0]] == board[combination[1]] && board[combination[1]] == board[combination[2]] && position_taken?(board, combination[0]))
      return combination
    end
  }
    
  return FALSE
end

def full?(board)
  board.each { | index |
    if (index == " " || index == nil)
      return FALSE
    else
      TRUE
    end
  }
end

def draw?(board)
  if (full?(board) && !won?(board))
    TRUE
  else
    FALSE
  end
end

def over?(board)
  if (won?(board) || draw?(board))
    TRUE
  else
    FALSE
  end
end

def winner(board)
  if (won?(board))
    return board[won?(board)[0]]
  else
    return nil
  end
end
