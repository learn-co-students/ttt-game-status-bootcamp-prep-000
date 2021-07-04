# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8],  # Bottom row
  [0,3,6],  #1st col
  [1,4,7],  #2nd col
  [2,5,8],  #3rd col
  [0,4,8],  #diagonal R
  [2,4,6],  #diagonal L
]

def won?(board)
  WIN_COMBINATIONS.each do |(x,y,z)|
    if board[x] == "X" && board[y] == "X" && board[z] == "X"
      return x,y,z # return the win_combination indexes that won.
    elsif board[x] == "O" && board[y] == "O" && board[z] == "O"
      return x,y,z
    end
  end
  false
end

def full?(board)
  board.none?{|i| i==" "}
end

def draw?(board)
  if(won?(board).is_a? Array)
    return false
  else
    full?(board)
  end
end

def over?(board)
  if draw?(board) || (won?(board).is_a? Array)
    return true
  end
  false
end

def winner(board)
  x=won?(board)
  if(x.is_a? Array)
    return board[x[0]]
  end
  nil
end
