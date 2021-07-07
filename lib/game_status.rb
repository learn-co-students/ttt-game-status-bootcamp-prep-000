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
  [6,4,2]
  ]

def won?(board)
  
  WIN_COMBINATIONS.detect do |element|
    if (board[element[0]] == "X" && board[element[1]] == "X" && board[element[2]] == "X")
      true
    elsif(board[element[0]] == "O" && board[element[1]] == "O" && board[element[2]] == "O")
      true
    else
      false
    end
  end
end

def full?(board)
  counter = -1
  board.all? do |element|
    counter += 1
    position_taken?(board,counter)
  end
end

def draw?(board)
  
  if(won?(board))
    return false
  elsif(full?(board))
    return true
  else
    return false
  end
end

def over?(board)
  
  if(won?(board))
    return true
  elsif(draw?(board))
    return true
  else
    return false
  end
end

def winner(board)
  if(check = won?(board))
    return board[check[0]]
  end
end
