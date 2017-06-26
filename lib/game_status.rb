# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                    [0,1,2],  #top row
                    [3,4,5],  #mid row
                    [6,7,8],  #bottom row
                    [0,3,6],  # 1st col
                    [1,4,7],  # 2nd col
                    [2,5,8],  # 3rd col
                    [0,4,8],  # 1st diagonal
                    [2,4,6],  # 2nd diagonal
                  ]

def won?(board)
  WIN_COMBINATIONS.each { |x|
    if ((board[x[0]] == "X" && board[x[1]] == "X" && board[x[2]] == "X") || (board[x[0]] == "O" && board[x[1]] == "O" && board[x[2]] == "O"))
      return x
    else
      false
    end
  }
  board.any?{|player| player == "X" || player == "O"}
  if full?(board)
    false
  end
end

def full?(board)
  board.none? { |x|
    x == " " || x == ""
  }
end

def draw?(board)
  if over?(board) && !won?(board)
    true
  else
    false
  end
end

def over?(board)
  if won?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  winner = won?(board)
  if winner.kind_of?(Array)
    return board[winner[0]]
  else
    nil
  end
end
