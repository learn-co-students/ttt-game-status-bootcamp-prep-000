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
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.select do |win|
    if position_taken?(board, win[0]) && board[win[0]] == board[win[1]] && board[win[0]] == board[win[2]]
      return win
    end
  end
  return false
end

def full?(board)
  board.all?{|fill| (fill == "X" || fill == "O")}
end

def draw?(board)
  if full?(board) && !(won?(board))
    return true
  end
  return false
end

def over?(board)
  if draw?(board) || won?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    if board[won?(board)[0]] == "X"
      return "X"
    elsif board[won?(board)[0]] == "O"
      return "O"
    end
  end
end
