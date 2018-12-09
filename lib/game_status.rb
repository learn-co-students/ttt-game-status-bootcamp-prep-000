# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  
  [0,4,8],
  [6,4,2],
  
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  
def won?(board)
  WIN_COMBINATIONS.each do |positions|
    if ( (board[positions[0]] == board[positions[1]]) && (board[positions[2]] == board[positions[1]]) )
      if board[positions[0]] == "X" || board[positions[0]] == "O"
        return positions
      end
    end
  end
  return false 
end

def full?(board)
  board.each do |pos|
    if(pos != "X" && pos != "O")
      return false 
    end
  end
  return true 
end

def draw?(board)
  if(won?(board))
    return false
  end
  return full?(board)
end

def over?(board)
  return draw?(board) || won?(board)
end
  
def winner(board)
  if(won?(board))
    return board[won?(board)[0]]
  end
  return nil 
end
  
