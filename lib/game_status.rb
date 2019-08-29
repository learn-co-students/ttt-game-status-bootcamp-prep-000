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
  [6,4,2]
]
  
def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  else
    WIN_COMBINATIONS.any?{|combo|
      if position_taken?(board, combo[0])
        if board[combo[0]] == board[combo[1]] && board[combo[0]] == board[combo[2]]
          return combo
        end
      end
      }
    end
end

def full?(board)
  i = 0
  while i < board.length 
    if position_taken?(board,i) == false
      return false
      break
    else
      i += 1
    end
  end
  return true
end

def draw?(board)
  if full?(board) == true && won?(board) == false 
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board).is_a?(Array) || draw?(board)
    return true
  elsif !(full?(board))
    return false
  end
end

def winner(board)
  if draw?(board) || over?(board) == false
    return nil
  else
    return board[won?(board)[0]]
  end
end