# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

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
  WIN_COMBINATIONS.detect do |winc|
    board[winc[0]] == board[winc[1]] &&
    board[winc[1]] == board[winc[2]] &&
    (board[winc[0]] == "X" || board[winc[0]] == "O")
  end
end


def full?(board)
  board.all? do |fullb|
    fullb == "X" || fullb == "O"
  end
end


def draw?(board)
  (!won?(board) && full?(board))
end


def over?(board)
  (won?(board) || draw?(board))
end


def winner(board)
  if WIN_COMBINATIONS.detect do |winc|
    board[winc[0]] == board[winc[1]] &&
    board[winc[1]] == board[winc[2]] &&
    board[winc[0]] == "X"
    end
    "X"
  elsif WIN_COMBINATIONS.detect do |winc|
    board[winc[0]] == board[winc[1]] &&
    board[winc[1]] == board[winc[2]] &&
    board[winc[0]] == "O"
    end
    "O"
  else
    nil
  end
end
