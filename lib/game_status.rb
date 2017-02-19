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

board = [" ", " ", " ", " ", " ", " ", "X", "X", "X"]

def winner(board)
  if over?(board) == true
    results = won?(board)
    return board[results[0]]
  elsif won?(board)
    results = won?(board)
    return board[results[0]]
  end
end

def over?(board)
  if draw?(board) || won?(board) || full?(board)
    return true
  end
  return false
end

def draw?(board)
    if full?(board) == true && won?(board) == false
      return true
    elsif !(full?(board))
      return false
    elsif won?(board)
      return false
    end

end

def full?(board)
  board.all? {|pos| pos == "X" || pos == "O"}
end


def won?(board)
  players = ["X","O"]
  players.each do |player|
    WIN_COMBINATIONS.each do |wincombo|
      if board[wincombo[0]] == player && board[wincombo[1]] == player && board[wincombo[2]] == player
        return wincombo
      end
    end
  end
  return false
end
