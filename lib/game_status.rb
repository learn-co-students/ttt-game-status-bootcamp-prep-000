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
  WIN_COMBINATIONS.select do |win_com|
    if (board[win_com[0]] == "X" && board[win_com[1]] == "X" && board[win_com[2]] == "X")
      return win_com
    elsif (board[win_com[0]] == "O" && board[win_com[1]] == "O" && board[win_com[2]] == "O")
      return win_com
    elsif board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      return nil
    end
  end
  false
end

def full?(board)
  board.all?{|i| (i == "X" || i == "O")}
end

def draw?(board)
  if (full?(board) && !won?(board))
    true
  elsif (!full?(board) && !won?(board))
    false
  elsif won?(board)
    false
  end
end

def over?(board)
  ((won?(board) || full?(board) || draw?(board)) ? true : false)
end

def winner(board)
  if (won?(board))
    return board[won?(board)[0]]
  else
    nil
  end
end
