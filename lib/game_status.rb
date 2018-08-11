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
  players = ["X", "O"]
  players.each do |player|
    WIN_COMBINATIONS.any? do |combo|
      if (board[combo[0]] == player) && (board[combo[1]] == player) && (board[combo[2]] == player)
        return combo
      end
    end
  end
  return false
end

def full?(board)
  board.none?{|piece| piece == " "}
end

def draw?(board)
  if won?(board)
    false
  elsif full?(board)
    true
  end
end

def over?(board)
  if (draw?(board) || full?(board) || won?(board))
    true
  end
end

def winner(board)
  pieces = won?(board)
  if pieces
    board[pieces[0]]
  end
end
