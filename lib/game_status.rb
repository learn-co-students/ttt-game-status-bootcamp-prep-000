# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS= [
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
  WIN_COMBINATIONS.each do |winCombo|
    positions = [board[winCombo[0]], board[winCombo[1]], board[winCombo[2]]]
    if positions[0] == positions[1] && positions[1] == positions[2]
      if positions[0] == "X" || positions[0] == "O"
        #win
        return winCombo
      end
    end
  end
  return false
end

def full?(board)
  board.all?{|i| i=="X" || i =="O"}
end

def draw?(board)
  if(won?(board)==false)
      if(full?(board))
          return true
      end
  end
  return false
end

def over?(board)
  if(draw?(board) || won?(board) || full?(board))
    return true
  end
  return false
end

def winner(board)
  if(won?(board).class == Array)
    return board[won?(board)[0]]
  end
end
