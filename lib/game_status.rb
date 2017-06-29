# Helper Method
board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def full?(board)
  !(board.any?{|i| i == " "})
end

def draw?(board)
  full?(board) && !won?(board)
end

def won?(board)
  WIN_COMBINATIONS.detect do | winArray |
    board[winArray[0]] == board[winArray[1]] && board[winArray[1]] == board[winArray[2]] && board[winArray[1]] != " "
  end
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    board[won?(board)[0]]
  end
end
