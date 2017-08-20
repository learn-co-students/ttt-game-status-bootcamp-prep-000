# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  winning = WIN_COMBINATIONS.any? do |win|
    (board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X") || (board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O")
  end
  if winning == true
    winboard = WIN_COMBINATIONS.select do |win|
      (board[win[0]] == "X" && board[win[1]] == "X" && board[win[2]] == "X") || (board[win[0]] == "O" && board[win[1]] == "O" && board[win[2]] == "O")
    end
    winboard[0]
  end
end

def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?(board)
  if full?(board) == true
    if won?(board) == nil
      return true
    end
  end
  false
end

def over?(board)
  if won?(board) != nil || full?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  winningboard = won?(board)
  if winningboard != nil
    winner = board[winningboard[0]]
  else
    nil
  end
end
