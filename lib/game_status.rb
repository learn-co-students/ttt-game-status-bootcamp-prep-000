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
  WIN_COMBINATIONS.each do |combo|
    winner = combo

    if board[winner[0]] == "X" && board[winner[1]] == "X" && board[winner[2]] == "X"
      return winner
    end
    if board[winner[0]] == "O" && board[winner[1]] == "O" && board[winner[2]] == "O"
      return winner
    end
  end
  return false
end

def full?(board)
  board.all?{|spot| spot == "X" || spot == "O"}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || full?(board)
end

def winner(board)
  if winning_combo = won?(board)
    board[winning_combo[0]]
  end
end
