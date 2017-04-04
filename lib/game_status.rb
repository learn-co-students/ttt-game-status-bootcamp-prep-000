# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
]

#SHOUDL HAVE USED .each do |x| end BUT SHIT HAPPENS

def won? (board)
  if (board[WIN_COMBINATIONS[0][0]] == 'X' && board[WIN_COMBINATIONS[0][1]] == 'X' && board[WIN_COMBINATIONS[0][2]] == 'X')
    return WIN_COMBINATIONS[0]
  elsif (board[WIN_COMBINATIONS[0][0]] == 'O' && board[WIN_COMBINATIONS[0][1]] == 'O' && board[WIN_COMBINATIONS[0][2]] == 'O')
    return WIN_COMBINATIONS[0]
  end

  if (board[WIN_COMBINATIONS[1][0]] == 'X' && board[WIN_COMBINATIONS[1][1]] == 'X' && board[WIN_COMBINATIONS[1][2]] == 'X')
    return WIN_COMBINATIONS[1]
  elsif (board[WIN_COMBINATIONS[1][0]] == 'O' && board[WIN_COMBINATIONS[1][1]] == 'O' && board[WIN_COMBINATIONS[1][2]] == 'O')
    return WIN_COMBINATIONS[1]
  end

  if (board[WIN_COMBINATIONS[2][0]] == 'X' && board[WIN_COMBINATIONS[2][1]] == 'X' && board[WIN_COMBINATIONS[2][2]] == 'X')
    return WIN_COMBINATIONS[2]
  elsif (board[WIN_COMBINATIONS[2][0]] == 'O' && board[WIN_COMBINATIONS[2][1]] == 'O' && board[WIN_COMBINATIONS[2][2]] == 'O')
    return WIN_COMBINATIONS[2]
  end

  if (board[WIN_COMBINATIONS[3][0]] == 'X' && board[WIN_COMBINATIONS[3][1]] == 'X' && board[WIN_COMBINATIONS[3][2]] == 'X')
    return WIN_COMBINATIONS[3]
  elsif (board[WIN_COMBINATIONS[3][0]] == 'O' && board[WIN_COMBINATIONS[3][1]] == 'O' && board[WIN_COMBINATIONS[3][2]] == 'O')
    return WIN_COMBINATIONS[3]
  end

  if (board[WIN_COMBINATIONS[4][0]] == 'X' && board[WIN_COMBINATIONS[4][1]] == 'X' && board[WIN_COMBINATIONS[4][2]] == 'X')
    return WIN_COMBINATIONS[4]
  elsif (board[WIN_COMBINATIONS[4][0]] == 'O' && board[WIN_COMBINATIONS[4][1]] == 'O' && board[WIN_COMBINATIONS[4][2]] == 'O')
    return WIN_COMBINATIONS[4]
  end

  if (board[WIN_COMBINATIONS[5][0]] == 'X' && board[WIN_COMBINATIONS[5][1]] == 'X' && board[WIN_COMBINATIONS[5][2]] == 'X')
    return WIN_COMBINATIONS[5]
  elsif (board[WIN_COMBINATIONS[5][0]] == 'O' && board[WIN_COMBINATIONS[5][1]] == 'O' && board[WIN_COMBINATIONS[5][2]] == 'O')
    return WIN_COMBINATIONS[5]
  end
  if (board[WIN_COMBINATIONS[6][0]] == 'X' && board[WIN_COMBINATIONS[6][1]] == 'X' && board[WIN_COMBINATIONS[6][2]] == 'X')
    return WIN_COMBINATIONS[6]
  elsif (board[WIN_COMBINATIONS[6][0]] == 'O' && board[WIN_COMBINATIONS[6][1]] == 'O' && board[WIN_COMBINATIONS[6][2]] == 'O')
    return WIN_COMBINATIONS[6]
  end
  if (board[WIN_COMBINATIONS[7][0]] == 'X' && board[WIN_COMBINATIONS[7][1]] == 'X' && board[WIN_COMBINATIONS[7][2]] == 'X')
    return WIN_COMBINATIONS[7]
  elsif (board[WIN_COMBINATIONS[7][0]] == 'O' && board[WIN_COMBINATIONS[7][1]] == 'O' && board[WIN_COMBINATIONS[7][2]] == 'O')
    return WIN_COMBINATIONS[7]
  end
else
  return false
end

def full? (board)
  board.each do |index| 
    if index == " " || index == nil
      return false
    end
  end
  return true
end

def draw? (board)
  result1 = won?(board)
  result2 = full?(board)

  if result1 == false && result2 == true
    return true
  else false
  end
  
end

def over? (board)
  won = won?(board)
  full = full?(board)
  draw = draw?(board)

  if won == true 
    return true
  elsif full == true 
    return true
  elsif draw == true
    return true
  else
    return false
  end
end
#PENDING FURTHER SOLUTION 
def winner? (board)

end