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
  if( board.all?{|i| i == " "} )
    false
  else
    WIN_COMBINATIONS.each do |combo|
      if( (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X") ||
          (board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O") )
        return combo
      end
    end
    false
  end
end

def full?(board)
  board.all?{|i| i == "X" || i == "O" }
end

def draw?(board)
  if( full?(board) == true && won?(board) == false )
    return true
  else
    false
  end
end

def over?(board)
  if(draw?(board) == true || (won?(board).class == Array))
    return true
  else
    false
  end
end

def winner(board)
  if(draw?(board) == over?(board))
    nil
  else
    won?(board).each do |index|
      if(board[index[0]] == "X" && board[index[1]] == "X" && board[index[2]] == "X")
        return "X"
      elsif(board[index[0]] == "O" && board[index[1]] == "O" && board[index[2]] == "O")
        return "O"
      end
    end
  end
end