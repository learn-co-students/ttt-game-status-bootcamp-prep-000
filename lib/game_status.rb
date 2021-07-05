# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
board = [" "," "," "," "," "," "," "," "," "]

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
  WIN_COMBINATIONS.detect do |winning|
    if (board[winning[0]]) == "X" && (board[winning[1]]) == "X" && (board[winning[2]]) == "X"
      return winning
    elsif (board[winning[0]]) == "O" && (board[winning[1]]) == "O" && (board[winning[2]]) == "O"
      return winning
    end
    false
  end
end

def full?(board)
  board.all? do |x| x != " "
end
end


def draw?(board)
  !(won?(board)) && (full?(board))
end

def over?(board)
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  WIN_COMBINATIONS.detect do |winning|
    if (board[winning[0]]) == "X" && (board[winning[1]]) == "X" && (board[winning[2]]) == "X"
      return "X"
    elsif (board[winning[0]]) == "O" && (board[winning[1]]) == "O" && (board[winning[2]]) == "O"
      return "O"
    end
    false
  end
end