# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def won?(board)

  WIN_COMBINATIONS.each do |combo|
    return combo if (board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X" ||
    board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O" )
  end

  false if board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

end

def full?(board)
  true if board.none?{|i| i == " "}
end

def draw?(board)
  true if full?(board) && !(won?(board))
end

def over?(board)
  true if won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    win_array = won?(board)
    return board[win_array[0]]
  end
end
